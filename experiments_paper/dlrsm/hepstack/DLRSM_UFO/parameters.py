# ----------------------------------------------------------------------
# This model file was automatically created by SARAH version4.15.3
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840
# (c) Florian Staub, Mark Goodsell, Werner Porod and Martin Gabelmann 2023
# ----------------------------------------------------------------------
# File created at 21:31 on 18.6.2025
# ----------------------------------------------------------------------

from object_library import all_parameters,Parameter

from function_library import complexconjugate,re,im,csc,sec,acsc,asec
ZERO = Parameter(name='ZERO',
    nature='internal',
    type='real',
    value='0.0',
    texname='0')

Md1 = Parameter(name = 'Md1',
    nature = 'external',
    type = 'real',
    value = 0.0035,
    texname = 'M_{{d}_1}',
    lhablock = 'MASS',
    lhacode = [1])

Md2 = Parameter(name = 'Md2',
    nature = 'external',
    type = 'real',
    value = 0.104,
    texname = 'M_{{d}_2}',
    lhablock = 'MASS',
    lhacode = [3])

Md3 = Parameter(name = 'Md3',
    nature = 'external',
    type = 'real',
    value = 4.2,
    texname = 'M_{{d}_3}',
    lhablock = 'MASS',
    lhacode = [5])

Mu1 = Parameter(name = 'Mu1',
    nature = 'external',
    type = 'real',
    value = 0.0015,
    texname = 'M_{{u}_1}',
    lhablock = 'MASS',
    lhacode = [2])

Mu2 = Parameter(name = 'Mu2',
    nature = 'external',
    type = 'real',
    value = 1.27,
    texname = 'M_{{u}_2}',
    lhablock = 'MASS',
    lhacode = [4])

Mu3 = Parameter(name = 'Mu3',
    nature = 'external',
    type = 'real',
    value = 171.2,
    texname = 'M_{{u}_3}',
    lhablock = 'MASS',
    lhacode = [6])

Wu3 = Parameter(name = 'Wu3',
    nature = 'external',
    type = 'real',
    value = 1.51,
    texname = '\\Gamma_{{u}_3}',
    lhablock = 'DECAY',
    lhacode = [6])

Me1 = Parameter(name = 'Me1',
    nature = 'external',
    type = 'real',
    value = 0.000511,
    texname = 'M_{{e}_1}',
    lhablock = 'MASS',
    lhacode = [11])

Me2 = Parameter(name = 'Me2',
    nature = 'external',
    type = 'real',
    value = 0.105,
    texname = 'M_{{e}_2}',
    lhablock = 'MASS',
    lhacode = [13])

Me3 = Parameter(name = 'Me3',
    nature = 'external',
    type = 'real',
    value = 1.776,
    texname = 'M_{{e}_3}',
    lhablock = 'MASS',
    lhacode = [15])

Mnu1 = Parameter(name = 'Mnu1',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_1}',
    lhablock = 'MASS',
    lhacode = [12])

Wnu1 = Parameter(name = 'Wnu1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_1}',
    lhablock = 'DECAY',
    lhacode = [12])

Mnu2 = Parameter(name = 'Mnu2',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_2}',
    lhablock = 'MASS',
    lhacode = [14])

Wnu2 = Parameter(name = 'Wnu2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_2}',
    lhablock = 'DECAY',
    lhacode = [14])

Mnu3 = Parameter(name = 'Mnu3',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_3}',
    lhablock = 'MASS',
    lhacode = [16])

Wnu3 = Parameter(name = 'Wnu3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_3}',
    lhablock = 'DECAY',
    lhacode = [16])

Mnu4 = Parameter(name = 'Mnu4',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_4}',
    lhablock = 'MASS',
    lhacode = [6000012])

Wnu4 = Parameter(name = 'Wnu4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_4}',
    lhablock = 'DECAY',
    lhacode = [6000012])

Mnu5 = Parameter(name = 'Mnu5',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_5}',
    lhablock = 'MASS',
    lhacode = [6000014])

Wnu5 = Parameter(name = 'Wnu5',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_5}',
    lhablock = 'DECAY',
    lhacode = [6000014])

Mnu6 = Parameter(name = 'Mnu6',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_6}',
    lhablock = 'MASS',
    lhacode = [6000016])

Wnu6 = Parameter(name = 'Wnu6',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_6}',
    lhablock = 'DECAY',
    lhacode = [6000016])

Mnu7 = Parameter(name = 'Mnu7',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_7}',
    lhablock = 'MASS',
    lhacode = [99198])

Wnu7 = Parameter(name = 'Wnu7',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_7}',
    lhablock = 'DECAY',
    lhacode = [99198])

Mnu8 = Parameter(name = 'Mnu8',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_8}',
    lhablock = 'MASS',
    lhacode = [99199])

Wnu8 = Parameter(name = 'Wnu8',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_8}',
    lhablock = 'DECAY',
    lhacode = [99199])

Mnu9 = Parameter(name = 'Mnu9',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{\\nu}_9}',
    lhablock = 'MASS',
    lhacode = [99197])

Wnu9 = Parameter(name = 'Wnu9',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{\\nu}_9}',
    lhablock = 'DECAY',
    lhacode = [99197])

Mhh1 = Parameter(name = 'Mhh1',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{h}_1}',
    lhablock = 'MASS',
    lhacode = [25])

Whh1 = Parameter(name = 'Whh1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{h}_1}',
    lhablock = 'DECAY',
    lhacode = [25])

Mhh2 = Parameter(name = 'Mhh2',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{h}_2}',
    lhablock = 'MASS',
    lhacode = [35])

Whh2 = Parameter(name = 'Whh2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{h}_2}',
    lhablock = 'DECAY',
    lhacode = [35])

Mhh3 = Parameter(name = 'Mhh3',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{h}_3}',
    lhablock = 'MASS',
    lhacode = [335])

Whh3 = Parameter(name = 'Whh3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{h}_3}',
    lhablock = 'DECAY',
    lhacode = [335])

Mhh4 = Parameter(name = 'Mhh4',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{h}_4}',
    lhablock = 'MASS',
    lhacode = [445])

Whh4 = Parameter(name = 'Whh4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{h}_4}',
    lhablock = 'DECAY',
    lhacode = [445])

MAh3 = Parameter(name = 'MAh3',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{A^0}_3}',
    lhablock = 'MASS',
    lhacode = [36])

WAh3 = Parameter(name = 'WAh3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{A^0}_3}',
    lhablock = 'DECAY',
    lhacode = [36])

MAh4 = Parameter(name = 'MAh4',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{A^0}_4}',
    lhablock = 'MASS',
    lhacode = [46])

WAh4 = Parameter(name = 'WAh4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{A^0}_4}',
    lhablock = 'DECAY',
    lhacode = [46])

MHpm3 = Parameter(name = 'MHpm3',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{H^\\pm}_3}',
    lhablock = 'MASS',
    lhacode = [37])

WHpm3 = Parameter(name = 'WHpm3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{H^\\pm}_3}',
    lhablock = 'DECAY',
    lhacode = [37])

MHpm4 = Parameter(name = 'MHpm4',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{H^\\pm}_4}',
    lhablock = 'MASS',
    lhacode = [47])

WHpm4 = Parameter(name = 'WHpm4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{H^\\pm}_4}',
    lhablock = 'DECAY',
    lhacode = [47])

MZ = Parameter(name = 'MZ',
    nature = 'external',
    type = 'real',
    value = 91.1876,
    texname = 'M_{Z}',
    lhablock = 'MASS',
    lhacode = [23])

WZ = Parameter(name = 'WZ',
    nature = 'external',
    type = 'real',
    value = 2.4952,
    texname = '\\Gamma_{Z}',
    lhablock = 'DECAY',
    lhacode = [23])

MZp = Parameter(name = 'MZp',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{{Z^{\\prime}}}',
    lhablock = 'MASS',
    lhacode = [32])

WZp = Parameter(name = 'WZp',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{{Z^{\\prime}}}',
    lhablock = 'DECAY',
    lhacode = [32])

WWLm = Parameter(name = 'WWLm',
    nature = 'external',
    type = 'real',
    value = 2.141,
    texname = '\\Gamma_{W^-}',
    lhablock = 'DECAY',
    lhacode = [24])

MWRm = Parameter(name = 'MWRm',
    nature = 'external',
    type = 'real',
    value = 100.,
    texname = 'M_{W_R^-}',
    lhablock = 'MASS',
    lhacode = [34])

WWRm = Parameter(name = 'WWRm',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\Gamma_{W_R^-}',
    lhablock = 'DECAY',
    lhacode = [34])

rY11 = Parameter(name='rY11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y11}',
    lhablock = 'Y',
    lhacode = [1, 1] )

iY11 = Parameter(name='iY11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y11}',
    lhablock = 'IMY',
    lhacode = [1, 1] )

rY12 = Parameter(name='rY12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y12}',
    lhablock = 'Y',
    lhacode = [1, 2] )

iY12 = Parameter(name='iY12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y12}',
    lhablock = 'IMY',
    lhacode = [1, 2] )

rY13 = Parameter(name='rY13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y13}',
    lhablock = 'Y',
    lhacode = [1, 3] )

iY13 = Parameter(name='iY13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y13}',
    lhablock = 'IMY',
    lhacode = [1, 3] )

rY21 = Parameter(name='rY21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y21}',
    lhablock = 'Y',
    lhacode = [2, 1] )

iY21 = Parameter(name='iY21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y21}',
    lhablock = 'IMY',
    lhacode = [2, 1] )

rY22 = Parameter(name='rY22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y22}',
    lhablock = 'Y',
    lhacode = [2, 2] )

iY22 = Parameter(name='iY22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y22}',
    lhablock = 'IMY',
    lhacode = [2, 2] )

rY23 = Parameter(name='rY23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y23}',
    lhablock = 'Y',
    lhacode = [2, 3] )

iY23 = Parameter(name='iY23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y23}',
    lhablock = 'IMY',
    lhacode = [2, 3] )

rY31 = Parameter(name='rY31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y31}',
    lhablock = 'Y',
    lhacode = [3, 1] )

iY31 = Parameter(name='iY31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y31}',
    lhablock = 'IMY',
    lhacode = [3, 1] )

rY32 = Parameter(name='rY32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y32}',
    lhablock = 'Y',
    lhacode = [3, 2] )

iY32 = Parameter(name='iY32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y32}',
    lhablock = 'IMY',
    lhacode = [3, 2] )

rY33 = Parameter(name='rY33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y33}',
    lhablock = 'Y',
    lhacode = [3, 3] )

iY33 = Parameter(name='iY33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Y33}',
    lhablock = 'IMY',
    lhacode = [3, 3] )

rYQ111 = Parameter(name='rYQ111',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ111}',
    lhablock = 'YQ1',
    lhacode = [1, 1] )

iYQ111 = Parameter(name='iYQ111',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ111}',
    lhablock = 'IMYQ1',
    lhacode = [1, 1] )

rYQ112 = Parameter(name='rYQ112',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ112}',
    lhablock = 'YQ1',
    lhacode = [1, 2] )

iYQ112 = Parameter(name='iYQ112',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ112}',
    lhablock = 'IMYQ1',
    lhacode = [1, 2] )

rYQ113 = Parameter(name='rYQ113',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ113}',
    lhablock = 'YQ1',
    lhacode = [1, 3] )

iYQ113 = Parameter(name='iYQ113',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ113}',
    lhablock = 'IMYQ1',
    lhacode = [1, 3] )

rYQ121 = Parameter(name='rYQ121',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ121}',
    lhablock = 'YQ1',
    lhacode = [2, 1] )

iYQ121 = Parameter(name='iYQ121',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ121}',
    lhablock = 'IMYQ1',
    lhacode = [2, 1] )

