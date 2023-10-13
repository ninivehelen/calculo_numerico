programa {
    procedimento leitDeArquivo(caracter endereco, referencia matriz matCoef, referencia vetor vetInd) {
        tentar {
            arq = abrirArquivo(endereco, 'r')
        } exceto (ErroDeLeitura) {
            escreva('Arquivo nao pode ser aberto!!!\n')
            sair(1)
        }

        m, M = [], []

        para cada linha em arq {
            linha = removerEspacos(linha)
            M = dividirString(linha)
            adicionarElemento(m, M)
        }

        fecharArquivo(arq)
        m = criarMatriz(m)

        ordem = comprimento(m)
        matCoef = criarMatrizZeros(ordem, ordem)
        vetInd = criarVetorZeros(ordem)

        para i de 0 ate ordem - 1 {
            para j de 0 ate ordem - 1 {
                matCoef[i][j] = converterParaReal(m[i][j])
            }
            vetInd[i] = converterParaReal(m[i][ordem])
        }
    }

    funcao logico criterioDeConvergencia(matCoef, vetInd) {
        logico criterio = verdadeiro

        para i de 0 ate comprimento(vetInd) - 1 {
            real soma = 0
            para j de 0 ate comprimento(vetInd) - 1 {
                se (i != j) {
                    soma = soma + abs(matCoef[i][j])
                }
            }

            se (soma > abs(matCoef[i][i])) {
                escreva('Criterio da diagonal dominante nao foi satisfeito!!!')
                criterio = falso
            }
        }

        retornar criterio
    }

    procedimento Jacobi(matCoef, vetInd, vetor x, real prec, inteiro maxIter) {
        vetor xaux = criarVetorZeros(comprimento(vetInd))
        vetor erro = criarVetorUns(comprimento(vetInd))
        inteiro k = 0

        escreva('************************************************************************************************************************')
        escreva('* Metodo de Jacobi')
        escreva('************************************************************************************************************************')
        escreva('*   i\t', fim = '')

        para i de 0 ate comprimento(vetInd) - 1 {
            escreva('   x(%2.0f)   ' %(i), fim = '')
        }

        para i de 0 ate comprimento(vetInd) - 1 {
            escreva('    err(%2.0f)  ' %(i), fim = '')
        }

        escreva('  erro  ', fim = '')
        escreva('\n************************************************************************************************************************')

        enquanto ((max(erro) >= prec) e (k < maxIter)) {
            escreva('* %4i' %(k), fim = '')

            para i de 0 ate comprimento(vetInd) - 1 {
                escreva('%10.6f  ' %(x[i]), fim = '')
                xaux[i] = x[i]
            }

            para i de 0 ate comprimento(vetInd) - 1 {
                erro[i] = 0
            }

            para i de 0 ate comprimento(vetInd) - 1 {
                real soma = 0

                para j de 0 ate comprimento(vetInd) - 1 {
                    se (i != j) {
                        soma = soma - (matCoef[i][j] * xaux[j])
                    }
                }

                x[i]    = (1 / matCoef[i][i]) * (soma + vetInd[i])
                erro[i] = abs(x[i] - xaux[i]) / abs(x[i])
            }

            k = k + 1
        }

        escreva('* %4i' %(k), fim = '')

        para i de 0 ate comprimento(vetInd) - 1 {
            escreva('%10.6f  ' %(x[i]), fim = '')
        }

        para i de 0 ate comprimento(vetInd) - 1 {
            escreva('%10.6f  ' %(erro[i]), fim = '')
        }

        escreva('%10.6f' %(max(erro)))
        escreva('************************************************************************************************************************')
    }

    funcao inicio() {
        real prec
        inteiro maxIter
        matriz matCoef
        vetor vetInd, x0, x, xaux, erro
        caracter endereco
        
        endereco = 'sistema.txt'
        
        leitDeArquivo(endereco, matCoef, vetInd)

        x0 = [0, 0, 0, 0, 0, 0]
        prec = 0.001
        maxIter = 10

        escreva(matCoef)
        escreva(vetInd)
        se (criterioDeConvergencia(matCoef, vetInd)) {
            escreva('Criterio da diagonal dominante foi satisfeito!!!')
            Jacobi(matCoef, vetInd, x0, prec, maxIter)
        }
    }
}
