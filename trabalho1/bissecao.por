programa {
// Algoritmo da Bisseção em portugol
funçao calculo(float x){
  float f;
  f =  (3 * (x ^ 2) - 7 * x + 2);
  retorne f;
}

funçao bisseccao(float ai, float bi, float prec)
{
    int i ;
    float fai, fbi, fai ,xi fxi, var;

    fai =  calculo(ai);
    fbi =  calculo(bi);
    xi  = (ai + bi)/2;
    fxi =  calculo(xi);
    
    i  = 1;
    escreva("\n***");
    escreva("\ti\t\tai\t\tfai\t\tb\t\tfbi\t\txi\t\tfxi\t\terro\n");
    escreva("\t\t\t\t\t\t\t\t\n", i, ai, fai, bi, fbi, xi, fxi);
    faca {
         if (fxi * fai > 0) {
            ai  = xi;
            fai = fxi;
         } else {
            bi  = xi;
            fbi = fxi;
         };
         i    =  i + 1;
         aux  =  xi;
         xi   =   (ai + bi)/2;
         fxi  =  funcao(xi);
         erro = (fabs(aux - xi))/(fabs(xi));
         printf("\t\t\t\t\t\t\t\t\n", i, ai, fai, bi, fbi, xi, fxi, erro);        
    } enquanto(erro >= prec); 
    retorne xi;
}

int main()
{
    float ai, bi ;
    float prec, ai, bi;

    prec =  0.01;
    ai   = 1;
    bi   =  4;
    printf ("\na raiz e %f", bisseccao(ai, bi, prec));
            
    retorne 0;
}
}