rYQ122 = Parameter(name='rYQ122',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ122}',
    lhablock = 'YQ1',
    lhacode = [2, 2] )

iYQ122 = Parameter(name='iYQ122',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ122}',
    lhablock = 'IMYQ1',
    lhacode = [2, 2] )

rYQ123 = Parameter(name='rYQ123',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ123}',
    lhablock = 'YQ1',
    lhacode = [2, 3] )

iYQ123 = Parameter(name='iYQ123',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ123}',
    lhablock = 'IMYQ1',
    lhacode = [2, 3] )

rYQ131 = Parameter(name='rYQ131',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ131}',
    lhablock = 'YQ1',
    lhacode = [3, 1] )

iYQ131 = Parameter(name='iYQ131',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ131}',
    lhablock = 'IMYQ1',
    lhacode = [3, 1] )

rYQ132 = Parameter(name='rYQ132',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ132}',
    lhablock = 'YQ1',
    lhacode = [3, 2] )

iYQ132 = Parameter(name='iYQ132',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ132}',
    lhablock = 'IMYQ1',
    lhacode = [3, 2] )

rYQ133 = Parameter(name='rYQ133',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ133}',
    lhablock = 'YQ1',
    lhacode = [3, 3] )

iYQ133 = Parameter(name='iYQ133',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ133}',
    lhablock = 'IMYQ1',
    lhacode = [3, 3] )

rYQ211 = Parameter(name='rYQ211',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ211}',
    lhablock = 'YQ2',
    lhacode = [1, 1] )

iYQ211 = Parameter(name='iYQ211',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ211}',
    lhablock = 'IMYQ2',
    lhacode = [1, 1] )

rYQ212 = Parameter(name='rYQ212',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ212}',
    lhablock = 'YQ2',
    lhacode = [1, 2] )

iYQ212 = Parameter(name='iYQ212',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ212}',
    lhablock = 'IMYQ2',
    lhacode = [1, 2] )

rYQ213 = Parameter(name='rYQ213',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ213}',
    lhablock = 'YQ2',
    lhacode = [1, 3] )

iYQ213 = Parameter(name='iYQ213',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ213}',
    lhablock = 'IMYQ2',
    lhacode = [1, 3] )

rYQ221 = Parameter(name='rYQ221',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ221}',
    lhablock = 'YQ2',
    lhacode = [2, 1] )

iYQ221 = Parameter(name='iYQ221',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ221}',
    lhablock = 'IMYQ2',
    lhacode = [2, 1] )

rYQ222 = Parameter(name='rYQ222',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ222}',
    lhablock = 'YQ2',
    lhacode = [2, 2] )

iYQ222 = Parameter(name='iYQ222',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ222}',
    lhablock = 'IMYQ2',
    lhacode = [2, 2] )

rYQ223 = Parameter(name='rYQ223',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ223}',
    lhablock = 'YQ2',
    lhacode = [2, 3] )

iYQ223 = Parameter(name='iYQ223',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ223}',
    lhablock = 'IMYQ2',
    lhacode = [2, 3] )

rYQ231 = Parameter(name='rYQ231',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ231}',
    lhablock = 'YQ2',
    lhacode = [3, 1] )

iYQ231 = Parameter(name='iYQ231',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ231}',
    lhablock = 'IMYQ2',
    lhacode = [3, 1] )

rYQ232 = Parameter(name='rYQ232',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ232}',
    lhablock = 'YQ2',
    lhacode = [3, 2] )

iYQ232 = Parameter(name='iYQ232',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ232}',
    lhablock = 'IMYQ2',
    lhacode = [3, 2] )

rYQ233 = Parameter(name='rYQ233',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ233}',
    lhablock = 'YQ2',
    lhacode = [3, 3] )

iYQ233 = Parameter(name='iYQ233',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YQ233}',
    lhablock = 'IMYQ2',
    lhacode = [3, 3] )

rYt11 = Parameter(name='rYt11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt11}',
    lhablock = 'YT',
    lhacode = [1, 1] )

iYt11 = Parameter(name='iYt11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt11}',
    lhablock = 'IMYT',
    lhacode = [1, 1] )

rYt12 = Parameter(name='rYt12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt12}',
    lhablock = 'YT',
    lhacode = [1, 2] )

iYt12 = Parameter(name='iYt12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt12}',
    lhablock = 'IMYT',
    lhacode = [1, 2] )

rYt13 = Parameter(name='rYt13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt13}',
    lhablock = 'YT',
    lhacode = [1, 3] )

iYt13 = Parameter(name='iYt13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt13}',
    lhablock = 'IMYT',
    lhacode = [1, 3] )

rYt21 = Parameter(name='rYt21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt21}',
    lhablock = 'YT',
    lhacode = [2, 1] )

iYt21 = Parameter(name='iYt21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt21}',
    lhablock = 'IMYT',
    lhacode = [2, 1] )

rYt22 = Parameter(name='rYt22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt22}',
    lhablock = 'YT',
    lhacode = [2, 2] )

iYt22 = Parameter(name='iYt22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt22}',
    lhablock = 'IMYT',
    lhacode = [2, 2] )

rYt23 = Parameter(name='rYt23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt23}',
    lhablock = 'YT',
    lhacode = [2, 3] )

iYt23 = Parameter(name='iYt23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt23}',
    lhablock = 'IMYT',
    lhacode = [2, 3] )

rYt31 = Parameter(name='rYt31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt31}',
    lhablock = 'YT',
    lhacode = [3, 1] )

iYt31 = Parameter(name='iYt31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt31}',
    lhablock = 'IMYT',
    lhacode = [3, 1] )

rYt32 = Parameter(name='rYt32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt32}',
    lhablock = 'YT',
    lhacode = [3, 2] )

iYt32 = Parameter(name='iYt32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt32}',
    lhablock = 'IMYT',
    lhacode = [3, 2] )

rYt33 = Parameter(name='rYt33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt33}',
    lhablock = 'YT',
    lhacode = [3, 3] )

iYt33 = Parameter(name='iYt33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{Yt33}',
    lhablock = 'IMYT',
    lhacode = [3, 3] )

rYR11 = Parameter(name='rYR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR11}',
    lhablock = 'YR',
    lhacode = [1, 1] )

iYR11 = Parameter(name='iYR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR11}',
    lhablock = 'IMYR',
    lhacode = [1, 1] )

rYR12 = Parameter(name='rYR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR12}',
    lhablock = 'YR',
    lhacode = [1, 2] )

iYR12 = Parameter(name='iYR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR12}',
    lhablock = 'IMYR',
    lhacode = [1, 2] )

rYR13 = Parameter(name='rYR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR13}',
    lhablock = 'YR',
    lhacode = [1, 3] )

iYR13 = Parameter(name='iYR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR13}',
    lhablock = 'IMYR',
    lhacode = [1, 3] )

rYR21 = Parameter(name='rYR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR21}',
    lhablock = 'YR',
    lhacode = [2, 1] )

iYR21 = Parameter(name='iYR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR21}',
    lhablock = 'IMYR',
    lhacode = [2, 1] )

rYR22 = Parameter(name='rYR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR22}',
    lhablock = 'YR',
    lhacode = [2, 2] )

iYR22 = Parameter(name='iYR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR22}',
    lhablock = 'IMYR',
    lhacode = [2, 2] )

rYR23 = Parameter(name='rYR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR23}',
    lhablock = 'YR',
    lhacode = [2, 3] )

iYR23 = Parameter(name='iYR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR23}',
    lhablock = 'IMYR',
    lhacode = [2, 3] )

rYR31 = Parameter(name='rYR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR31}',
    lhablock = 'YR',
    lhacode = [3, 1] )

iYR31 = Parameter(name='iYR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR31}',
    lhablock = 'IMYR',
    lhacode = [3, 1] )

rYR32 = Parameter(name='rYR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR32}',
    lhablock = 'YR',
    lhacode = [3, 2] )

iYR32 = Parameter(name='iYR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR32}',
    lhablock = 'IMYR',
    lhacode = [3, 2] )

rYR33 = Parameter(name='rYR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR33}',
    lhablock = 'YR',
    lhacode = [3, 3] )

iYR33 = Parameter(name='iYR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{YR33}',
    lhablock = 'IMYR',
    lhacode = [3, 3] )

LAM2 = Parameter(name='LAM2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{LAM2}',
    lhablock = 'LRINPUT',
    lhacode = [2] )

LAM1 = Parameter(name='LAM1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{LAM1}',
    lhablock = 'LRINPUT',
    lhacode = [1] )

RHO1 = Parameter(name='RHO1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{RHO1}',
    lhablock = 'LRINPUT',
    lhacode = [8] )

RHO2 = Parameter(name='RHO2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{RHO2}',
    lhablock = 'LRINPUT',
    lhacode = [9] )

ALP2 = Parameter(name='ALP2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ALP2}',
    lhablock = 'LRINPUT',
    lhacode = [16] )

ALP1 = Parameter(name='ALP1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ALP1}',
    lhablock = 'LRINPUT',
    lhacode = [14] )

ALP3 = Parameter(name='ALP3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ALP3}',
    lhablock = 'LRINPUT',
    lhacode = [20] )

LAM5 = Parameter(name='LAM5',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{LAM5}',
    lhablock = 'LRINPUT',
    lhacode = [6] )

LAM6 = Parameter(name='LAM6',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{LAM6}',
    lhablock = 'LRINPUT',
    lhacode = [7] )

LAM3 = Parameter(name='LAM3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{LAM3}',
    lhablock = 'LRINPUT',
    lhacode = [4] )

LAM4 = Parameter(name='LAM4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{LAM4}',
    lhablock = 'LRINPUT',
    lhacode = [5] )

k1 = Parameter(name='k1',
    nature = 'external',
    type = 'real',
    value = 1.,
    texname = 'k_1',
    lhablock = 'HMIX',
    lhacode = [102] )

ZH11 = Parameter(name='ZH11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH11}',
    lhablock = 'SCALARMIX',
    lhacode = [1, 1] )

ZH12 = Parameter(name='ZH12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH12}',
    lhablock = 'SCALARMIX',
    lhacode = [1, 2] )

ZH13 = Parameter(name='ZH13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH13}',
    lhablock = 'SCALARMIX',
    lhacode = [1, 3] )

ZH14 = Parameter(name='ZH14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH14}',
    lhablock = 'SCALARMIX',
    lhacode = [1, 4] )

ZH21 = Parameter(name='ZH21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH21}',
    lhablock = 'SCALARMIX',
    lhacode = [2, 1] )

ZH22 = Parameter(name='ZH22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH22}',
    lhablock = 'SCALARMIX',
    lhacode = [2, 2] )

ZH23 = Parameter(name='ZH23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH23}',
    lhablock = 'SCALARMIX',
    lhacode = [2, 3] )

ZH24 = Parameter(name='ZH24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH24}',
    lhablock = 'SCALARMIX',
    lhacode = [2, 4] )

ZH31 = Parameter(name='ZH31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH31}',
    lhablock = 'SCALARMIX',
    lhacode = [3, 1] )

ZH32 = Parameter(name='ZH32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH32}',
    lhablock = 'SCALARMIX',
    lhacode = [3, 2] )

ZH33 = Parameter(name='ZH33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH33}',
    lhablock = 'SCALARMIX',
    lhacode = [3, 3] )

ZH34 = Parameter(name='ZH34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH34}',
    lhablock = 'SCALARMIX',
    lhacode = [3, 4] )

ZH41 = Parameter(name='ZH41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH41}',
    lhablock = 'SCALARMIX',
    lhacode = [4, 1] )

ZH42 = Parameter(name='ZH42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH42}',
    lhablock = 'SCALARMIX',
    lhacode = [4, 2] )

ZH43 = Parameter(name='ZH43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH43}',
    lhablock = 'SCALARMIX',
    lhacode = [4, 3] )

