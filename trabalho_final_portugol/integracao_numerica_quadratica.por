Algoritmo IntegracaoNumerica
// Integração Numérica - Fórmulas de Quadratura Interpolatória

Funcao Funcao(x: Real) : Real
    //f = Exp(x) * Cos(x)
    //f = RaizQuadrada(x)
    f = Logaritmo(x)
    retorne f

Funcao leituraDeArquivo(endereco: Texto) : Vetor[1..2] de Vetor[1..100] de Real
    Var arq: Arquivo
    Var X, Y: Real
    Var x, y: Vetor[1..100] de Real
    x[1] = 0.0
    y[1] = 0.0

    Tentar
        arq = AbrirArquivo(endereco, Leitura)
    Senao
        Escrever('Arquivo não pode ser aberto!!!')
        FecharArquivo(arq)
        Pare
    FimTentar

    Enquanto Nao FimDeArquivo(arq) Faca
        Ler(arq, X, Y)
        x[aux] = X
        y[aux] = Y
        aux = aux + 1
    FimEnquanto

    FecharArquivo(arq)
    retorne x, y

Procedimento impressaoDosPontos(xi: Vetor, fxi: Vetor)
    Para i de 1 ate Comprimento(xi) Faca
        Escreva('*********')
    Escreva('*')
    Escreva('* n   \t', xi)
    Escreva('* x   \t', fxi)
    Escreva('* f(x)\t', fxi)
    Para i de 1 ate Comprimento(xi) Faca
        Escreva('*********')
    Escreva('*')

Funcao regraDoTrapezioGeneralizada(h: Real, xi: Vetor, fxi: Vetor) : Real
    Var soma01, soma02, I1: Real
    soma01 = fxi[1] + fxi[Comprimento(xi)]
    soma02 = 0
    Para i de 1 ate Comprimento(xi) - 2 Faca
        soma02 = soma02 + fxi[i + 1]
    FimPara
    I1 = (h/2) * (soma01 + 2 * soma02)
    retorne I1

Funcao regra1_3DeSimpson(h: Real, xi: Vetor, fxi: Vetor) : Real
    Var soma01, soma02, coef, I2: Real
    soma01 = fxi[1] + fxi[Comprimento(xi)]
    soma02 = 0
    Para i de 1 ate Comprimento(xi) - 2 Faca
        Se (i MOD 2 = 0) Entao
            coef = 4
        Senao
            coef = 2
        FimSe
        soma02 = soma02 + coef * fxi[i + 1]
    FimPara
    I2 = (h/3) * (soma01 + soma02)
    retorne I2

Funcao regra3_8DeSimpson(h: Real, xi: Vetor, fxi: Vetor) : Real
    Var soma01, soma02, coef, I3: Real
    soma01 = fxi[1] + fxi[Comprimento(xi)]
    soma02 = 0
    Para i de 1 ate Comprimento(xi) - 2 Faca
        Se ((i + 1) MOD 3 = 0) Entao
            coef = 2
        Senao
            coef = 3
        FimSe
        soma02 = soma02 + coef * fxi[i + 1]
    FimPara
    I3 = (3/8) * h * (soma01 + soma02)
    retorne I3

// Programa Principal
Var x, fx: Vetor[1..100] de Real
Var h, s: Real
Var aux: Inteiro
x, fx = leituraDeArquivo('dados.txt')
h = x[2] - x[1]
aux = impressaoDosPontos(x, fx)
Escreva('Regra do Trapézio    : I1 = ', regraDoTrapezioGeneralizada(h, x, fx))
Escreva('Regra 1/3 de Simpson : I2 = ', regra1_3DeSimpson(h, x, fx))
Escreva('Regra 3/8 de Simpson : I3 = ', regra3_8DeSimpson(h, x, fx))
