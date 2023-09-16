'''
Funções para montagem de Gráficos
'''

import numpy as np
import math
import matplotlib.pyplot as plt
from matplotlib.widgets import Cursor

def grafSimples(x, y, tit, titEixoX, titEixoY, legenda, arquivo):

    fig, graf = plt.subplots()

    graf.plot(x, y, 'b')

    plt.grid(True, which='both', linestyle = '--', linewidth = 0.5)
    if (legenda != []):
        plt.legend(legenda, loc = 'lower right')
    graf.set(xlabel = titEixoX, ylabel = titEixoY, title = tit)
   
    fig.savefig(arquivo)
    plt.show()
    plt.close()
    return 1

def grafDuplos(x1, y1, x2, y2, tit, titEixoX, titEixoY, legenda, arquivo):

    fig, graf = plt.subplots()

    graf.plot(x1, y1, x2, y2, 'b')

    plt.grid(True, which='both', linestyle = '--', linewidth = 0.5)
    if (legenda != []):
        plt.legend(legenda, loc = 'lower right')
    graf.set(xlabel = titEixoX, ylabel = titEixoY, title = tit)
   
    fig.savefig(arquivo)
    plt.show()
    plt.close()
    return 1

def funcao(x):
    # f = 2 * np.power(x, 4) + 4 * np.power(x, 3) + 3 * np.power(x, 2) - 10 * x - 15
    f = np.power(x, 5) - 2 * np.power(x, 4) - 9 * np.power(x, 3) + 22 * np.power(x, 2) + 4 * x - 24   # Com m = 3
    # f = 5 * np.power(x, 3) + np.power(x, 2) - np.exp(1 - 2 * x) + np.cos(x) + 20
    #f = x * np.sin(x) + 4
    #f = np.power((x - 3), 5) * np.log(x)
    return f

x  = np.arange(-2.0, 3.0, 0.01)
y  = funcao(x)
# y1 = np.exp(2 - np.power(x, 2))  #1000 * np.power(x, 5) - 3.0 * x + 9.04 
# y2 = np.power(x + 1, 2)


#Gráfico
graf = grafSimples(x, y, 'Curva', 'x', 'y', [], 'grafico.png')
# graf = grafDuplos(x, y1, x, y2, 'Curva', 'x', 'y', [], 'grafico.png')