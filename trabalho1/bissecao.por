programa {
  inclua biblioteca Matematica

// Algoritmo da Bisseção em Portugol

funcao calculo(real x) {
    real f
    f = 3 * (x * x) - 7 * x + 2
    retorne f
}

funcao abs(real x) {
        se (x >= 0) {
            retorne x
        } senao {
            retorne -x
        }
    }

funcao bisseccao(real ai, real bi, real prec) {
    inteiro i
    real fai, fbi, xi, fxi, aux, erro
    
    fai = calculo(ai)
    fbi = calculo(bi)
    xi = (ai + bi) / 2
    fxi = calculo(xi)

    i = 1
  
    escreva("i\t\tai   \t\tfai\t\tbi\t\tfbi\t\txi\t\tfxi\t\terro\n")
    escreva(i,"  ", ai,"     ", fai,"       ", bi,"       ", fbi,"      ", xi,"       ", fxi, "       -\n")
    
    faca {
        se (fxi * fai > 0) {
            ai = xi
            fai = fxi
        } senao {
            bi = xi
            fbi = fxi
        }
        i = i + 1
        aux = xi
        xi = (ai + bi) / 2
        fxi = calculo(xi)
        erro = abs(aux - xi) / abs(xi)
        escreva(i,"  ", Matematica.arredondar(ai, 2),"   ", Matematica.arredondar(fai, 2),"   ", Matematica.arredondar(bi, 2),"    ", Matematica.arredondar(fbi,2),"   ", Matematica.arredondar(xi, 2),"    ", Matematica.arredondar(fxi, 2),  Matematica.arredondar(erro, 2), "\n")
         
    } enquanto (erro >= prec)
    
    retorne xi
}

funcao inicio() {
    real ai, bi, prec

    prec = 0.01
    ai = 1
    bi = 4
    escreva("\na raiz eh ", bisseccao(ai, bi, prec))

    retorne 0
}
}
