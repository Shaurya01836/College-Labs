# 	SKY	AIR_TEMP	HUMIDITY	WIND	WATER	FORECAST	TARGET_VALUE
# 0	Sunny	Warm	Normal	Strong	Warm	Same	Yes
# 1	Sunny	Warm	High	Strong	Warm	Same	Yes
# 2	Rainy	Cold	High	Strong	Warm	Same	No
# 3	Sunny	Warm	High	Strong	Cold	Change	Yes



import pandas as pd
data = pd.read_csv('data.csv')
data

import numpy as np 
array = np.array(data)[:, :-1]
array

target = np.array(data)[: , -1]
target

def S_algo(array,Target):
    for i, val in enumerate(Target):
        if val == 'Yes':
            Specific_h = array[i].copy()
            break
            
    for i,val in enumerate(array):
         if Target[i] == 'Yes':
            for x in range(len(Specific_h)):
                if val[x] != Specific_h[x]:
                     Specific_h[x] = '?'
                else:
                     pass
    return Specific_h
    
S_algo(array,target)


# output
# array(['Sunny', 'Warm', '?', 'Strong', '?', '?'], dtype=object)