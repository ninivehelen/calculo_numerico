'''
Raízes de Funções - Métodos para busca de Raízes de Funções e comparando resultados.
https://docs.google.com/document/d/1vEL02zgJANf_JP6WS_CLvz1GrEVTgY10_jRKIYonPDM/edit?usp=sharing
'''
import os
import math
import numpy as np

def funcao(x):
    f =  x**2 - 3
    return f

def funcaoDerivada(x):
    f =  x**2 - 3
    
    return f

def funcaoDerivadaSegunda(x):
    f =  x**2 - 3

    return f

def bisseccao(ai, bi, prec, nIter):
    fai = funcao(ai)
    fbi = funcao(bi)
    xi  = (ai + bi)/2
    fxi = funcao(xi)

    i = 0
    erro = 1.0
    print('\n************************************************************************************************************************');
    print('* Médoto da Bissecção');
    print('************************************************************************************************************************');
    print('   i\t\tai\t\tfai\t\tb\t\tfbi\t\txi\t\tfxi\t\terro');
    print('************************************************************************************************************************');    
    print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, ai, fai, bi, fbi, xi, fxi, 1.0));
    while ((erro >= prec) and (i <= nIter)):
        if (fxi * fai > 0):
            ai  = xi
            fai = fxi
        else:
            bi  = xi
            fbi = fxi
        i    = i + 1
        aux  = xi
        xi   = (ai + bi)/2
        fxi  = funcao(xi)
        erro = abs(aux - xi)/abs(xi)
        print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, ai, fai, bi, fbi, xi, fxi, erro));
    print('************************************************************************************************************************');
    return xi, i, erro

def secante(ai, bi, prec, nIter):
    fai = funcao(ai)
    fbi = funcao(bi)
    if (abs(fai) < abs(fbi)):
        aux = ai 
        ai  = bi
        bi  = aux
        aux = fai
        fai = fbi
        fbi = aux        
    xi  = bi - (fbi / (fbi - fai)) * (bi - ai)
    fxi = funcao(xi)

    i = 0
    erro = 1.0
    print('************************************************************************************************************************');
    print('* Médoto da Secante');
    print('************************************************************************************************************************');
    print('   i\t\tai\t\tfai\t\tb\t\tfbi\t\txi\t\tfxi\t\terro');
    print('************************************************************************************************************************');    
    print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, ai, fai, bi, fbi, xi, fxi, 1.0));
    while ((erro >= prec) and (i <= nIter)):
        i   = i + 1
        ai  = bi
        fai = fbi
        bi  = xi
        fbi = fxi
         
        aux  = xi
        xi   = bi - (fbi / (fbi - fai)) * (bi - ai)
        fxi  = funcao(xi)
        erro = abs(aux - xi)/abs(xi)
        print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, ai, fai, bi, fbi, xi, fxi, erro));
    print('************************************************************************************************************************');        
    return xi, i, erro

def regulafalsi(ai, bi, prec, nIter):
    fai = funcao(ai)
    fbi = funcao(bi)
    xi  = bi - (fbi / (fbi - fai)) * (bi - ai)
    fxi = funcao(xi)

    i = 0
    erro = 1.0
    print('************************************************************************************************************************');
    print('* Médoto Regula Falsi');
    print('************************************************************************************************************************');
    print('   i\t\tai\t\tfai\t\tb\t\tfbi\t\txi\t\tfxi\t\terro');
    print('************************************************************************************************************************');
    print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, ai, fai, bi, fbi, xi, fxi, 1.0));
    while ((erro >= prec) and (i <= nIter)):
        if (fxi * fai > 0):
            ai  = xi
            fai = fxi
        else:
            bi  = xi
            fbi = fxi
        i    = i + 1
        aux  = xi
        xi   = bi - (fbi / (fbi - fai)) * (bi - ai)
        fxi  = funcao(xi)
        erro = abs(aux - xi)/abs(xi)
        print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, ai, fai, bi, fbi, xi, fxi, erro));
    print('************************************************************************************************************************');        
    return xi, i, erro

def pegaso(ai, bi, prec, nIter):
    fai = funcao(ai)
    fbi = funcao(bi)
    xi  = bi - (fbi / (fbi - fai)) * (bi - ai)
    fxi = funcao(xi)

    i = 0
    erro = 1.0
    print('************************************************************************************************************************');
    print('* Médoto Pégaso');
    print('************************************************************************************************************************');
    print('   i\t\tai\t\tfai\t\tb\t\tfbi\t\txi\t\tfxi\t\terro');
    print('************************************************************************************************************************');    
    print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, ai, fai, bi, fbi, xi, fxi, 1.0));
    while ((erro >= prec) and (i <= nIter)):
        if (fxi * fbi < 0):
            ai  = bi
            fai = fbi
        else:
            fai = fai * fbi / (fbi + fxi);
        bi  = xi
        fbi = fxi

        i    = i + 1
        aux  = xi
        xi   = bi - (fbi / (fbi - fai)) * (bi - ai)
        fxi  = funcao(xi)
        erro = abs(aux - xi)/abs(xi)
        print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, ai, fai, bi, fbi, xi, fxi, erro));
    print('************************************************************************************************************************');        
    return xi, i, erro