ZH44 = Parameter(name='ZH44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZH44}',
    lhablock = 'SCALARMIX',
    lhacode = [4, 4] )

UP11 = Parameter(name='UP11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP11}',
    lhablock = 'AMIX',
    lhacode = [1, 1] )

UP12 = Parameter(name='UP12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP12}',
    lhablock = 'AMIX',
    lhacode = [1, 2] )

UP13 = Parameter(name='UP13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP13}',
    lhablock = 'AMIX',
    lhacode = [1, 3] )

UP14 = Parameter(name='UP14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP14}',
    lhablock = 'AMIX',
    lhacode = [1, 4] )

UP21 = Parameter(name='UP21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP21}',
    lhablock = 'AMIX',
    lhacode = [2, 1] )

UP22 = Parameter(name='UP22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP22}',
    lhablock = 'AMIX',
    lhacode = [2, 2] )

UP23 = Parameter(name='UP23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP23}',
    lhablock = 'AMIX',
    lhacode = [2, 3] )

UP24 = Parameter(name='UP24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP24}',
    lhablock = 'AMIX',
    lhacode = [2, 4] )

UP31 = Parameter(name='UP31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP31}',
    lhablock = 'AMIX',
    lhacode = [3, 1] )

UP32 = Parameter(name='UP32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP32}',
    lhablock = 'AMIX',
    lhacode = [3, 2] )

UP33 = Parameter(name='UP33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP33}',
    lhablock = 'AMIX',
    lhacode = [3, 3] )

UP34 = Parameter(name='UP34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP34}',
    lhablock = 'AMIX',
    lhacode = [3, 4] )

UP41 = Parameter(name='UP41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP41}',
    lhablock = 'AMIX',
    lhacode = [4, 1] )

UP42 = Parameter(name='UP42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP42}',
    lhablock = 'AMIX',
    lhacode = [4, 2] )

UP43 = Parameter(name='UP43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP43}',
    lhablock = 'AMIX',
    lhacode = [4, 3] )

UP44 = Parameter(name='UP44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UP44}',
    lhablock = 'AMIX',
    lhacode = [4, 4] )

UC11 = Parameter(name='UC11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC11}',
    lhablock = 'CHMIX',
    lhacode = [1, 1] )

UC12 = Parameter(name='UC12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC12}',
    lhablock = 'CHMIX',
    lhacode = [1, 2] )

UC13 = Parameter(name='UC13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC13}',
    lhablock = 'CHMIX',
    lhacode = [1, 3] )

UC14 = Parameter(name='UC14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC14}',
    lhablock = 'CHMIX',
    lhacode = [1, 4] )

UC21 = Parameter(name='UC21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC21}',
    lhablock = 'CHMIX',
    lhacode = [2, 1] )

UC22 = Parameter(name='UC22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC22}',
    lhablock = 'CHMIX',
    lhacode = [2, 2] )

UC23 = Parameter(name='UC23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC23}',
    lhablock = 'CHMIX',
    lhacode = [2, 3] )

UC24 = Parameter(name='UC24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC24}',
    lhablock = 'CHMIX',
    lhacode = [2, 4] )

UC31 = Parameter(name='UC31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC31}',
    lhablock = 'CHMIX',
    lhacode = [3, 1] )

UC32 = Parameter(name='UC32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC32}',
    lhablock = 'CHMIX',
    lhacode = [3, 2] )

UC33 = Parameter(name='UC33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC33}',
    lhablock = 'CHMIX',
    lhacode = [3, 3] )

UC34 = Parameter(name='UC34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC34}',
    lhablock = 'CHMIX',
    lhacode = [3, 4] )

UC41 = Parameter(name='UC41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC41}',
    lhablock = 'CHMIX',
    lhacode = [4, 1] )

UC42 = Parameter(name='UC42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC42}',
    lhablock = 'CHMIX',
    lhacode = [4, 2] )

UC43 = Parameter(name='UC43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC43}',
    lhablock = 'CHMIX',
    lhacode = [4, 3] )

UC44 = Parameter(name='UC44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{UC44}',
    lhablock = 'CHMIX',
    lhacode = [4, 4] )

rZDL11 = Parameter(name='rZDL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL11}',
    lhablock = 'UDLMIX',
    lhacode = [1, 1] )

