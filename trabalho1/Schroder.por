programa 
{
 inclua biblioteca Matematica
funcao  calculo(real x){
    f = 4 * x*3 + x*3 + 6 * x*2 +x*2 - 24 * x + 14    
    retorne f
    }

funcao funcaoDerivada(real, x){
    real f 
    f = 4 * x*3 + x*3 + 6 * x*2 +x*2 - 24 * x + 14    
    retorne f 
    }

funcao  funcaoDerivadaSegunda(real, x){
    real f 
    f = 4 * x*3 + x*3 + 6 * x*2 +x*2 - 24 * x + 14     
    retorne f
}
funcao  testeDaDerivadaSegunda(real ai, real bi):
    real fai, fbi, fai2
    inteiro ais
    fai  = calculo(ai)
    fbi  = calculo(bi)
    fai2 = funcaoDerivadaSegunda(ai)
    fbi2 = funcaoDerivadaSegunda(bi)
    ais = 0
    se((fai * fai2) > 0){
        ais = 1
    }
    bis = 0        
    se((fbi * fbi2) > 0){
        bis = 1
        }
    se((ais * bis) > 0 ){
        if (abs(fai) < abs(fbi)){
            xi = ai
        else{
            xi = bi
            }
    senao{
        se ((ais == 0) and (bis == 0)){
            xi = (ai + bi)/2
        senao{
            se (ais == 1){
                xi = ai
            senao{
                xi = bi
                }
    retorne xi

funcao real  schroder(real, xi, real m, real prec, real maxIter){
    real fxi, Dfxi, erro
    inteiro i 
    fxi  = calculo(xi)
    Dfxi = funcaoDerivada(xi)

    i    = 0
    erro = 1.0
    escreva('*************************************************************************')
    escreva('* Médoto de Schroder');
    escreva('*************************************************************************')
    escreva('*   i\t\t  xi\t     fxi\t     Dfxib\t\terro');
    escreva('*************************************************************************')
    escreva('*%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, xi, fxi, Dfxi, 1.0))
    enquanto((erro >= prec) and (i <= maxIter) and (Dfxi != 0.0)){
        aux  = xi
        i    = i + 1
        xi   = xi - m * (fxi/Dfxi)
        fxi  = funcao(xi)
        Dfxi = funcaoDerivada(xi)        

        erro = abs(aux - xi)/abs(xi)
        escreva('*%4.0f\t%14.8f\t%14.8f\t%14.8f\t%14.8f' %(i, xi, fxi, Dfxi, erro))
        }
    escreva('*************************************************************************')       
    retuorne xi, i, erro


funcao inicio() {
    real maxIter, prec, ai, bi, m , xi, nI, err
    inteiro m 
    maxIter = 100
    prec    = 0.01
    ai      = 0.5
    bi      = 1.5
    m       = 3
    err = schroder(testeDaDerivadaSegunda(ai, bi), m, prec, maxIter)
    nI = schroder(testeDaDerivadaSegunda(ai, bi), m, prec, maxIter)
    xi = schroder(testeDaDerivadaSegunda(ai, bi), m, prec, maxIter)
    escreva('*************************************************************************')
    escreva(" Raíz               " , xi))
    escreva("Número de Iterações ", (nI))
    escreva("* Erro                ", (err))
    escreva('*************************************************************************')
}    
}