def xmiller(a, fa, b, fb, c, fc):
    d1 = c - b
    d2 = b - a
    r  = d1/d2
    coefa = (1 / (d1 * (d1 + d2))) * (fc - (r + 1) * fb + r * fa)
    coefb = (1 / d1) * (fc - fb) - coefa * d1
    coefc = fb

    sinalb = 1
    if (coefb < 0):
        sinalb = -1
    num1 = -coefb + sinalb * math.sqrt(coefb**2 - 4 * coefa * coefc)
    x = b + num1 / (2 * coefa)
    fx = funcao(x)
    return x, fx

def muller(ai, ci, prec, nIter):
    fai = funcao(ai)
    fci = funcao(ci)
    bi  = (ai + ci)/2
    fbi = funcao(bi)
    xi, fxi = xmiller(ai, fai, bi, fbi, ci, fci)
   
    i = 0
    erro = 1.0
    print('************************************************************************************************************************************');
    print('* Médoto de Muller');
    print('************************************************************************************************************************************');
    print('   i\t    ai\t\tfai\t\tbi\t      fbi\t     ci\t\t fci\t\txi\t    fxi\t\t   erro');
    print('************************************************************************************************************************************');
    print('%4.0f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f' %(i, ai, fai, bi, fbi, ci, fci, xi, fxi, 1.0));
    while ((erro >= prec) and (i <= nIter)):
        if (xi > bi):
            ai  = bi
            fai = fbi
        else:
            ci  = bi
            fci = fbi
        bi   = xi
        fbi  = fxi

        aux  = xi
        i    = i + 1
        
        xi, fxi = xmiller(ai, fai, bi, fbi, ci, fci)       
        erro = abs(aux - xi)/abs(xi)
        print('%4.0f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f' %(i, ai, fai, bi, fbi, ci, fci, xi, fxi, erro));
    print('************************************************************************************************************************************');
    return xi, i, erro

def vanWijngaardenDekkerBrent(ai, ci, prec, nIter):
    fai = funcao(ai)
    fci = funcao(ci)
    bi  = ci
    fbi = fci
         
    i = 0
    erroold = 0.1
    erro    = 1.0
    print('**************************************************************************************************************');
    print('* Médoto de van Wijngaarden - Dekker - Brent');
    print('**************************************************************************************************************');
    print('   i\t    ai\t\tfai\t\tbi\t     fbi\t     ci\t\t   fci\t\terro');
    print('**************************************************************************************************************');    
    while ((abs(erro) >= prec) and (round(abs(erro), int(math.log10(1/prec))) != round(abs(erroold), int(math.log10(1/prec)))) and (i <= nIter)):
        if (fci * fbi > 0):
            bi  = ai
            fbi = fai
            d   = ci - ai
            e   = d
        if (abs(fbi) < abs(fci)):
            ai  = ci
            ci  = bi
            bi  = ai
            fai = fci
            fci = fbi
            fbi = fai
        tol     = 2 * prec * max(abs(ci), 1)
        erroold = erro
        erro    = (bi - ci)/2
        print('%4.0f%14.8f%14.8f%14.8f%14.8f%14.8f%14.8f%20.15f' %(i, ai, fai, bi, fbi, ci, fci, erro));

        if (abs(fai) > abs(fci)):
            s = fci / fai
            if (ai == bi):
                p = 2 * erro * s
                q = 1 - s
            else:
                q = fai / fbi
                r = fci / fbi
                p = s * (2 * erro * q * (q - r) - (ci - ai) * (r - 1))
                q = (q - 1) * (r - 1) * (s - 1)
            if (p > 0):
                q = -q
            else:
                p = -p
            if (2 * p < min(3 * erro * q - abs(tol * q), abs(e * q))):
                e = d
                d = p / q
            else:
                d = erro
                e = erro
        else:
            d = erro
            e = erro
            
        ai  = ci
        fai = fci
        if (abs(d) > tol):
            ci = ci + d
        else:
            sinal = 1
            if (erro < 0):
                sinal = -1
            ci = ci + sinal * tol

        i    = i + 1
        fci = funcao(ci)
    print('**************************************************************************************************************');    
    return ci, (i - 1), erro