iZDL11 = Parameter(name='iZDL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL11}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 1] )

rZDL12 = Parameter(name='rZDL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL12}',
    lhablock = 'UDLMIX',
    lhacode = [1, 2] )

iZDL12 = Parameter(name='iZDL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL12}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 2] )

rZDL13 = Parameter(name='rZDL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL13}',
    lhablock = 'UDLMIX',
    lhacode = [1, 3] )

iZDL13 = Parameter(name='iZDL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL13}',
    lhablock = 'IMUDLMIX',
    lhacode = [1, 3] )

rZDL21 = Parameter(name='rZDL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL21}',
    lhablock = 'UDLMIX',
    lhacode = [2, 1] )

iZDL21 = Parameter(name='iZDL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL21}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 1] )

rZDL22 = Parameter(name='rZDL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL22}',
    lhablock = 'UDLMIX',
    lhacode = [2, 2] )

iZDL22 = Parameter(name='iZDL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL22}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 2] )

rZDL23 = Parameter(name='rZDL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL23}',
    lhablock = 'UDLMIX',
    lhacode = [2, 3] )

iZDL23 = Parameter(name='iZDL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL23}',
    lhablock = 'IMUDLMIX',
    lhacode = [2, 3] )

rZDL31 = Parameter(name='rZDL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL31}',
    lhablock = 'UDLMIX',
    lhacode = [3, 1] )

iZDL31 = Parameter(name='iZDL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL31}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 1] )

rZDL32 = Parameter(name='rZDL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL32}',
    lhablock = 'UDLMIX',
    lhacode = [3, 2] )

iZDL32 = Parameter(name='iZDL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL32}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 2] )

rZDL33 = Parameter(name='rZDL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL33}',
    lhablock = 'UDLMIX',
    lhacode = [3, 3] )

iZDL33 = Parameter(name='iZDL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDL33}',
    lhablock = 'IMUDLMIX',
    lhacode = [3, 3] )

rZDR11 = Parameter(name='rZDR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR11}',
    lhablock = 'UDRMIX',
    lhacode = [1, 1] )

iZDR11 = Parameter(name='iZDR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR11}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 1] )

rZDR12 = Parameter(name='rZDR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR12}',
    lhablock = 'UDRMIX',
    lhacode = [1, 2] )

iZDR12 = Parameter(name='iZDR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR12}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 2] )

rZDR13 = Parameter(name='rZDR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR13}',
    lhablock = 'UDRMIX',
    lhacode = [1, 3] )

iZDR13 = Parameter(name='iZDR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR13}',
    lhablock = 'IMUDRMIX',
    lhacode = [1, 3] )

rZDR21 = Parameter(name='rZDR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR21}',
    lhablock = 'UDRMIX',
    lhacode = [2, 1] )

iZDR21 = Parameter(name='iZDR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR21}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 1] )

rZDR22 = Parameter(name='rZDR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR22}',
    lhablock = 'UDRMIX',
    lhacode = [2, 2] )

iZDR22 = Parameter(name='iZDR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR22}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 2] )

rZDR23 = Parameter(name='rZDR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR23}',
    lhablock = 'UDRMIX',
    lhacode = [2, 3] )

iZDR23 = Parameter(name='iZDR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR23}',
    lhablock = 'IMUDRMIX',
    lhacode = [2, 3] )

rZDR31 = Parameter(name='rZDR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR31}',
    lhablock = 'UDRMIX',
    lhacode = [3, 1] )

iZDR31 = Parameter(name='iZDR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR31}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 1] )

rZDR32 = Parameter(name='rZDR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR32}',
    lhablock = 'UDRMIX',
    lhacode = [3, 2] )

iZDR32 = Parameter(name='iZDR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR32}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 2] )

rZDR33 = Parameter(name='rZDR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR33}',
    lhablock = 'UDRMIX',
    lhacode = [3, 3] )

iZDR33 = Parameter(name='iZDR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZDR33}',
    lhablock = 'IMUDRMIX',
    lhacode = [3, 3] )

rZUL11 = Parameter(name='rZUL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL11}',
    lhablock = 'UULMIX',
    lhacode = [1, 1] )

iZUL11 = Parameter(name='iZUL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL11}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 1] )

rZUL12 = Parameter(name='rZUL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL12}',
    lhablock = 'UULMIX',
    lhacode = [1, 2] )

iZUL12 = Parameter(name='iZUL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL12}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 2] )

rZUL13 = Parameter(name='rZUL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL13}',
    lhablock = 'UULMIX',
    lhacode = [1, 3] )

iZUL13 = Parameter(name='iZUL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL13}',
    lhablock = 'IMUULMIX',
    lhacode = [1, 3] )

rZUL21 = Parameter(name='rZUL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL21}',
    lhablock = 'UULMIX',
    lhacode = [2, 1] )

iZUL21 = Parameter(name='iZUL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL21}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 1] )

rZUL22 = Parameter(name='rZUL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL22}',
    lhablock = 'UULMIX',
    lhacode = [2, 2] )

iZUL22 = Parameter(name='iZUL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL22}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 2] )

rZUL23 = Parameter(name='rZUL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL23}',
    lhablock = 'UULMIX',
    lhacode = [2, 3] )

iZUL23 = Parameter(name='iZUL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL23}',
    lhablock = 'IMUULMIX',
    lhacode = [2, 3] )

rZUL31 = Parameter(name='rZUL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL31}',
    lhablock = 'UULMIX',
    lhacode = [3, 1] )

iZUL31 = Parameter(name='iZUL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL31}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 1] )

rZUL32 = Parameter(name='rZUL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL32}',
    lhablock = 'UULMIX',
    lhacode = [3, 2] )

iZUL32 = Parameter(name='iZUL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL32}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 2] )

rZUL33 = Parameter(name='rZUL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL33}',
    lhablock = 'UULMIX',
    lhacode = [3, 3] )

iZUL33 = Parameter(name='iZUL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUL33}',
    lhablock = 'IMUULMIX',
    lhacode = [3, 3] )

rZUR11 = Parameter(name='rZUR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR11}',
    lhablock = 'UURMIX',
    lhacode = [1, 1] )

iZUR11 = Parameter(name='iZUR11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR11}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 1] )

rZUR12 = Parameter(name='rZUR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR12}',
    lhablock = 'UURMIX',
    lhacode = [1, 2] )

iZUR12 = Parameter(name='iZUR12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR12}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 2] )

rZUR13 = Parameter(name='rZUR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR13}',
    lhablock = 'UURMIX',
    lhacode = [1, 3] )

iZUR13 = Parameter(name='iZUR13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR13}',
    lhablock = 'IMUURMIX',
    lhacode = [1, 3] )

rZUR21 = Parameter(name='rZUR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR21}',
    lhablock = 'UURMIX',
    lhacode = [2, 1] )

iZUR21 = Parameter(name='iZUR21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR21}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 1] )

rZUR22 = Parameter(name='rZUR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR22}',
    lhablock = 'UURMIX',
    lhacode = [2, 2] )

iZUR22 = Parameter(name='iZUR22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR22}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 2] )

rZUR23 = Parameter(name='rZUR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR23}',
    lhablock = 'UURMIX',
    lhacode = [2, 3] )

iZUR23 = Parameter(name='iZUR23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR23}',
    lhablock = 'IMUURMIX',
    lhacode = [2, 3] )

rZUR31 = Parameter(name='rZUR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR31}',
    lhablock = 'UURMIX',
    lhacode = [3, 1] )

iZUR31 = Parameter(name='iZUR31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR31}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 1] )

rZUR32 = Parameter(name='rZUR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR32}',
    lhablock = 'UURMIX',
    lhacode = [3, 2] )

iZUR32 = Parameter(name='iZUR32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR32}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 2] )

rZUR33 = Parameter(name='rZUR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR33}',
    lhablock = 'UURMIX',
    lhacode = [3, 3] )

iZUR33 = Parameter(name='iZUR33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZUR33}',
    lhablock = 'IMUURMIX',
    lhacode = [3, 3] )

rZEL11 = Parameter(name='rZEL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL11}',
    lhablock = 'UELMIX',
    lhacode = [1, 1] )

iZEL11 = Parameter(name='iZEL11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL11}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 1] )

rZEL12 = Parameter(name='rZEL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL12}',
    lhablock = 'UELMIX',
    lhacode = [1, 2] )

iZEL12 = Parameter(name='iZEL12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL12}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 2] )

rZEL13 = Parameter(name='rZEL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL13}',
    lhablock = 'UELMIX',
    lhacode = [1, 3] )

iZEL13 = Parameter(name='iZEL13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL13}',
    lhablock = 'IMUELMIX',
    lhacode = [1, 3] )

rZEL21 = Parameter(name='rZEL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL21}',
    lhablock = 'UELMIX',
    lhacode = [2, 1] )

iZEL21 = Parameter(name='iZEL21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL21}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 1] )

rZEL22 = Parameter(name='rZEL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL22}',
    lhablock = 'UELMIX',
    lhacode = [2, 2] )

iZEL22 = Parameter(name='iZEL22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL22}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 2] )

rZEL23 = Parameter(name='rZEL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL23}',
    lhablock = 'UELMIX',
    lhacode = [2, 3] )

iZEL23 = Parameter(name='iZEL23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL23}',
    lhablock = 'IMUELMIX',
    lhacode = [2, 3] )

rZEL31 = Parameter(name='rZEL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL31}',
    lhablock = 'UELMIX',
    lhacode = [3, 1] )

iZEL31 = Parameter(name='iZEL31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL31}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 1] )

rZEL32 = Parameter(name='rZEL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL32}',
    lhablock = 'UELMIX',
    lhacode = [3, 2] )

iZEL32 = Parameter(name='iZEL32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL32}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 2] )

rZEL33 = Parameter(name='rZEL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL33}',
    lhablock = 'UELMIX',
    lhacode = [3, 3] )

iZEL33 = Parameter(name='iZEL33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZEL33}',
    lhablock = 'IMUELMIX',
    lhacode = [3, 3] )

rZER11 = Parameter(name='rZER11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER11}',
    lhablock = 'UERMIX',
    lhacode = [1, 1] )

iZER11 = Parameter(name='iZER11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER11}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 1] )

rZER12 = Parameter(name='rZER12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER12}',
    lhablock = 'UERMIX',
    lhacode = [1, 2] )

iZER12 = Parameter(name='iZER12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER12}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 2] )

rZER13 = Parameter(name='rZER13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER13}',
    lhablock = 'UERMIX',
    lhacode = [1, 3] )

iZER13 = Parameter(name='iZER13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER13}',
    lhablock = 'IMUERMIX',
    lhacode = [1, 3] )

rZER21 = Parameter(name='rZER21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER21}',
    lhablock = 'UERMIX',
    lhacode = [2, 1] )

iZER21 = Parameter(name='iZER21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER21}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 1] )

rZER22 = Parameter(name='rZER22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER22}',
    lhablock = 'UERMIX',
    lhacode = [2, 2] )

iZER22 = Parameter(name='iZER22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER22}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 2] )

rZER23 = Parameter(name='rZER23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER23}',
    lhablock = 'UERMIX',
    lhacode = [2, 3] )

iZER23 = Parameter(name='iZER23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER23}',
    lhablock = 'IMUERMIX',
    lhacode = [2, 3] )

rZER31 = Parameter(name='rZER31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER31}',
    lhablock = 'UERMIX',
    lhacode = [3, 1] )

iZER31 = Parameter(name='iZER31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER31}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 1] )

rZER32 = Parameter(name='rZER32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER32}',
    lhablock = 'UERMIX',
    lhacode = [3, 2] )

iZER32 = Parameter(name='iZER32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER32}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 2] )

rZER33 = Parameter(name='rZER33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER33}',
    lhablock = 'UERMIX',
    lhacode = [3, 3] )

iZER33 = Parameter(name='iZER33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZER33}',
    lhablock = 'IMUERMIX',
    lhacode = [3, 3] )

rZM11 = Parameter(name='rZM11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM11}',
    lhablock = 'ZMMIX',
    lhacode = [1, 1] )

iZM11 = Parameter(name='iZM11',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM11}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 1] )

rZM12 = Parameter(name='rZM12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM12}',
    lhablock = 'ZMMIX',
    lhacode = [1, 2] )

iZM12 = Parameter(name='iZM12',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM12}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 2] )

rZM13 = Parameter(name='rZM13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM13}',
    lhablock = 'ZMMIX',
    lhacode = [1, 3] )

iZM13 = Parameter(name='iZM13',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM13}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 3] )

rZM14 = Parameter(name='rZM14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM14}',
    lhablock = 'ZMMIX',
    lhacode = [1, 4] )

iZM14 = Parameter(name='iZM14',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM14}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 4] )

rZM15 = Parameter(name='rZM15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM15}',
    lhablock = 'ZMMIX',
    lhacode = [1, 5] )

iZM15 = Parameter(name='iZM15',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM15}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 5] )

rZM16 = Parameter(name='rZM16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM16}',
    lhablock = 'ZMMIX',
    lhacode = [1, 6] )

iZM16 = Parameter(name='iZM16',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM16}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 6] )

rZM17 = Parameter(name='rZM17',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM17}',
    lhablock = 'ZMMIX',
    lhacode = [1, 7] )

iZM17 = Parameter(name='iZM17',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM17}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 7] )

rZM18 = Parameter(name='rZM18',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM18}',
    lhablock = 'ZMMIX',
    lhacode = [1, 8] )

iZM18 = Parameter(name='iZM18',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM18}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 8] )

rZM19 = Parameter(name='rZM19',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM19}',
    lhablock = 'ZMMIX',
    lhacode = [1, 9] )

iZM19 = Parameter(name='iZM19',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM19}',
    lhablock = 'IMZMMIX',
    lhacode = [1, 9] )

rZM21 = Parameter(name='rZM21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM21}',
    lhablock = 'ZMMIX',
    lhacode = [2, 1] )

iZM21 = Parameter(name='iZM21',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM21}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 1] )

rZM22 = Parameter(name='rZM22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM22}',
    lhablock = 'ZMMIX',
    lhacode = [2, 2] )

iZM22 = Parameter(name='iZM22',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM22}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 2] )

rZM23 = Parameter(name='rZM23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM23}',
    lhablock = 'ZMMIX',
    lhacode = [2, 3] )

iZM23 = Parameter(name='iZM23',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM23}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 3] )

rZM24 = Parameter(name='rZM24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM24}',
    lhablock = 'ZMMIX',
    lhacode = [2, 4] )

iZM24 = Parameter(name='iZM24',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM24}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 4] )

rZM25 = Parameter(name='rZM25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM25}',
    lhablock = 'ZMMIX',
    lhacode = [2, 5] )

iZM25 = Parameter(name='iZM25',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM25}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 5] )

rZM26 = Parameter(name='rZM26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM26}',
    lhablock = 'ZMMIX',
    lhacode = [2, 6] )

iZM26 = Parameter(name='iZM26',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM26}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 6] )

rZM27 = Parameter(name='rZM27',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM27}',
    lhablock = 'ZMMIX',
    lhacode = [2, 7] )

iZM27 = Parameter(name='iZM27',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM27}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 7] )

rZM28 = Parameter(name='rZM28',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM28}',
    lhablock = 'ZMMIX',
    lhacode = [2, 8] )

iZM28 = Parameter(name='iZM28',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM28}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 8] )

rZM29 = Parameter(name='rZM29',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM29}',
    lhablock = 'ZMMIX',
    lhacode = [2, 9] )

iZM29 = Parameter(name='iZM29',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM29}',
    lhablock = 'IMZMMIX',
    lhacode = [2, 9] )

rZM31 = Parameter(name='rZM31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM31}',
    lhablock = 'ZMMIX',
    lhacode = [3, 1] )

iZM31 = Parameter(name='iZM31',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM31}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 1] )

rZM32 = Parameter(name='rZM32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM32}',
    lhablock = 'ZMMIX',
    lhacode = [3, 2] )

iZM32 = Parameter(name='iZM32',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM32}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 2] )

rZM33 = Parameter(name='rZM33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM33}',
    lhablock = 'ZMMIX',
    lhacode = [3, 3] )

iZM33 = Parameter(name='iZM33',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM33}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 3] )

rZM34 = Parameter(name='rZM34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM34}',
    lhablock = 'ZMMIX',
    lhacode = [3, 4] )

iZM34 = Parameter(name='iZM34',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM34}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 4] )

rZM35 = Parameter(name='rZM35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM35}',
    lhablock = 'ZMMIX',
    lhacode = [3, 5] )

iZM35 = Parameter(name='iZM35',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM35}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 5] )

rZM36 = Parameter(name='rZM36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM36}',
    lhablock = 'ZMMIX',
    lhacode = [3, 6] )

iZM36 = Parameter(name='iZM36',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM36}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 6] )

rZM37 = Parameter(name='rZM37',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM37}',
    lhablock = 'ZMMIX',
    lhacode = [3, 7] )

iZM37 = Parameter(name='iZM37',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM37}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 7] )

rZM38 = Parameter(name='rZM38',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM38}',
    lhablock = 'ZMMIX',
    lhacode = [3, 8] )

iZM38 = Parameter(name='iZM38',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM38}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 8] )

rZM39 = Parameter(name='rZM39',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM39}',
    lhablock = 'ZMMIX',
    lhacode = [3, 9] )

iZM39 = Parameter(name='iZM39',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM39}',
    lhablock = 'IMZMMIX',
    lhacode = [3, 9] )

rZM41 = Parameter(name='rZM41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM41}',
    lhablock = 'ZMMIX',
    lhacode = [4, 1] )

iZM41 = Parameter(name='iZM41',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM41}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 1] )

rZM42 = Parameter(name='rZM42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM42}',
    lhablock = 'ZMMIX',
    lhacode = [4, 2] )

iZM42 = Parameter(name='iZM42',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM42}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 2] )

rZM43 = Parameter(name='rZM43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM43}',
    lhablock = 'ZMMIX',
    lhacode = [4, 3] )

iZM43 = Parameter(name='iZM43',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM43}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 3] )

rZM44 = Parameter(name='rZM44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM44}',
    lhablock = 'ZMMIX',
    lhacode = [4, 4] )

iZM44 = Parameter(name='iZM44',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM44}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 4] )

rZM45 = Parameter(name='rZM45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM45}',
    lhablock = 'ZMMIX',
    lhacode = [4, 5] )

iZM45 = Parameter(name='iZM45',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM45}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 5] )

rZM46 = Parameter(name='rZM46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM46}',
    lhablock = 'ZMMIX',
    lhacode = [4, 6] )

iZM46 = Parameter(name='iZM46',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM46}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 6] )

rZM47 = Parameter(name='rZM47',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM47}',
    lhablock = 'ZMMIX',
    lhacode = [4, 7] )

iZM47 = Parameter(name='iZM47',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM47}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 7] )

rZM48 = Parameter(name='rZM48',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM48}',
    lhablock = 'ZMMIX',
    lhacode = [4, 8] )

iZM48 = Parameter(name='iZM48',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM48}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 8] )

rZM49 = Parameter(name='rZM49',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM49}',
    lhablock = 'ZMMIX',
    lhacode = [4, 9] )

