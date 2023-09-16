programa 
{
  inclua biblioteca Matematica

funcao  calculo(real x){
    real f 
    f = 3 * (x * x) - 7 * x + 2
    retorne f
}
   
funcao  xmiller(real a, real fa, real b, real fb, real c, real fc){
    real d1, d2,r, coefa, coefb, coefc, sinalb, num1, x, fx
    d1 = c - b
    d2 = b - a
    r  = d1/d2
    coefa = (1 / (d1 * (d1 + d2))) * (fc - (r + 1) * fb + r * fa)
    coefb = (1 / d1) * (fc - fb) - coefa * d1
    coefc = fb

    sinalb = 1
    se (b < 0){
        sinalb = -1
    }
    num1 = -coefb + sinalb * Matematica.arredondar(coefb*2 coefb*2 - 4 * coefa * coefc)
    x = b + num1 / (2 * coefa)
    fx = calculo(x)
    retorne  fx
}
funcao  muller(real ai, real ci, real prec, real maxIter){
    real fai, fci, bi, fbi, xi
    inteiro i 
    fai = calculo(ai)
    fci = calculo(ci)
    bi  = (ai + ci)/2
    fbi = calculo(bi)
    fxi = xmiller(ai, fai, bi, fbi, ci, fci)
    xi = xmiller(ai, fai, bi, fbi, ci, fci)
   
    i = 0
    erro = 1.0
    escreva("************************************************************************************************************************************");
    escreva("* Médoto de Muller")
    escreva("************************************************************************************************************************************");
    escreva(erro)
    escreva("************************************************************************************************************************************");
    escreva(i, ai, fai, bi, fbi, ci, fci, xi, fxi, 1.0)
    enquanto ((erro >= prec) e (i <= maxIter)){
        se (xi > bi){
            ai  = bi
            fai = fbi
        }senao{}
            ci  = bi
            fci = fbi
        bi   = xi
        fbi  = fxi

        aux  = xi
        i    = i + 1
    }
        fxi = xmiller(ai, fai, bi, fbi, ci, fci)
        xi = xmiller(ai, fai, bi, fbi, ci, fci)        
        erro = abs(aux - xi)/abs(xi)
        escreva(i, ai, fai, bi, fbi, ci, fci, xi, fxi, erro)
    escreva("************************************************************************************************************************************")
    retorne xi
}

         
funcao inicio() {
real maxIter, prec,ai,bi, xi, ni
maxIter = 100
prec    = 0.01
ai      = -1
bi      = 2
nI = muller(ai, bi, prec, maxIter)
xi = muller(ai, bi, prec, maxIter)
err = muller(ai, bi, prec, maxIter)
escreva("************************************************************************************************************************")
escreva("* Raíz                ",(xi))
escreva("* Número de Iterações",(nI))
escreva(" Erro               ",(err))
escreva("************************************************************************************************************************") 
}
}