def testeDaDerivadaSegunda(ai, bi):
    fai  = funcao(ai)
    fbi  = funcao(bi)
    fai2 = funcaoDerivadaSegunda(ai)
    fbi2 = funcaoDerivadaSegunda(bi)
    ais = 0
    if ((fai * fai2) > 0):
        ais = 1
    bis = 0        
    if ((fbi * fbi2) > 0):
        bis = 1
    if ((ais * bis) > 0 ):
        if (abs(fai) < abs(fbi)):
            xi = ai
        else:
            xi = bi
    else:
        if ((ais == 0) and (bis == 0)):
            xi = (ai + bi)/2
        else:
            if (ais == 1):
                xi = ai
            else:
                xi = bi
    return xi

def newton(xi, prec, nIter):
    fxi  = funcao(xi)
    Dfxi = funcaoDerivada(xi)

    i    = 0
    erro = 1.0
    print('*************************************************************************');
    print('* Médoto de Newton');
    print('*************************************************************************');
    print('   i\t\t  xi\t     fxi\t     Dfxib\t\terro');
    print('*************************************************************************');    
    print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, xi, fxi, Dfxi, 1.0));
    while ((erro >= prec) and (i <= nIter) and (Dfxi != 0.0)):
        aux  = xi
        i    = i + 1
        xi   = xi - fxi/Dfxi
        fxi  = funcao(xi)
        Dfxi = funcaoDerivada(xi)        

        erro = abs(aux - xi)/abs(xi)
        print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, xi, fxi, Dfxi, erro));
    print('*************************************************************************');        
    return xi, i, erro

def schroder(xi, m, prec, nIter):
    fxi  = funcao(xi)
    Dfxi = funcaoDerivada(xi)

    i    = 0
    erro = 1.0
    print('*************************************************************************');
    print('* Médoto de Schroder');
    print('*************************************************************************');
    print('   i\t\t  xi\t     fxi\t     Dfxib\t\terro');
    print('*************************************************************************');    
    print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, xi, fxi, Dfxi, 1.0));
    while ((erro >= prec) and (i <= nIter) and (Dfxi != 0.0)):
        aux  = xi
        i    = i + 1
        xi   = xi - m * fxi/Dfxi
        fxi  = funcao(xi)
        Dfxi = funcaoDerivada(xi)        

        erro = abs(aux - xi)/abs(xi)
        print('%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, xi, fxi, Dfxi, erro));
    print('*************************************************************************');
    return xi, i, erro

'''
##########################################################################

 Os testes foram realizados para as cinco funções mudando apenas os itens:

   nIter (número de iterações)
   prec  (precisão desejada)
   m     (multiplicidade da raíz)
   ai    (limite inferior)
   bi    (limite superior)
  
##########################################################################  
'''

nIter = 100
prec  = 1.0e-9
m     = 1
# m  = 5 #5 # 3
ai = 0 # 2 # 1   # -5 # 0 # 0
bi = 3 # 5 # 4.5 # 5  # 5 # 3

metodo = ['Bissecção', 'Secante', 'Regula Falsi', 'Pegaso', 'Muller', 'vanW-D-Brent', 'Newton', 'Schroder']
x   = np.zeros(8)
nI  = np.zeros(8)
err = np.zeros(8)

for i in range(8):
    match i:
        case 0 :
            x[i], nI[i], err[i] = bisseccao(ai, bi, prec, nIter);
        case 1 :
            x[i], nI[i], err[i] = secante(ai, bi, prec, nIter);
        case 2 :
            x[i], nI[i], err[i] = regulafalsi(ai, bi, prec, nIter);
        case 3 :
            x[i], nI[i], err[i] = pegaso(ai, bi, prec, nIter);
        case 4 :
            x[i], nI[i], err[i] = muller(ai, bi, prec, nIter);
        case 5 :
            x[i], nI[i], err[i] = vanWijngaardenDekkerBrent(ai, bi, prec, nIter);
        case 6 :
            x[i], nI[i], err[i] = newton(testeDaDerivadaSegunda(ai, bi), prec, nIter);
        case 7 :
            x[i], nI[i], err[i] = schroder(testeDaDerivadaSegunda(ai, bi), m, prec, nIter);


print('\n***************************************************************')
print('*********** Comparativo entre os métodos analisados ***********')
print('***************************************************************')
print('***************************************************************')
print('     Método\t     Raiz\t  Iterações\t Erro')
print('***************************************************************')
for i in range(8):
    print('%15s%14.8f%14.0f%20.15f' %(metodo[i], x[i], nI[i], err[i]))         
print('***************************************************************')