iZM49 = Parameter(name='iZM49',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM49}',
    lhablock = 'IMZMMIX',
    lhacode = [4, 9] )

rZM51 = Parameter(name='rZM51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM51}',
    lhablock = 'ZMMIX',
    lhacode = [5, 1] )

iZM51 = Parameter(name='iZM51',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM51}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 1] )

rZM52 = Parameter(name='rZM52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM52}',
    lhablock = 'ZMMIX',
    lhacode = [5, 2] )

iZM52 = Parameter(name='iZM52',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM52}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 2] )

rZM53 = Parameter(name='rZM53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM53}',
    lhablock = 'ZMMIX',
    lhacode = [5, 3] )

iZM53 = Parameter(name='iZM53',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM53}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 3] )

rZM54 = Parameter(name='rZM54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM54}',
    lhablock = 'ZMMIX',
    lhacode = [5, 4] )

iZM54 = Parameter(name='iZM54',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM54}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 4] )

rZM55 = Parameter(name='rZM55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM55}',
    lhablock = 'ZMMIX',
    lhacode = [5, 5] )

iZM55 = Parameter(name='iZM55',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM55}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 5] )

rZM56 = Parameter(name='rZM56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM56}',
    lhablock = 'ZMMIX',
    lhacode = [5, 6] )

iZM56 = Parameter(name='iZM56',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM56}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 6] )

rZM57 = Parameter(name='rZM57',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM57}',
    lhablock = 'ZMMIX',
    lhacode = [5, 7] )

iZM57 = Parameter(name='iZM57',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM57}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 7] )

rZM58 = Parameter(name='rZM58',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM58}',
    lhablock = 'ZMMIX',
    lhacode = [5, 8] )

iZM58 = Parameter(name='iZM58',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM58}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 8] )

rZM59 = Parameter(name='rZM59',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM59}',
    lhablock = 'ZMMIX',
    lhacode = [5, 9] )

iZM59 = Parameter(name='iZM59',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM59}',
    lhablock = 'IMZMMIX',
    lhacode = [5, 9] )

rZM61 = Parameter(name='rZM61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM61}',
    lhablock = 'ZMMIX',
    lhacode = [6, 1] )

iZM61 = Parameter(name='iZM61',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM61}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 1] )

rZM62 = Parameter(name='rZM62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM62}',
    lhablock = 'ZMMIX',
    lhacode = [6, 2] )

iZM62 = Parameter(name='iZM62',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM62}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 2] )

rZM63 = Parameter(name='rZM63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM63}',
    lhablock = 'ZMMIX',
    lhacode = [6, 3] )

iZM63 = Parameter(name='iZM63',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM63}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 3] )

rZM64 = Parameter(name='rZM64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM64}',
    lhablock = 'ZMMIX',
    lhacode = [6, 4] )

iZM64 = Parameter(name='iZM64',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM64}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 4] )

rZM65 = Parameter(name='rZM65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM65}',
    lhablock = 'ZMMIX',
    lhacode = [6, 5] )

iZM65 = Parameter(name='iZM65',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM65}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 5] )

rZM66 = Parameter(name='rZM66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM66}',
    lhablock = 'ZMMIX',
    lhacode = [6, 6] )

iZM66 = Parameter(name='iZM66',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM66}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 6] )

rZM67 = Parameter(name='rZM67',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM67}',
    lhablock = 'ZMMIX',
    lhacode = [6, 7] )

iZM67 = Parameter(name='iZM67',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM67}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 7] )

rZM68 = Parameter(name='rZM68',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM68}',
    lhablock = 'ZMMIX',
    lhacode = [6, 8] )

iZM68 = Parameter(name='iZM68',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM68}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 8] )

rZM69 = Parameter(name='rZM69',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM69}',
    lhablock = 'ZMMIX',
    lhacode = [6, 9] )

iZM69 = Parameter(name='iZM69',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM69}',
    lhablock = 'IMZMMIX',
    lhacode = [6, 9] )

rZM71 = Parameter(name='rZM71',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM71}',
    lhablock = 'ZMMIX',
    lhacode = [7, 1] )

iZM71 = Parameter(name='iZM71',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM71}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 1] )

rZM72 = Parameter(name='rZM72',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM72}',
    lhablock = 'ZMMIX',
    lhacode = [7, 2] )

iZM72 = Parameter(name='iZM72',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM72}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 2] )

rZM73 = Parameter(name='rZM73',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM73}',
    lhablock = 'ZMMIX',
    lhacode = [7, 3] )

iZM73 = Parameter(name='iZM73',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM73}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 3] )

rZM74 = Parameter(name='rZM74',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM74}',
    lhablock = 'ZMMIX',
    lhacode = [7, 4] )

iZM74 = Parameter(name='iZM74',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM74}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 4] )

rZM75 = Parameter(name='rZM75',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM75}',
    lhablock = 'ZMMIX',
    lhacode = [7, 5] )

iZM75 = Parameter(name='iZM75',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM75}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 5] )

rZM76 = Parameter(name='rZM76',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM76}',
    lhablock = 'ZMMIX',
    lhacode = [7, 6] )

iZM76 = Parameter(name='iZM76',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM76}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 6] )

rZM77 = Parameter(name='rZM77',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM77}',
    lhablock = 'ZMMIX',
    lhacode = [7, 7] )

iZM77 = Parameter(name='iZM77',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM77}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 7] )

rZM78 = Parameter(name='rZM78',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM78}',
    lhablock = 'ZMMIX',
    lhacode = [7, 8] )

iZM78 = Parameter(name='iZM78',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM78}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 8] )

rZM79 = Parameter(name='rZM79',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM79}',
    lhablock = 'ZMMIX',
    lhacode = [7, 9] )

iZM79 = Parameter(name='iZM79',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM79}',
    lhablock = 'IMZMMIX',
    lhacode = [7, 9] )

rZM81 = Parameter(name='rZM81',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM81}',
    lhablock = 'ZMMIX',
    lhacode = [8, 1] )

iZM81 = Parameter(name='iZM81',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM81}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 1] )

rZM82 = Parameter(name='rZM82',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM82}',
    lhablock = 'ZMMIX',
    lhacode = [8, 2] )

iZM82 = Parameter(name='iZM82',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM82}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 2] )

rZM83 = Parameter(name='rZM83',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM83}',
    lhablock = 'ZMMIX',
    lhacode = [8, 3] )

iZM83 = Parameter(name='iZM83',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM83}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 3] )

rZM84 = Parameter(name='rZM84',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM84}',
    lhablock = 'ZMMIX',
    lhacode = [8, 4] )

iZM84 = Parameter(name='iZM84',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM84}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 4] )

rZM85 = Parameter(name='rZM85',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM85}',
    lhablock = 'ZMMIX',
    lhacode = [8, 5] )

iZM85 = Parameter(name='iZM85',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM85}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 5] )

rZM86 = Parameter(name='rZM86',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM86}',
    lhablock = 'ZMMIX',
    lhacode = [8, 6] )

iZM86 = Parameter(name='iZM86',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM86}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 6] )

rZM87 = Parameter(name='rZM87',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM87}',
    lhablock = 'ZMMIX',
    lhacode = [8, 7] )

iZM87 = Parameter(name='iZM87',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM87}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 7] )

rZM88 = Parameter(name='rZM88',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM88}',
    lhablock = 'ZMMIX',
    lhacode = [8, 8] )

iZM88 = Parameter(name='iZM88',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM88}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 8] )

rZM89 = Parameter(name='rZM89',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM89}',
    lhablock = 'ZMMIX',
    lhacode = [8, 9] )

iZM89 = Parameter(name='iZM89',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM89}',
    lhablock = 'IMZMMIX',
    lhacode = [8, 9] )

rZM91 = Parameter(name='rZM91',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM91}',
    lhablock = 'ZMMIX',
    lhacode = [9, 1] )

iZM91 = Parameter(name='iZM91',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM91}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 1] )

rZM92 = Parameter(name='rZM92',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM92}',
    lhablock = 'ZMMIX',
    lhacode = [9, 2] )

iZM92 = Parameter(name='iZM92',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM92}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 2] )

rZM93 = Parameter(name='rZM93',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM93}',
    lhablock = 'ZMMIX',
    lhacode = [9, 3] )

iZM93 = Parameter(name='iZM93',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM93}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 3] )

rZM94 = Parameter(name='rZM94',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM94}',
    lhablock = 'ZMMIX',
    lhacode = [9, 4] )

iZM94 = Parameter(name='iZM94',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM94}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 4] )

rZM95 = Parameter(name='rZM95',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM95}',
    lhablock = 'ZMMIX',
    lhacode = [9, 5] )

iZM95 = Parameter(name='iZM95',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM95}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 5] )

rZM96 = Parameter(name='rZM96',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM96}',
    lhablock = 'ZMMIX',
    lhacode = [9, 6] )

iZM96 = Parameter(name='iZM96',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM96}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 6] )

rZM97 = Parameter(name='rZM97',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM97}',
    lhablock = 'ZMMIX',
    lhacode = [9, 7] )

iZM97 = Parameter(name='iZM97',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM97}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 7] )

rZM98 = Parameter(name='rZM98',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM98}',
    lhablock = 'ZMMIX',
    lhacode = [9, 8] )

iZM98 = Parameter(name='iZM98',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM98}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 8] )

rZM99 = Parameter(name='rZM99',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM99}',
    lhablock = 'ZMMIX',
    lhacode = [9, 9] )

iZM99 = Parameter(name='iZM99',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{ZM99}',
    lhablock = 'IMZMMIX',
    lhacode = [9, 9] )

TW = Parameter(name='TW',
    nature = 'external',
    type = 'real',
    value = 1.,
    texname = '\\text{TW}',
    lhablock = 'THETAW',
    lhacode = [1] )

PhiW = Parameter(name='PhiW',
    nature = 'external',
    type = 'real',
    value = 1.,
    texname = '\\phi_W',
    lhablock = 'PHIW',
    lhacode = [1] )

aEWM1 = Parameter(name='aEWM1',
    nature = 'external',
    type = 'real',
    value = 137.035999679,
    texname = '\\text{aEWM1}',
    lhablock = 'SMINPUTS',
    lhacode = [1] )

aS = Parameter(name='aS',
    nature = 'external',
    type = 'real',
    value = 0.119,
    texname = '\\text{aS}',
    lhablock = 'SMINPUTS',
    lhacode = [3] )

Y11 = Parameter(name='Y11',
    nature = 'internal',
    type = 'complex',
    value = 'rY11 + complex(0,1)*iY11',
    texname = '\\text{Y11}' )

Y12 = Parameter(name='Y12',
    nature = 'internal',
    type = 'complex',
    value = 'rY12 + complex(0,1)*iY12',
    texname = '\\text{Y12}' )

Y13 = Parameter(name='Y13',
    nature = 'internal',
    type = 'complex',
    value = 'rY13 + complex(0,1)*iY13',
    texname = '\\text{Y13}' )

Y21 = Parameter(name='Y21',
    nature = 'internal',
    type = 'complex',
    value = 'rY21 + complex(0,1)*iY21',
    texname = '\\text{Y21}' )

Y22 = Parameter(name='Y22',
    nature = 'internal',
    type = 'complex',
    value = 'rY22 + complex(0,1)*iY22',
    texname = '\\text{Y22}' )

Y23 = Parameter(name='Y23',
    nature = 'internal',
    type = 'complex',
    value = 'rY23 + complex(0,1)*iY23',
    texname = '\\text{Y23}' )

Y31 = Parameter(name='Y31',
    nature = 'internal',
    type = 'complex',
    value = 'rY31 + complex(0,1)*iY31',
    texname = '\\text{Y31}' )

Y32 = Parameter(name='Y32',
    nature = 'internal',
    type = 'complex',
    value = 'rY32 + complex(0,1)*iY32',
    texname = '\\text{Y32}' )

