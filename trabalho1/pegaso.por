programa {
  inclua biblioteca Matematica
funcao  calculo(real x)
{
    real  f
    f = 2 * (x*3 + x*3)
    retorne f
}

funcao  pegaso(real ai, real bi, real prec)
{
    inteiro i;
    real fai, fbi, xi, fxi, aux, erro
    
    fai  = calculo(ai)
    fbi  = calculo(bi)
    xi   = bi - (fbi / (fbi - fai)) * (bi - ai)
    fxi  = calculo(xi)
    
    i    = 1;
    escreva("\n***")
    escreva("\ti\t\tai\t\tfai\t\tb\t\tfbi\t\txi\t\tfxi\t\terro\n")
    escreva("\t%i\t%11.6f\t%11.6f\t%11.6f\t%11.6f\t%11.6f\t%11.6f\t%11.6f\n", i, ai, fai, bi, fbi, xi, fxi, 0.0)
    faca {
         if (fxi * fbi < 0) {
            ai  = bi
            fai = fbi
         } else {
            fai = fai * fbi / (fbi + fxi)
         };
         bi   = xi
         fbi  = fxi
        
         i    = i + 1
         aux  = xi
         xi   = bi - (fbi / (fbi - fai)) * (bi - ai)
         fxi  = funcao(xi)
         erro = (fabs(aux - xi))/(fabs(xi))
         escreva("\t%i\t%11.6f\t%11.6f\t%11.6f\t%11.6f\t%11.6f\t%11.6f\t%11.6f\n", i, ai, fai, bi, fbi, xi, fxi, erro)       
    } enquanto(erro >= prec)
    retorne xi
}

funcao inicio() 
{
    float prec, ai, bi

    prec = 0.01
    ai   = 1
    bi   = 2
    escreva("\na raiz e %f", pegaso(ai, bi, prec))
            
    retorne 0
}
}