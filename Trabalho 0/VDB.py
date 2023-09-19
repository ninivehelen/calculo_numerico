import pandas as pd

def sinal(numero):
    if numero > 0:
        return 1
    elif numero < 0:
        return -1


def funcao(x):
    return -2*(x**2)+5*(x)+3

def van_WDB(a, b, toler, iterMax):
    fa = funcao(a)
    fb = funcao(b)
    data = []
    if(fa*fb > 0):
        print("A função não muda de sinal nos extremos do intervalo dado")
        return 1
    c = b
    fc = fb
    iter = 0
    z=0
    while(True):
        if (fb*fc > 0):
            c = a
            fc = fa
            d = b - a
            e = d
        tol = 2 * toler * max(abs(b), 1)
        z = (c - b) / 2
        nova_linha={"i":iter, "a":a, "c":c, "b":b, "fb":fb, "z":z}
        data.append(nova_linha)
        if(abs(z)<=tol or fb==0 or iter >= iterMax):
            break
        if(abs(e)>=tol and abs(fa)>abs(fb)):
            s = fb/fa
            if(a == c):
                p = 2*z*s
                q = 1-s
            else:
                q = fa/fc
                r = fb/fc
                p = s * (2 * z * q * (q - r) - (b - a) * (r - 1))
                q = (q - 1) * (r - 1) * (s - 1)
            if(p>0):
                q = -q
            else:
                p = -1*p
            if((2 * p) < min(3 * z * q - abs(tol*q), abs(e*q))):
                e = d
                d = p/q
            else:
                d = z
                e = z
        else:
            d = z
            e = z
        a = b
        fa = fb
        if(abs(d)> tol):
            b = b + d
        else:
            b = b + sinal(z)*tol
        iter = iter + 1
        fb=funcao(b)
    raiz = b
    if(abs(z)<=tol or fb==0):
        condErro = 0
    else:
        condErro = 1
    df = pd.DataFrame(data)
    print(df)
    return raiz, iter, condErro

def main():

    resultado = []
    resultado = van_WDB(-5, 2, 0.0001, 100)
    print("Raíz: ", resultado[0], ", Iterações: ", resultado[1], ", Condição de Erro: ", resultado[2])


if __name__ == '__main__':
    main()