Y33 = Parameter(name='Y33',
    nature = 'internal',
    type = 'complex',
    value = 'rY33 + complex(0,1)*iY33',
    texname = '\\text{Y33}' )

YQ111 = Parameter(name='YQ111',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ111 + complex(0,1)*iYQ111',
    texname = '\\text{YQ111}' )

YQ112 = Parameter(name='YQ112',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ112 + complex(0,1)*iYQ112',
    texname = '\\text{YQ112}' )

YQ113 = Parameter(name='YQ113',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ113 + complex(0,1)*iYQ113',
    texname = '\\text{YQ113}' )

YQ121 = Parameter(name='YQ121',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ121 + complex(0,1)*iYQ121',
    texname = '\\text{YQ121}' )

YQ122 = Parameter(name='YQ122',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ122 + complex(0,1)*iYQ122',
    texname = '\\text{YQ122}' )

YQ123 = Parameter(name='YQ123',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ123 + complex(0,1)*iYQ123',
    texname = '\\text{YQ123}' )

YQ131 = Parameter(name='YQ131',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ131 + complex(0,1)*iYQ131',
    texname = '\\text{YQ131}' )

YQ132 = Parameter(name='YQ132',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ132 + complex(0,1)*iYQ132',
    texname = '\\text{YQ132}' )

YQ133 = Parameter(name='YQ133',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ133 + complex(0,1)*iYQ133',
    texname = '\\text{YQ133}' )

YQ211 = Parameter(name='YQ211',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ211 + complex(0,1)*iYQ211',
    texname = '\\text{YQ211}' )

YQ212 = Parameter(name='YQ212',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ212 + complex(0,1)*iYQ212',
    texname = '\\text{YQ212}' )

YQ213 = Parameter(name='YQ213',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ213 + complex(0,1)*iYQ213',
    texname = '\\text{YQ213}' )

YQ221 = Parameter(name='YQ221',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ221 + complex(0,1)*iYQ221',
    texname = '\\text{YQ221}' )

YQ222 = Parameter(name='YQ222',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ222 + complex(0,1)*iYQ222',
    texname = '\\text{YQ222}' )

YQ223 = Parameter(name='YQ223',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ223 + complex(0,1)*iYQ223',
    texname = '\\text{YQ223}' )

YQ231 = Parameter(name='YQ231',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ231 + complex(0,1)*iYQ231',
    texname = '\\text{YQ231}' )

YQ232 = Parameter(name='YQ232',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ232 + complex(0,1)*iYQ232',
    texname = '\\text{YQ232}' )

YQ233 = Parameter(name='YQ233',
    nature = 'internal',
    type = 'complex',
    value = 'rYQ233 + complex(0,1)*iYQ233',
    texname = '\\text{YQ233}' )

Yt11 = Parameter(name='Yt11',
    nature = 'internal',
    type = 'complex',
    value = 'rYt11 + complex(0,1)*iYt11',
    texname = '\\text{Yt11}' )

Yt12 = Parameter(name='Yt12',
    nature = 'internal',
    type = 'complex',
    value = 'rYt12 + complex(0,1)*iYt12',
    texname = '\\text{Yt12}' )

Yt13 = Parameter(name='Yt13',
    nature = 'internal',
    type = 'complex',
    value = 'rYt13 + complex(0,1)*iYt13',
    texname = '\\text{Yt13}' )

Yt21 = Parameter(name='Yt21',
    nature = 'internal',
    type = 'complex',
    value = 'rYt21 + complex(0,1)*iYt21',
    texname = '\\text{Yt21}' )

Yt22 = Parameter(name='Yt22',
    nature = 'internal',
    type = 'complex',
    value = 'rYt22 + complex(0,1)*iYt22',
    texname = '\\text{Yt22}' )

Yt23 = Parameter(name='Yt23',
    nature = 'internal',
    type = 'complex',
    value = 'rYt23 + complex(0,1)*iYt23',
    texname = '\\text{Yt23}' )

Yt31 = Parameter(name='Yt31',
    nature = 'internal',
    type = 'complex',
    value = 'rYt31 + complex(0,1)*iYt31',
    texname = '\\text{Yt31}' )

Yt32 = Parameter(name='Yt32',
    nature = 'internal',
    type = 'complex',
    value = 'rYt32 + complex(0,1)*iYt32',
    texname = '\\text{Yt32}' )

Yt33 = Parameter(name='Yt33',
    nature = 'internal',
    type = 'complex',
    value = 'rYt33 + complex(0,1)*iYt33',
    texname = '\\text{Yt33}' )

YR11 = Parameter(name='YR11',
    nature = 'internal',
    type = 'complex',
    value = 'rYR11 + complex(0,1)*iYR11',
    texname = '\\text{YR11}' )

YR12 = Parameter(name='YR12',
    nature = 'internal',
    type = 'complex',
    value = 'rYR12 + complex(0,1)*iYR12',
    texname = '\\text{YR12}' )

YR13 = Parameter(name='YR13',
    nature = 'internal',
    type = 'complex',
    value = 'rYR13 + complex(0,1)*iYR13',
    texname = '\\text{YR13}' )

YR21 = Parameter(name='YR21',
    nature = 'internal',
    type = 'complex',
    value = 'rYR21 + complex(0,1)*iYR21',
    texname = '\\text{YR21}' )

YR22 = Parameter(name='YR22',
    nature = 'internal',
    type = 'complex',
    value = 'rYR22 + complex(0,1)*iYR22',
    texname = '\\text{YR22}' )

YR23 = Parameter(name='YR23',
    nature = 'internal',
    type = 'complex',
    value = 'rYR23 + complex(0,1)*iYR23',
    texname = '\\text{YR23}' )

YR31 = Parameter(name='YR31',
    nature = 'internal',
    type = 'complex',
    value = 'rYR31 + complex(0,1)*iYR31',
    texname = '\\text{YR31}' )

YR32 = Parameter(name='YR32',
    nature = 'internal',
    type = 'complex',
    value = 'rYR32 + complex(0,1)*iYR32',
    texname = '\\text{YR32}' )

YR33 = Parameter(name='YR33',
    nature = 'internal',
    type = 'complex',
    value = 'rYR33 + complex(0,1)*iYR33',
    texname = '\\text{YR33}' )

ZDL11 = Parameter(name='ZDL11',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL11 + complex(0,1)*iZDL11',
    texname = '\\text{ZDL11}' )

ZDL12 = Parameter(name='ZDL12',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL12 + complex(0,1)*iZDL12',
    texname = '\\text{ZDL12}' )

ZDL13 = Parameter(name='ZDL13',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL13 + complex(0,1)*iZDL13',
    texname = '\\text{ZDL13}' )

ZDL21 = Parameter(name='ZDL21',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL21 + complex(0,1)*iZDL21',
    texname = '\\text{ZDL21}' )

ZDL22 = Parameter(name='ZDL22',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL22 + complex(0,1)*iZDL22',
    texname = '\\text{ZDL22}' )

ZDL23 = Parameter(name='ZDL23',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL23 + complex(0,1)*iZDL23',
    texname = '\\text{ZDL23}' )

ZDL31 = Parameter(name='ZDL31',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL31 + complex(0,1)*iZDL31',
    texname = '\\text{ZDL31}' )

ZDL32 = Parameter(name='ZDL32',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL32 + complex(0,1)*iZDL32',
    texname = '\\text{ZDL32}' )

ZDL33 = Parameter(name='ZDL33',
    nature = 'internal',
    type = 'complex',
    value = 'rZDL33 + complex(0,1)*iZDL33',
    texname = '\\text{ZDL33}' )

ZDR11 = Parameter(name='ZDR11',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR11 + complex(0,1)*iZDR11',
    texname = '\\text{ZDR11}' )

ZDR12 = Parameter(name='ZDR12',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR12 + complex(0,1)*iZDR12',
    texname = '\\text{ZDR12}' )

ZDR13 = Parameter(name='ZDR13',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR13 + complex(0,1)*iZDR13',
    texname = '\\text{ZDR13}' )

ZDR21 = Parameter(name='ZDR21',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR21 + complex(0,1)*iZDR21',
    texname = '\\text{ZDR21}' )

ZDR22 = Parameter(name='ZDR22',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR22 + complex(0,1)*iZDR22',
    texname = '\\text{ZDR22}' )

ZDR23 = Parameter(name='ZDR23',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR23 + complex(0,1)*iZDR23',
    texname = '\\text{ZDR23}' )

ZDR31 = Parameter(name='ZDR31',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR31 + complex(0,1)*iZDR31',
    texname = '\\text{ZDR31}' )

ZDR32 = Parameter(name='ZDR32',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR32 + complex(0,1)*iZDR32',
    texname = '\\text{ZDR32}' )

ZDR33 = Parameter(name='ZDR33',
    nature = 'internal',
    type = 'complex',
    value = 'rZDR33 + complex(0,1)*iZDR33',
    texname = '\\text{ZDR33}' )

ZUL11 = Parameter(name='ZUL11',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL11 + complex(0,1)*iZUL11',
    texname = '\\text{ZUL11}' )

ZUL12 = Parameter(name='ZUL12',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL12 + complex(0,1)*iZUL12',
    texname = '\\text{ZUL12}' )

ZUL13 = Parameter(name='ZUL13',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL13 + complex(0,1)*iZUL13',
    texname = '\\text{ZUL13}' )

ZUL21 = Parameter(name='ZUL21',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL21 + complex(0,1)*iZUL21',
    texname = '\\text{ZUL21}' )

ZUL22 = Parameter(name='ZUL22',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL22 + complex(0,1)*iZUL22',
    texname = '\\text{ZUL22}' )

ZUL23 = Parameter(name='ZUL23',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL23 + complex(0,1)*iZUL23',
    texname = '\\text{ZUL23}' )

ZUL31 = Parameter(name='ZUL31',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL31 + complex(0,1)*iZUL31',
    texname = '\\text{ZUL31}' )

ZUL32 = Parameter(name='ZUL32',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL32 + complex(0,1)*iZUL32',
    texname = '\\text{ZUL32}' )

ZUL33 = Parameter(name='ZUL33',
    nature = 'internal',
    type = 'complex',
    value = 'rZUL33 + complex(0,1)*iZUL33',
    texname = '\\text{ZUL33}' )

ZUR11 = Parameter(name='ZUR11',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR11 + complex(0,1)*iZUR11',
    texname = '\\text{ZUR11}' )

ZUR12 = Parameter(name='ZUR12',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR12 + complex(0,1)*iZUR12',
    texname = '\\text{ZUR12}' )

ZUR13 = Parameter(name='ZUR13',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR13 + complex(0,1)*iZUR13',
    texname = '\\text{ZUR13}' )

ZUR21 = Parameter(name='ZUR21',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR21 + complex(0,1)*iZUR21',
    texname = '\\text{ZUR21}' )

ZUR22 = Parameter(name='ZUR22',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR22 + complex(0,1)*iZUR22',
    texname = '\\text{ZUR22}' )

ZUR23 = Parameter(name='ZUR23',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR23 + complex(0,1)*iZUR23',
    texname = '\\text{ZUR23}' )

ZUR31 = Parameter(name='ZUR31',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR31 + complex(0,1)*iZUR31',
    texname = '\\text{ZUR31}' )

ZUR32 = Parameter(name='ZUR32',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR32 + complex(0,1)*iZUR32',
    texname = '\\text{ZUR32}' )

ZUR33 = Parameter(name='ZUR33',
    nature = 'internal',
    type = 'complex',
    value = 'rZUR33 + complex(0,1)*iZUR33',
    texname = '\\text{ZUR33}' )

ZEL11 = Parameter(name='ZEL11',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL11 + complex(0,1)*iZEL11',
    texname = '\\text{ZEL11}' )

