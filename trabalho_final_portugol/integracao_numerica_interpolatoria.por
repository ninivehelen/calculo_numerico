Algoritmo IntegracaoNumerica
//Integração Numérica - Fórmulas de Quadratura Interpolatória
Funcao Funcao(x: Real) : Real
    retorne Exp(x) * Cos(x)
    // Pode-se alternar para outras funções, como RaizQuadrada(x) ou Logaritmo(x)

Procedimento Pontos(li: Real, ls: Real, nh: Inteiro, Var h: Real, Var xi: Vetor[0..nh] de Real, Var fxi: Vetor[0..nh] de Real)
    h = (ls - li) / nh
    xi[0] = li
    xi[nh] = ls
    fxi[0] = Funcao(li)
    fxi[nh] = Funcao(ls)
    Para i de 1 ate nh Faca
        xi[i] = xi[i - 1] + h
        fxi[i] = Funcao(xi[i])

Procedimento ImpressaoDosPontos(xi: Vetor, fxi: Vetor)
    Para i de 1 ate Comprimento(xi) Faca
        Escreva('*********')
    Escreva('*')
    Escreva('* n   \t', xi)
    Escreva('* x   \t', fxi)
    Escreva('* f(x)\t', fxi)
    Para i de 1 ate Comprimento(xi) Faca
        Escreva('*********')
    Escreva('*')

Funcao RegraDoTrapezioGeneralizada(h: Real, xi: Vetor, fxi: Vetor) : Real
    soma01 = fxi[0] + fxi[Comprimento(xi) - 1]
    soma02 = 0
    Para i de 1 ate Comprimento(xi) - 2 Faca
        soma02 = soma02 + fxi[i]
    I1 = (h / 2) * (soma01 + 2 * soma02)
    retorne I1

Funcao Regra1_3DeSimpson(h: Real, xi: Vetor, fxi: Vetor) : Real
    soma01 = fxi[0] + fxi[Comprimento(xi) - 1]
    soma02 = 0
    Para i de 1 ate Comprimento(xi) - 2 Faca
        Se (i MOD 2 = 0) Entao
            coef = 4
        Senao
            coef = 2
        FimSe
        soma02 = soma02 + coef * fxi[i]
    I2 = (h / 3) * (soma01 + soma02)
    retorne I2

Funcao Regra3_8DeSimpson(h: Real, xi: Vetor, fxi: Vetor) : Real
    soma01 = fxi[0] + fxi[Comprimento(xi) - 1]
    soma02 = 0
    Para i de 1 ate Comprimento(xi) - 2 Faca
        Se ((i + 1) MOD 3 = 0) Entao
            coef = 2
        Senao
            coef = 3
        FimSe
        soma02 = soma02 + coef * fxi[i]
    I3 = (3 / 8) * h * (soma01 + soma02)
    retorne I3

// Programa Principal
Var li, ls, nh: Real
Var h, x, fx: Vetor[0..100] de Real
Var s: Inteiro

li = 0.0
ls = 1.2
nh = 6

Pontos(li, ls, nh, h, x, fx)
ImpressaoDosPontos(x, fx)
Escreva('Regra do Trapézio    : I1 = ', RegraDoTrapezioGeneralizada(h, x, fx))
Escreva('Regra 1/3 de Simpson : I2 = ', Regra1_3DeSimpson(h, x, fx))
Escreva('Regra 3/8 de Simpson : I3 = ', Regra3_8DeSimpson(h, x, fx))
