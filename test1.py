import numpy as np
import math
import matplotlib.pyplot as plt

def a(num):
    return sigmoid(num)

def tanh(num):
    return np.tanh(num)

def sigmoid(x):
  return 1 / (1 + math.exp(-x))

def relu(num):
    if (num < 0): return 0
    else: return num

def lrelu(num):
    fac = 0.1
    if (num < 0): return num * fac
    else: return num

res = 0.1
max = 10

x=np.arange(-max, max, res)

y=[]
for n in x:
    y.append(a(n))
z=[]
for n in x:
    z.append(tanh(n))


plt.plot(x,y)
plt.plot(x,z)
plt.xlabel('x axis')
plt.ylabel('y axis')
plt.title("testing graphs")
plt.show()