ZEL12 = Parameter(name='ZEL12',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL12 + complex(0,1)*iZEL12',
    texname = '\\text{ZEL12}' )

ZEL13 = Parameter(name='ZEL13',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL13 + complex(0,1)*iZEL13',
    texname = '\\text{ZEL13}' )

ZEL21 = Parameter(name='ZEL21',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL21 + complex(0,1)*iZEL21',
    texname = '\\text{ZEL21}' )

ZEL22 = Parameter(name='ZEL22',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL22 + complex(0,1)*iZEL22',
    texname = '\\text{ZEL22}' )

ZEL23 = Parameter(name='ZEL23',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL23 + complex(0,1)*iZEL23',
    texname = '\\text{ZEL23}' )

ZEL31 = Parameter(name='ZEL31',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL31 + complex(0,1)*iZEL31',
    texname = '\\text{ZEL31}' )

ZEL32 = Parameter(name='ZEL32',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL32 + complex(0,1)*iZEL32',
    texname = '\\text{ZEL32}' )

ZEL33 = Parameter(name='ZEL33',
    nature = 'internal',
    type = 'complex',
    value = 'rZEL33 + complex(0,1)*iZEL33',
    texname = '\\text{ZEL33}' )

ZER11 = Parameter(name='ZER11',
    nature = 'internal',
    type = 'complex',
    value = 'rZER11 + complex(0,1)*iZER11',
    texname = '\\text{ZER11}' )

ZER12 = Parameter(name='ZER12',
    nature = 'internal',
    type = 'complex',
    value = 'rZER12 + complex(0,1)*iZER12',
    texname = '\\text{ZER12}' )

ZER13 = Parameter(name='ZER13',
    nature = 'internal',
    type = 'complex',
    value = 'rZER13 + complex(0,1)*iZER13',
    texname = '\\text{ZER13}' )

ZER21 = Parameter(name='ZER21',
    nature = 'internal',
    type = 'complex',
    value = 'rZER21 + complex(0,1)*iZER21',
    texname = '\\text{ZER21}' )

ZER22 = Parameter(name='ZER22',
    nature = 'internal',
    type = 'complex',
    value = 'rZER22 + complex(0,1)*iZER22',
    texname = '\\text{ZER22}' )

ZER23 = Parameter(name='ZER23',
    nature = 'internal',
    type = 'complex',
    value = 'rZER23 + complex(0,1)*iZER23',
    texname = '\\text{ZER23}' )

ZER31 = Parameter(name='ZER31',
    nature = 'internal',
    type = 'complex',
    value = 'rZER31 + complex(0,1)*iZER31',
    texname = '\\text{ZER31}' )

ZER32 = Parameter(name='ZER32',
    nature = 'internal',
    type = 'complex',
    value = 'rZER32 + complex(0,1)*iZER32',
    texname = '\\text{ZER32}' )

ZER33 = Parameter(name='ZER33',
    nature = 'internal',
    type = 'complex',
    value = 'rZER33 + complex(0,1)*iZER33',
    texname = '\\text{ZER33}' )

ZM11 = Parameter(name='ZM11',
    nature = 'internal',
    type = 'complex',
    value = 'rZM11 + complex(0,1)*iZM11',
    texname = '\\text{ZM11}' )

ZM12 = Parameter(name='ZM12',
    nature = 'internal',
    type = 'complex',
    value = 'rZM12 + complex(0,1)*iZM12',
    texname = '\\text{ZM12}' )

ZM13 = Parameter(name='ZM13',
    nature = 'internal',
    type = 'complex',
    value = 'rZM13 + complex(0,1)*iZM13',
    texname = '\\text{ZM13}' )

ZM14 = Parameter(name='ZM14',
    nature = 'internal',
    type = 'complex',
    value = 'rZM14 + complex(0,1)*iZM14',
    texname = '\\text{ZM14}' )

ZM15 = Parameter(name='ZM15',
    nature = 'internal',
    type = 'complex',
    value = 'rZM15 + complex(0,1)*iZM15',
    texname = '\\text{ZM15}' )

ZM16 = Parameter(name='ZM16',
    nature = 'internal',
    type = 'complex',
    value = 'rZM16 + complex(0,1)*iZM16',
    texname = '\\text{ZM16}' )

ZM17 = Parameter(name='ZM17',
    nature = 'internal',
    type = 'complex',
    value = 'rZM17 + complex(0,1)*iZM17',
    texname = '\\text{ZM17}' )

ZM18 = Parameter(name='ZM18',
    nature = 'internal',
    type = 'complex',
    value = 'rZM18 + complex(0,1)*iZM18',
    texname = '\\text{ZM18}' )

ZM19 = Parameter(name='ZM19',
    nature = 'internal',
    type = 'complex',
    value = 'rZM19 + complex(0,1)*iZM19',
    texname = '\\text{ZM19}' )

ZM21 = Parameter(name='ZM21',
    nature = 'internal',
    type = 'complex',
    value = 'rZM21 + complex(0,1)*iZM21',
    texname = '\\text{ZM21}' )

ZM22 = Parameter(name='ZM22',
    nature = 'internal',
    type = 'complex',
    value = 'rZM22 + complex(0,1)*iZM22',
    texname = '\\text{ZM22}' )

ZM23 = Parameter(name='ZM23',
    nature = 'internal',
    type = 'complex',
    value = 'rZM23 + complex(0,1)*iZM23',
    texname = '\\text{ZM23}' )

ZM24 = Parameter(name='ZM24',
    nature = 'internal',
    type = 'complex',
    value = 'rZM24 + complex(0,1)*iZM24',
    texname = '\\text{ZM24}' )

ZM25 = Parameter(name='ZM25',
    nature = 'internal',
    type = 'complex',
    value = 'rZM25 + complex(0,1)*iZM25',
    texname = '\\text{ZM25}' )

ZM26 = Parameter(name='ZM26',
    nature = 'internal',
    type = 'complex',
    value = 'rZM26 + complex(0,1)*iZM26',
    texname = '\\text{ZM26}' )

ZM27 = Parameter(name='ZM27',
    nature = 'internal',
    type = 'complex',
    value = 'rZM27 + complex(0,1)*iZM27',
    texname = '\\text{ZM27}' )

ZM28 = Parameter(name='ZM28',
    nature = 'internal',
    type = 'complex',
    value = 'rZM28 + complex(0,1)*iZM28',
    texname = '\\text{ZM28}' )

ZM29 = Parameter(name='ZM29',
    nature = 'internal',
    type = 'complex',
    value = 'rZM29 + complex(0,1)*iZM29',
    texname = '\\text{ZM29}' )

ZM31 = Parameter(name='ZM31',
    nature = 'internal',
    type = 'complex',
    value = 'rZM31 + complex(0,1)*iZM31',
    texname = '\\text{ZM31}' )

ZM32 = Parameter(name='ZM32',
    nature = 'internal',
    type = 'complex',
    value = 'rZM32 + complex(0,1)*iZM32',
    texname = '\\text{ZM32}' )

ZM33 = Parameter(name='ZM33',
    nature = 'internal',
    type = 'complex',
    value = 'rZM33 + complex(0,1)*iZM33',
    texname = '\\text{ZM33}' )

ZM34 = Parameter(name='ZM34',
    nature = 'internal',
    type = 'complex',
    value = 'rZM34 + complex(0,1)*iZM34',
    texname = '\\text{ZM34}' )

ZM35 = Parameter(name='ZM35',
    nature = 'internal',
    type = 'complex',
    value = 'rZM35 + complex(0,1)*iZM35',
    texname = '\\text{ZM35}' )

ZM36 = Parameter(name='ZM36',
    nature = 'internal',
    type = 'complex',
    value = 'rZM36 + complex(0,1)*iZM36',
    texname = '\\text{ZM36}' )

ZM37 = Parameter(name='ZM37',
    nature = 'internal',
    type = 'complex',
    value = 'rZM37 + complex(0,1)*iZM37',
    texname = '\\text{ZM37}' )

ZM38 = Parameter(name='ZM38',
    nature = 'internal',
    type = 'complex',
    value = 'rZM38 + complex(0,1)*iZM38',
    texname = '\\text{ZM38}' )

ZM39 = Parameter(name='ZM39',
    nature = 'internal',
    type = 'complex',
    value = 'rZM39 + complex(0,1)*iZM39',
    texname = '\\text{ZM39}' )

ZM41 = Parameter(name='ZM41',
    nature = 'internal',
    type = 'complex',
    value = 'rZM41 + complex(0,1)*iZM41',
    texname = '\\text{ZM41}' )

ZM42 = Parameter(name='ZM42',
    nature = 'internal',
    type = 'complex',
    value = 'rZM42 + complex(0,1)*iZM42',
    texname = '\\text{ZM42}' )

ZM43 = Parameter(name='ZM43',
    nature = 'internal',
    type = 'complex',
    value = 'rZM43 + complex(0,1)*iZM43',
    texname = '\\text{ZM43}' )

ZM44 = Parameter(name='ZM44',
    nature = 'internal',
    type = 'complex',
    value = 'rZM44 + complex(0,1)*iZM44',
    texname = '\\text{ZM44}' )

ZM45 = Parameter(name='ZM45',
    nature = 'internal',
    type = 'complex',
    value = 'rZM45 + complex(0,1)*iZM45',
    texname = '\\text{ZM45}' )

ZM46 = Parameter(name='ZM46',
    nature = 'internal',
    type = 'complex',
    value = 'rZM46 + complex(0,1)*iZM46',
    texname = '\\text{ZM46}' )

ZM47 = Parameter(name='ZM47',
    nature = 'internal',
    type = 'complex',
    value = 'rZM47 + complex(0,1)*iZM47',
    texname = '\\text{ZM47}' )

ZM48 = Parameter(name='ZM48',
    nature = 'internal',
    type = 'complex',
    value = 'rZM48 + complex(0,1)*iZM48',
    texname = '\\text{ZM48}' )

ZM49 = Parameter(name='ZM49',
    nature = 'internal',
    type = 'complex',
    value = 'rZM49 + complex(0,1)*iZM49',
    texname = '\\text{ZM49}' )

ZM51 = Parameter(name='ZM51',
    nature = 'internal',
    type = 'complex',
    value = 'rZM51 + complex(0,1)*iZM51',
    texname = '\\text{ZM51}' )

ZM52 = Parameter(name='ZM52',
    nature = 'internal',
    type = 'complex',
    value = 'rZM52 + complex(0,1)*iZM52',
    texname = '\\text{ZM52}' )

ZM53 = Parameter(name='ZM53',
    nature = 'internal',
    type = 'complex',
    value = 'rZM53 + complex(0,1)*iZM53',
    texname = '\\text{ZM53}' )

ZM54 = Parameter(name='ZM54',
    nature = 'internal',
    type = 'complex',
    value = 'rZM54 + complex(0,1)*iZM54',
    texname = '\\text{ZM54}' )

ZM55 = Parameter(name='ZM55',
    nature = 'internal',
    type = 'complex',
    value = 'rZM55 + complex(0,1)*iZM55',
    texname = '\\text{ZM55}' )

ZM56 = Parameter(name='ZM56',
    nature = 'internal',
    type = 'complex',
    value = 'rZM56 + complex(0,1)*iZM56',
    texname = '\\text{ZM56}' )

ZM57 = Parameter(name='ZM57',
    nature = 'internal',
    type = 'complex',
    value = 'rZM57 + complex(0,1)*iZM57',
    texname = '\\text{ZM57}' )

ZM58 = Parameter(name='ZM58',
    nature = 'internal',
    type = 'complex',
    value = 'rZM58 + complex(0,1)*iZM58',
    texname = '\\text{ZM58}' )

ZM59 = Parameter(name='ZM59',
    nature = 'internal',
    type = 'complex',
    value = 'rZM59 + complex(0,1)*iZM59',
    texname = '\\text{ZM59}' )

