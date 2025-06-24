from hepstack_obj import masses_mH1M2
from hepaid.search.objective import Objective
from hepaid.search.method import bCASTOR

import numpy as np
# Test
hep_config = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/configs/sphenostack_config.yaml"
obj_hep_config= 'configs/mh1_obj_hep.yml'

objective_fn = masses_mH1M2(
        obj_hep_cfg=obj_hep_config,
        hep_stack_cfg=hep_config,
        )

obj = Objective(
    function = objective_fn,
    function_config= obj_hep_config
)

bcastor = bCASTOR(
    objective=obj,
    #hyper_parameters='configs/bcastor_config.yaml',
    )
bcastor.run()
