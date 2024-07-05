import numpy as np

def booth(x):
    '''f(1,3)=0, -10 < x, y < 10'''
    x, y = x[0], x[1]
    term1 = (x+2*y-7)**2
    term2 = (2*x+y-5)**2
    return np.log(term1 + term2)

def himmelblau(x):
    '''-5 < x, y < 5'''
    x, y = x[0], x[1]
    term1 = (x**2+y-11)**2
    term2 = (x+y**2-7)**2
    return np.log(term1 + term2)


def himmelblau_booth(x):
    output = {
        'x': x[0],
        'y': x[1],
        'himmelblau': himmelblau(x),
        'booth': booth(x)
        }
    return output


space_config = {
    'x': {
        'lower': -5,
        'upper': 5.,
        'distribution': 'uniform',
    },
    'y': {
        'lower': -5,
        'upper': 5.,
        'distribution': 'uniform',
    },
}

output_parameters = ['himmelblau', 'booth']
input_parameters = ['x', 'y']

objectives = {
    'double_constraint': {
        'booth': [['gt', 2],['lt',4]]
    },
    'single_constraint': {
        'himmelblau':['lt', 3.],
    },
    'gaussian_constraint': {

    }
    }


if __name__ == "__main__":
    pass