ZM61 = Parameter(name='ZM61',
    nature = 'internal',
    type = 'complex',
    value = 'rZM61 + complex(0,1)*iZM61',
    texname = '\\text{ZM61}' )

ZM62 = Parameter(name='ZM62',
    nature = 'internal',
    type = 'complex',
    value = 'rZM62 + complex(0,1)*iZM62',
    texname = '\\text{ZM62}' )

ZM63 = Parameter(name='ZM63',
    nature = 'internal',
    type = 'complex',
    value = 'rZM63 + complex(0,1)*iZM63',
    texname = '\\text{ZM63}' )

ZM64 = Parameter(name='ZM64',
    nature = 'internal',
    type = 'complex',
    value = 'rZM64 + complex(0,1)*iZM64',
    texname = '\\text{ZM64}' )

ZM65 = Parameter(name='ZM65',
    nature = 'internal',
    type = 'complex',
    value = 'rZM65 + complex(0,1)*iZM65',
    texname = '\\text{ZM65}' )

ZM66 = Parameter(name='ZM66',
    nature = 'internal',
    type = 'complex',
    value = 'rZM66 + complex(0,1)*iZM66',
    texname = '\\text{ZM66}' )

ZM67 = Parameter(name='ZM67',
    nature = 'internal',
    type = 'complex',
    value = 'rZM67 + complex(0,1)*iZM67',
    texname = '\\text{ZM67}' )

ZM68 = Parameter(name='ZM68',
    nature = 'internal',
    type = 'complex',
    value = 'rZM68 + complex(0,1)*iZM68',
    texname = '\\text{ZM68}' )

ZM69 = Parameter(name='ZM69',
    nature = 'internal',
    type = 'complex',
    value = 'rZM69 + complex(0,1)*iZM69',
    texname = '\\text{ZM69}' )

ZM71 = Parameter(name='ZM71',
    nature = 'internal',
    type = 'complex',
    value = 'rZM71 + complex(0,1)*iZM71',
    texname = '\\text{ZM71}' )

ZM72 = Parameter(name='ZM72',
    nature = 'internal',
    type = 'complex',
    value = 'rZM72 + complex(0,1)*iZM72',
    texname = '\\text{ZM72}' )

ZM73 = Parameter(name='ZM73',
    nature = 'internal',
    type = 'complex',
    value = 'rZM73 + complex(0,1)*iZM73',
    texname = '\\text{ZM73}' )

ZM74 = Parameter(name='ZM74',
    nature = 'internal',
    type = 'complex',
    value = 'rZM74 + complex(0,1)*iZM74',
    texname = '\\text{ZM74}' )

ZM75 = Parameter(name='ZM75',
    nature = 'internal',
    type = 'complex',
    value = 'rZM75 + complex(0,1)*iZM75',
    texname = '\\text{ZM75}' )

ZM76 = Parameter(name='ZM76',
    nature = 'internal',
    type = 'complex',
    value = 'rZM76 + complex(0,1)*iZM76',
    texname = '\\text{ZM76}' )

ZM77 = Parameter(name='ZM77',
    nature = 'internal',
    type = 'complex',
    value = 'rZM77 + complex(0,1)*iZM77',
    texname = '\\text{ZM77}' )

ZM78 = Parameter(name='ZM78',
    nature = 'internal',
    type = 'complex',
    value = 'rZM78 + complex(0,1)*iZM78',
    texname = '\\text{ZM78}' )

ZM79 = Parameter(name='ZM79',
    nature = 'internal',
    type = 'complex',
    value = 'rZM79 + complex(0,1)*iZM79',
    texname = '\\text{ZM79}' )

ZM81 = Parameter(name='ZM81',
    nature = 'internal',
    type = 'complex',
    value = 'rZM81 + complex(0,1)*iZM81',
    texname = '\\text{ZM81}' )

ZM82 = Parameter(name='ZM82',
    nature = 'internal',
    type = 'complex',
    value = 'rZM82 + complex(0,1)*iZM82',
    texname = '\\text{ZM82}' )

ZM83 = Parameter(name='ZM83',
    nature = 'internal',
    type = 'complex',
    value = 'rZM83 + complex(0,1)*iZM83',
    texname = '\\text{ZM83}' )

ZM84 = Parameter(name='ZM84',
    nature = 'internal',
    type = 'complex',
    value = 'rZM84 + complex(0,1)*iZM84',
    texname = '\\text{ZM84}' )

ZM85 = Parameter(name='ZM85',
    nature = 'internal',
    type = 'complex',
    value = 'rZM85 + complex(0,1)*iZM85',
    texname = '\\text{ZM85}' )

ZM86 = Parameter(name='ZM86',
    nature = 'internal',
    type = 'complex',
    value = 'rZM86 + complex(0,1)*iZM86',
    texname = '\\text{ZM86}' )

ZM87 = Parameter(name='ZM87',
    nature = 'internal',
    type = 'complex',
    value = 'rZM87 + complex(0,1)*iZM87',
    texname = '\\text{ZM87}' )

ZM88 = Parameter(name='ZM88',
    nature = 'internal',
    type = 'complex',
    value = 'rZM88 + complex(0,1)*iZM88',
    texname = '\\text{ZM88}' )

ZM89 = Parameter(name='ZM89',
    nature = 'internal',
    type = 'complex',
    value = 'rZM89 + complex(0,1)*iZM89',
    texname = '\\text{ZM89}' )

ZM91 = Parameter(name='ZM91',
    nature = 'internal',
    type = 'complex',
    value = 'rZM91 + complex(0,1)*iZM91',
    texname = '\\text{ZM91}' )

ZM92 = Parameter(name='ZM92',
    nature = 'internal',
    type = 'complex',
    value = 'rZM92 + complex(0,1)*iZM92',
    texname = '\\text{ZM92}' )

ZM93 = Parameter(name='ZM93',
    nature = 'internal',
    type = 'complex',
    value = 'rZM93 + complex(0,1)*iZM93',
    texname = '\\text{ZM93}' )

ZM94 = Parameter(name='ZM94',
    nature = 'internal',
    type = 'complex',
    value = 'rZM94 + complex(0,1)*iZM94',
    texname = '\\text{ZM94}' )

ZM95 = Parameter(name='ZM95',
    nature = 'internal',
    type = 'complex',
    value = 'rZM95 + complex(0,1)*iZM95',
    texname = '\\text{ZM95}' )

ZM96 = Parameter(name='ZM96',
    nature = 'internal',
    type = 'complex',
    value = 'rZM96 + complex(0,1)*iZM96',
    texname = '\\text{ZM96}' )

ZM97 = Parameter(name='ZM97',
    nature = 'internal',
    type = 'complex',
    value = 'rZM97 + complex(0,1)*iZM97',
    texname = '\\text{ZM97}' )

ZM98 = Parameter(name='ZM98',
    nature = 'internal',
    type = 'complex',
    value = 'rZM98 + complex(0,1)*iZM98',
    texname = '\\text{ZM98}' )

ZM99 = Parameter(name='ZM99',
    nature = 'internal',
    type = 'complex',
    value = 'rZM99 + complex(0,1)*iZM99',
    texname = '\\text{ZM99}' )

G = Parameter(name='G',
    nature = 'internal',
    type = 'real',
    value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)',
    texname = 'g_3')

vR = Parameter(name='vR',
    nature = 'internal',
    type = 'real',
    value = '2000',
    texname = 'v_R')

el = Parameter(name='el',
    nature = 'internal',
    type = 'real',
    value = '2*cmath.sqrt(1/aEWM1)*cmath.sqrt(cmath.pi)',
    texname = '\\text{el}')

MWLm = Parameter(name='MWLm',
    nature = 'internal',
    type = 'real',
    value = 'cmath.sqrt(MZ**2*cmath.cos(TW)**2)/cmath.sqrt(2)',
    texname = '\\text{MWLm}')

gBL = Parameter(name='gBL',
    nature = 'internal',
    type = 'real',
    value = 'el/cmath.sqrt(cmath.cos(2*TW))',
    texname = 'g_{B}')

g2 = Parameter(name='g2',
    nature = 'internal',
    type = 'real',
    value = 'el*1./cmath.sin(TW)',
    texname = 'g_2')

RXiWLm = Parameter(name='RXiWLm',
    nature = 'internal',
    type = 'real',
    value = '1.',
    texname = '\\xi_{W^-}')

MHpm1 = Parameter(name = 'MHpm1',
    nature = 'internal',
    type = 'real',
    value = 'MWLm*RXiWLm',
    texname = 'M_{{H^\\pm}_1}')

MgWLm = Parameter(name = 'MgWLm',
    nature = 'internal',
    type = 'real',
    value = 'MWLm*RXiWLm',
    texname = 'M_{\\eta_L^-}')

MgWLp = Parameter(name = 'MgWLp',
    nature = 'internal',
    type = 'real',
    value = 'MWLm*RXiWLm',
    texname = 'M_{\\eta_L^+}')

RXiWRm = Parameter(name='RXiWRm',
    nature = 'internal',
    type = 'real',
    value = '1.',
    texname = '\\xi_{W_R^-}')

MHpm2 = Parameter(name = 'MHpm2',
    nature = 'internal',
    type = 'real',
    value = 'MWRm*RXiWRm',
    texname = 'M_{{H^\\pm}_2}')

MgWRm = Parameter(name = 'MgWRm',
    nature = 'internal',
    type = 'real',
    value = 'MWRm*RXiWRm',
    texname = 'M_{\\eta_R^-}')

MgWRp = Parameter(name = 'MgWRp',
    nature = 'internal',
    type = 'real',
    value = 'MWRm*RXiWRm',
    texname = 'M_{\\eta_R^+}')

RXiZ = Parameter(name='RXiZ',
    nature = 'internal',
    type = 'real',
    value = '1.',
    texname = '\\xi_{Z}')

MAh1 = Parameter(name = 'MAh1',
    nature = 'internal',
    type = 'real',
    value = 'MZ*RXiZ',
    texname = 'M_{{A^0}_1}')

MAh2 = Parameter(name = 'MAh2',
    nature = 'internal',
    type = 'real',
    value = 'MZ*RXiZ',
    texname = 'M_{{A^0}_2}')

MgZ = Parameter(name = 'MgZ',
    nature = 'internal',
    type = 'real',
    value = 'MZ*RXiZ',
    texname = 'M_{\\eta^Z}')

RXiZR = Parameter(name='RXiZR',
    nature = 'internal',
    type = 'real',
    value = '1.',
    texname = '\\xi_{{Z^{\\prime}}}')

HPP1 = Parameter(name='HPP1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HPP1}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [25,22,22] )

HGG1 = Parameter(name='HGG1',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HGG1}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [25,21,21] )

HPP2 = Parameter(name='HPP2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HPP2}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [35,22,22] )

HGG2 = Parameter(name='HGG2',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HGG2}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [35,21,21] )

HPP3 = Parameter(name='HPP3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HPP3}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [335,22,22] )

HGG3 = Parameter(name='HGG3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HGG3}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [335,21,21] )

HPP4 = Parameter(name='HPP4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HPP4}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [445,22,22] )

HGG4 = Parameter(name='HGG4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{HGG4}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [445,21,21] )

APP3 = Parameter(name='APP3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{APP3}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [36,22,22] )

AGG3 = Parameter(name='AGG3',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{AGG3}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [36,21,21] )

APP4 = Parameter(name='APP4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{APP4}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [46,22,22] )

AGG4 = Parameter(name='AGG4',
    nature = 'external',
    type = 'real',
    value = 0.,
    texname = '\\text{AGG4}',
    lhablock = 'EFFHIGGSCOUPLINGS',
    lhacode = [46,21,21] )

