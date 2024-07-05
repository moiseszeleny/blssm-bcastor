import streamlit as st
import pandas as pd
from hepaid.data import HEPDataSet
#from plots.plotly import CornerPlotly
from asp.search.corner_plot import CornerPlot
import numpy as np
#import plotly.express as px
import matplotlib.pyplot as plt
#import seaborn as sns
import re
from asp.search.objective_fn import ObjectiveDataSet
from pathlib import Path
import random 
col1, col2 = st.columns(2)

text_configuration = {
    'usetex': True,
    'axes_labels_size': 13,
    'ticks_labels_size': 12,
    'legend_font_size': 12
}

plt.rc('text', usetex=True)
plt.rc('axes', titlesize=text_configuration['axes_labels_size'])
plt.rc('axes', labelsize=text_configuration['axes_labels_size'])
plt.rc('xtick', labelsize=text_configuration['ticks_labels_size'])
plt.rc('ytick', labelsize=text_configuration['ticks_labels_size'])
plt.rc('legend', fontsize=text_configuration['legend_font_size'])
plt.rc('axes', linewidth=0.2)

labels= {
        'm0': r'$M_0$$\mathrm{(GeV)}$',
        'm12': r'$M_{1/2}$$\mathrm{(TeV)}$',
        'TanBeta': r'$\tan$ $\beta$',
        'Azero': r'$A_0$$\mathrm{(TeV)}$',
        'MuInput': r'$\mu$$\mathrm{(TeV)}$',
        'MuPInput': r'$\mu^\prime$$\mathrm{(TeV)}$',
        'BMuInput': r'$B\mu$$\mathrm{(TeV)}$',
        'BMuPInput': r'$B\mu^\prime$$\mathrm{(TeV)}$',
        'mu_aa': r'$\mu_{\gamma\gamma}$', 
        'mu_tautau': r'$\mu_{\tau\tau}$',
        'mu_bb': r'$\mu_{bb}$',
        'Mh(1)': r'$m_{h^\prime}$$\mathrm{(GeV)}$',
        'Mh(2)': r'$m_{h^{SM}}$$\mathrm{(GeV)}$',
        'csq(tot)': r'$\chi^2_{HS}$',
        'obsratio': r'$k_{0}^{HB}$'
    }
# Import data
obj_ds = ObjectiveDataSet()

obj_ds.load_json('/Users/madiaz/Documents/obsidian/Projects/active-search-pheno/experiments_paper/blssm/datasets/datasets/blssm/h1_mu_aabb_0/checkpoint')
#obj_ds.load_json('/Users/madiaz/Documents/obsidian/Projects/active-search-pheno/experiments_paper/blssm/datasets/datasets/blssm_sweep/run_8/checkpoint')


data = pd.DataFrame(obj_ds._dataset).astype(float)


df = data
select_sat = (df['obsratio']<1.) & (df['csq(tot)']< 136.6) & (df['Mh(1)']> 96 - 20)\
        & (df['Mh(1)'] < 96 + 20) & (df['Mh(2)'] > 125 - 20) & (df['Mh(2)'] < 125 + 20)\
                & (df['mu_aa'] > 0.27 - 0.09) & (df['mu_aa'] < 0.27 + 0.1) & (df['mu_bb'] > 0.06) & (df['mu_bb'] < 0.174) 


select = data.isna().any(axis=1)

class_array = np.zeros(len(select)).astype(int)
class_array[~select] = 1
class_array[select_sat] = 2

df['class'] = class_array

