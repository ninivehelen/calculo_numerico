programa 
{
 inclua biblioteca Matematica
funcao  calculo(real x){
  real f
  f =  (3 * (x ^ 2) - 7 * x + 2)
  retorne f
}
funcao funcaoDerivada(real x){
    real f
    f = 3 * x*2 + x*2 - 4 * x - 3
    retorne f
}
funcao funcaoDerivadaSegunda(real x){
   real f
    f = 6 * x - 4 
    retorne f
}
funcao real  testeDaDerivadaSegunda(real ai, real bi){
    real fai, fbi, fai2,fbi2
    fai  = calculo(ai)
    fbi  = calculo(bi)
    fai2 = funcaoDerivadaSegunda(ai)
    fbi2 = funcaoDerivadaSegunda(bi)
    ais = 0
    se ((fai * fai2) > 0){
        ais = 1
     }
    bis = 0      
    
    se((fbi * fbi2) > 0){
        bis = 1
        }
    se((ais * bis) > 0 ){
        if (abs(fai) < abs(fbi)){
            xi = ai
            }
            }
        senao{
            xi = bi
        }
    senao{
        se((ais == 0) and (bis == 0)){
            xi = (ai + bi)/2
            }
        senao{
            se (ais == 1){
                xi = ai
                }
            senao{
                xi = bi
                }
    retorne xi
}
funcao newton(real xi, real prec, realmaxIter){
    real fxi, Dfxi,erro, aux, fxi
    inteiro i 
    fxi  = calculo(xi)
    Dfxi = funcaoDerivada(xi)

    i    = 0
    erro = 1.0
    escreva("*************************************************************************")
    escreva("* Médoto de Newton")
    escreva("*************************************************************************")
    escreva("*   i\t\t  xi\t     fxi\t     Dfxib\t\t", erro);
    escreva("*************************************************************************")   
    escreva("*%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f",(i, xi, fxi, Dfxi, 1.0))
    enquanto ((erro >= prec) e (i <= maxIter) e (Dfxi != 0.0)){
        aux  = xi
        i    = i + 1
        xi   = xi - fxi/Dfxi
        fxi  = funcao(xi)
        Dfxi = funcaoDerivada(xi)        

        erro = abs(aux - xi)/abs(xi)
        escreva("*%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f",(i, xi, fxi, Dfxi, erro))
    escreva("*************************************************************************")     
    retorne xi, i, erro
}

funcao inicio() {
    real maxIter, prec, ai, bi, xi, nI, prec
    maxIter = 100
    prec    = 0.01
    ai      = 1.9
    bi      = 1.9
    err = newton(testeDaDerivadaSegunda(ai, bi), prec, maxIter)
    nI = newton(testeDaDerivadaSegunda(ai, bi), prec, maxIter)
    xi= newton(testeDaDerivadaSegunda(ai, bi), prec, maxIter)
    escreva("*************************************************************************")
    escreva("* Raíz                ",(xi))
    escreva("Número de Iterações", (nI))
    escreva("Erro             ",(err))
    escreva("*************************************************************************")
}
}
