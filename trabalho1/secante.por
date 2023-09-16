programa 
{
  inclua biblioteca Matematica

funcao calculo(real x){
    real f
    f = 2 * (x ^ 3) - (x + 1) - 3
    retorne f
}
funcao secante(real ai, real  bi, real prec)
{
    inteiro i;
    real fai, fbi, xi, fxi, aux, erro
    
    fai  = calculo(ai)
    fbi  = calculo(bi)
    se  (abs(fai) < abs(fbi)) {
        aux = ai 
        ai  = bi
        bi  = aux
        aux = fai
        fai = fbi
        fbi = aux
    }
    xi   = bi - (fbi / (fbi - fai)) * (bi - ai)
    fxi  = calculo(xi)
    
    i    = 1
    escreva("\n***")
    escreva("\ti\t\tai\t\tfai\t\tb\t\tfbi\t\txi\t\tfxi\t\terro\n")
    escreva"\t\t\t\t\t\t\t\t\n", i, ai, fai, bi, fbi, xi, fxi, 0.0)
    faca {
         i   = i + 1
         ai  = bi
         fai = fbi
         bi  = xi
         fbi = fxi
        
         aux  = xi
         xi   = bi - (fbi / (fbi - fai)) * (bi - ai)
         fxi  = calculo(xi)
         erro = (mat.valor_absoluto(aux - xi))/(mat.valor_absoluto(xi))
         escreva("\t\t\t\t\t\t\t\t\n", i, ai, fai, bi, fbi, xi, fxi, erro)       
    } enquanto (erro >= prec)
    retorne xi
}
funcao inicio()
{
    real ai, bi 
    real prec, ai, bi

    prec =  0.01
    ai   = -1
    bi   =  2
    escreva("\na raiz e %f", bisseccao(ai, bi, prec))
            
    retorne 0
}
