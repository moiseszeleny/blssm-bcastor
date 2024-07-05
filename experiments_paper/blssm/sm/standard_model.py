from scipy.interpolate import CubicSpline
from hepaid.hep.data import HEPDataSet
import numpy as np

class SM:
    def __init__(
        self,
        data
        ):
        self.data = data
        self.sm = HEPDataSet()
        self.sm.load_json(data)
        self.mh = np.array(
            self.sm.feature_vector(['SLHA','MASS','entries','25', 'value'])
            )[self.sm.complete_stack_ids]
        self._mh = np.array(
            self.sm.feature_vector(['SLHA','MASS','entries','25', 'value'])
            )
        self.br_h_aa = np.array(
            self.sm.feature_vector(
                ['SLHA','DECAY 25','entries','2,22,22', 'value']
                )
            )[self.sm.complete_stack_ids]

        self.cs_gg_h_aa = np.array(
            self.sm.feature_vector(
                ['MG5','gghaa','cross_section_pb']
                )
            )[self.sm.complete_stack_ids]
        self.cs_gg_h_tautau = np.array(
            self.sm.feature_vector(
                ['MG5','gghtautau','cross_section_pb']
                )
            )[self.sm.complete_stack_ids]

        cs_ee_hz_zbb = np.array(
            self.sm.feature_vector(
                ['MG5','eehzzbb','cross_section_pb']
                )
            )
        self.cs_ee_hz_zbb = cs_ee_hz_zbb[cs_ee_hz_zbb != None]

        self._pred_cs_gg_h_aa = CubicSpline(self.mh, self.cs_gg_h_aa)
        self._pred_cs_gg_h_tautau = CubicSpline(self.mh, self.cs_gg_h_tautau)
        self._pred_cs_ee_hz_zbb = CubicSpline(
            self._mh[cs_ee_hz_zbb != None],
            self.cs_ee_hz_zbb
            )

    def pred_br_h_aa(self, mh):
        '''Prediction of BR(h -> a a) from SPheno Decay Block'''
        return self._pred_br_h_aa(mh)

    def pred_cs_gg_h(self, mh):
        '''Preduction of cs(g g -> h) from generated with MadGraph'''
        return self._pred_cs_gg_h(mh)

    def pred_cs_gg_h_aa(self, mh):
        '''Preduction of cs(g g -> h -> a a) from generated with MadGraph'''
        return self._pred_cs_gg_h_aa(mh)

    def pred_cs_gg_h_tautau(self, mh):
        '''Preduction of cs(g g -> h -> tau tau) from generated with MadGraph'''
        return self._pred_cs_gg_h_tautau(mh)

    def pred_cs_ee_hz_zbb(self, mh):
        '''Preduction of cs(g g -> hz ->z b bbar) from generated with MadGraph'''
        return self._pred_cs_ee_hz_zbb(mh)