with col1:
    # Create corner plot first group
    st.title('b-CASTOR')
    parameters = list(data.columns[:4])
    min_val, max_val = 0, len(df)

    df_ = df.loc[:, parameters].iloc[min_val:max_val, :]
    df_['m12'] =  df_['m12'] / 1000
    df_['Azero'] =  df_['Azero'] / 1000
    df_['m0'] =df_['m0']# / 1000 
    labels_1 = [labels[p] for p in list(labels.keys())[:4]]


    cp = CornerPlot(None, parameters , labels=labels_1)
    #cp.add_trace(df_[class_array[min_val:max_val] == 0], r'$\mathrm{Non}$-$\mathrm{physical}$')
    cp.add_trace(df_[class_array[min_val:max_val] == 1], r'$\notin \mathcal{S}$')
    cp.add_trace(df_[class_array[min_val:max_val] == 2], r'$\in \mathcal{S}$')
    cp.update_legend()
    cp.clean()
    st.pyplot(cp.fig)
    cp.save('save_bb/bcastor_corner_params_group_1_presentation.pdf')

    # Create corner plot second group
    st.write(list(data.columns))
    parameters = list(data.columns[4:8])

    df1_ = df.loc[:, parameters].iloc[min_val:max_val, :]
    df1_['BMuInput'] =  np.log10(df1_['BMuInput'] / 1000)
    df1_['BMuPInput'] = np.log10(df1_['BMuPInput'] /1000)
    df1_['MuInput'] =  df1_['MuInput'] / 1000
    df1_['MuPInput'] = df1_['MuPInput'] / 1000
    labels_1 = [labels[p] for p in list(labels.keys())[4:8]]




    cp = CornerPlot(None, parameters , labels=labels_1)
    #cp.add_trace(df1_[class_array[min_val:max_val] == 0], r'$\mathrm{Non}$-$\mathrm{physical}$')
    cp.add_trace(df1_[class_array[min_val:max_val] == 1], r'$\notin \mathcal{S}$')
    cp.add_trace(df1_[class_array[min_val:max_val] == 2],  r'$\in \mathcal{S}$')
    cp.update_legend()
    cp.modify_single_ax_x(2,3)
    cp.modify_single_ax_y(0,2)
    cp.modify_single_ax_x(3,3)
    cp.modify_single_ax_y(0,3)
    cp.clean()
  
    st.pyplot(cp.fig)
    cp.save('save_bb/bcastor_corner_params_group_2_presentation.pdf')

    #cp.update_ticks()




    #cummulative_non_physical = [np.sum(select[:i]) for i in range(len(select))]
    cummulative_physical = [np.sum(~select[:i]) for i in range(len(select))]
    cummulative_physical_and_sat = [np.sum(select_sat[:i]) for i in range(len(select))]

    lines = pd.DataFrame({
        #'non_physical': cummulative_non_physical,
        'physical': cummulative_physical,
        'physical_and_sat': cummulative_physical_and_sat
    })
    tpu_bcastor = len(df1_[class_array[min_val:max_val] == 1]) +\
            len(df1_[class_array[min_val:max_val] == 2])

    st.write('total points used: ', tpu_bcastor) 
    
    # 
    parameters_mixed = ["m0","m12", "TanBeta", "Azero", "Mh(1)", "Mh(2)", 'class']
    parameters_mixed = ["m0","m12", "TanBeta", "Azero", "Mh(1)", "Mh(2)", 'mu_aa', 'mu_bb', 'class']

    df_ = df.loc[:, parameters_mixed].iloc[min_val:max_val, :].dropna()
    class_array = df_['class'].to_numpy()
    df_.drop(columns=['class'], inplace=True)
    parameters_mixed.pop()
    df_['m12'] =  df_['m12'] / 1000
    df_['Azero'] =  df_['Azero'] / 1000
    #df_['m0'] =df_['m0']# / 1000 
    #new_select = (df_['Mh(2)'] > 120) & (df_['Mh(2)'] < 128) & (df_['Azero'] > 3.4) & (df_['Mh(1)'] > 84) & (df_['m0'] < 950)
    #df_ = df_[new_select]


    labels_1 = [labels[p] for p in parameters_mixed]
    cp = CornerPlot(None, parameters_mixed , labels=labels_1, figsize=(10,9), n_ticks_per_axs=3 )
    #cp.add_trace(df_[class_array[min_val:max_val] == 0], r'$\mathrm{Non}$-$\mathrm{physical}$')
    cp.axs[4,0].set_ylabel(labels['Mh(1)'], color='#349f2a')
    for i in range(4):
        cp.axs[4,i].axhline(96 - 5, alpha=1, lw=0.7, color='#349f2a', zorder=0)
        cp.axs[4,i].axhline( 96 + 5, alpha=1, lw=0.7,  color='#349f2a', zorder=0)

    cp.axs[5,0].set_ylabel(labels['Mh(2)'], color='#349f2a')
    for i in range(5):
        cp.axs[5,i].axhline(125 - 5, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[5,i].axhline( 125 + 5, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[6,0].set_ylabel(labels['mu_aa'], color='#349f2a')
    for i in range(6):
        cp.axs[6,i].axhline( 0.27 - 0.09, alpha=1, lw=0.7, color='#349f2a')
        cp.axs[6,i].axhline(  0.27 + 0.1, alpha=1, lw=0.7,  color='#349f2a')

    cp.axs[7,0].set_ylabel(labels['mu_bb'], color='#349f2a')
    for i in range(7):
        cp.axs[7,i].axhline( 0.06, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[7,i].axhline( 0.174, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[-1,4].set_xlabel(labels['Mh(1)'], color='#349f2a')
    for i in range(5):
        cp.axs[-i,4].axvline(96 - 5, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[-i,4].axvline( 96 + 5, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[-1,5].set_xlabel(labels['Mh(2)'], color='#349f2a')
    for i in range(4):
        cp.axs[-i,5].axvline(125 - 5, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[-i,5].axvline( 125 + 5, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[-1,6].set_xlabel(labels['mu_aa'], color='#349f2a')
    for i in range(3):
        cp.axs[-i,6].axvline(0.27 - 0.09, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[-i,6].axvline(  0.27 + 0.1, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[-1,7].set_xlabel(labels['mu_bb'], color='#349f2a')
    for i in range(2):
        cp.axs[-i,7].axvline(0.06, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[-i,7].axvline(   0.174, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.add_trace(df_[class_array == 1], r'$\notin \mathcal{S}$')
    cp.add_trace(df_[class_array == 2], r'$\in \mathcal{S}$', alpha=0.8)

    
    cp.update_legend()
    plt.subplots_adjust(wspace=0.12, hspace=0.12)


    cp.clean()
    st.pyplot(cp.fig)
    cp.save('save_bb/bcastor_corner_params_group_mixed_presentation.pdf')

    select = class_array == 2
    ins_bcastor = np.cumsum(select)
    nins_bcastor = np.cumsum(~select)

def plot_mcmc():
    def get_runs_ids(directory_path):
        ids = []
        for filename in directory_path.iterdir():
            if filename.name.startswith('run_chckpnt_'):
            # Extract the random string part
                random_string = re.sub('run_chckpnt_', '', filename.name)
                ids.append(random_string.split('.')[0])
        return ids
    MCMC_PATH = Path('../../experiments_paper/blssm/mcmc_bb_blssm_runs_ray_1')
    RIDS = get_runs_ids(MCMC_PATH)
    data = []
    for rid in RIDS:
        df = pd.read_csv(MCMC_PATH / f'run_chckpnt_{rid}.csv',index_col=None)

        select_sat = (df['obsratio']<1.) & (df['csq(tot)']< 136.6) & (df['Mh(1)']> 96 - 20)\
                & (df['Mh(1)'] < 96 + 20) & (df['Mh(2)'] > 125 - 20) & (df['Mh(2)'] < 125 + 20)\
                        & (df['mu_aa'] > 0.27 - 0.09) & (df['mu_aa'] < 0.27 + 0.1) & (df['mu_bb'] > 0.06) & (df['mu_bb'] < 0.174) 


        select = df.isna().any(axis=1)

        class_array = np.zeros(len(select)).astype(int)
        class_array[~select] = 1
        class_array[select_sat] = 2

        df['class'] = class_array
           
                
        data.append(df)    

    

    #random.shuffle(data)        
    data = pd.concat(data)
    valid = data['class'] == 0
    total_valid = len(data[~valid])
    st.write('MCMC_SAT:, ', (data['class'] == 2).sum())
    st.write('MCMC/TOTAL:, ', (data['class'] == 2).sum()/total_valid)
    st.write('MCMC total:', total_valid)


################

    min_val, max_val = 0, len(data)
    parameters_mixed = ["m0","m12", "TanBeta", "Azero", "Mh(1)", "Mh(2)", 'mu_aa', 'mu_bb', 'class']

    df_ = data.loc[:, parameters_mixed].iloc[min_val:max_val, :].dropna()
    class_array = df_['class'].to_numpy()
    df_.drop(columns=['class'], inplace=True)
    parameters_mixed.pop()
    df_['m12'] =  df_['m12'] / 1000
    df_['Azero'] =  df_['Azero'] / 1000
    #df_['m0'] =df_['m0']# / 1000 
    #new_select = (df_['Mh(2)'] > 120) & (df_['Mh(2)'] < 128) & (df_['Azero'] > 3.4) & (df_['Mh(1)'] > 84) & (df_['m0'] < 950)
    #df_ = df_[new_select]


    labels_1 = [labels[p] for p in parameters_mixed]
    cp = CornerPlot(None, parameters_mixed , labels=labels_1, figsize=(10,9), n_ticks_per_axs=3 )
    #cp.add_trace(df_[class_array[min_val:max_val] == 0], r'$\mathrm{Non}$-$\mathrm{physical}$')
    cp.axs[4,0].set_ylabel(labels['Mh(1)'], color='#349f2a')
    for i in range(4):
        cp.axs[4,i].axhline(96 - 5, alpha=1, lw=0.7, color='#349f2a', zorder=0)
        cp.axs[4,i].axhline( 96 + 5, alpha=1, lw=0.7,  color='#349f2a', zorder=0)

    cp.axs[5,0].set_ylabel(labels['Mh(2)'], color='#349f2a')
    for i in range(5):
        cp.axs[5,i].axhline(125 - 5, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[5,i].axhline( 125 + 5, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[6,0].set_ylabel(labels['mu_aa'], color='#349f2a')
    for i in range(6):
        cp.axs[6,i].axhline( 0.27 - 0.09, alpha=1, lw=0.7, color='#349f2a')
        cp.axs[6,i].axhline(  0.27 + 0.1, alpha=1, lw=0.7,  color='#349f2a')

    cp.axs[7,0].set_ylabel(labels['mu_bb'], color='#349f2a')
    for i in range(7):
        cp.axs[7,i].axhline( 0.06, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[7,i].axhline( 0.174, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[-1,4].set_xlabel(labels['Mh(1)'], color='#349f2a')
    for i in range(5):
        cp.axs[-i,4].axvline(96 - 5, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[-i,4].axvline( 96 + 5, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[-1,5].set_xlabel(labels['Mh(2)'], color='#349f2a')
    for i in range(4):
        cp.axs[-i,5].axvline(125 - 5, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[-i,5].axvline( 125 + 5, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[-1,6].set_xlabel(labels['mu_aa'], color='#349f2a')
    for i in range(3):
        cp.axs[-i,6].axvline(0.27 - 0.09, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[-i,6].axvline(  0.27 + 0.1, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.axs[-1,7].set_xlabel(labels['mu_bb'], color='#349f2a')
    for i in range(2):
        cp.axs[-i,7].axvline(0.06, alpha=1, lw=0.7, color='#349f2a',  zorder=0)
        cp.axs[-i,7].axvline(   0.174, alpha=1, lw=0.7,  color='#349f2a',  zorder=0)

    cp.add_trace(df_[class_array == 1], r'$\notin \mathcal{S}$')
    cp.add_trace(df_[class_array == 2], r'$\in \mathcal{S}$', alpha=0.8)

    
    cp.update_legend()
    plt.subplots_adjust(wspace=0.12, hspace=0.12)


    cp.clean()
    st.pyplot(cp.fig)
    cp.save('save_bb/mcmc_r_corner_params_group_mixed_presentation.pdf')

    select = class_array == 2
    ins_bcastor = np.cumsum(select)
    nins_bcastor = np.cumsum(~select)
    return 

with col2:
    #st.title('MCMC-MH')
    plot_mcmc()
    #pass


    
fig, ax = plt.subplots(1,1, figsize=(4,3))

ax.plot(range(len(ins_bcastor)), ins_bcastor, label=f'b-CASTOR')
ax.set_ylabel(r'$\mathrm{Points} \in  \mathcal{S}$')
ax.set_xlabel(r'$\mathcal{H}_{\mathrm{B-L\ SSM}}\ \mathrm{calls}$')
ax.set_yscale('log')
ax.legend()
ax.grid()   
plt.savefig('save_bb/blssm_spoints_metric.pdf',bbox_inches='tight')

st.pyplot(fig)

st.write('points bcastor: {}'.format(ins_bcastor[-1]))


fig, ax = plt.subplots(1,1, figsize=(4,3))

bcastor_rate =ins_bcastor/np.arange(1,len(ins_bcastor)+1)
ax.plot(range(len(ins_bcastor)), bcastor_rate, label=f'b-CASTOR')
ax.set_ylabel(r'$\mathrm{Points} \in  \mathcal{S}/\ \mathrm{Total}$')
ax.set_xlabel(r'$\mathcal{H}_{\mathrm{B-L\ SSM}}\ \mathrm{calls}$')
ax.legend()
ax.grid()   
plt.savefig('save_bb/blssm_rate_metrics.pdf',bbox_inches='tight')
st.pyplot(fig)

st.write('Rate bcastor: {}'.format(bcastor_rate[-1]))

