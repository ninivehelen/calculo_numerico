programa {
    funcao leituraDeArquivo(caracter endereco) {
       tentar {
            arq = abrirArquivo(endereco, 'r')
        } exceto (ErroDeLeitura) {
            escreva('Arquivo nao pode ser aberto!!!\n')
            sair(1)
        }
        matriz = []

        // Ler cada linha do arquivo
        enquanto (nao fimDoArquivo(arquivo)) {
            linha = lerLinha(arquivo)
            linha = removerEspacos(linha)
            vetorLinha = dividirString(linha)
            matriz.adicionar(vetorLinha)
        }

        // Fechar o arquivo
        fecharArquivo(arquivo)

        // Converter para array
        matriz = converterParaArray(matriz)

        // Obter a ordem da matriz
        ordem = obterComprimento(matriz)

        // Inicializar matrizes e vetores
        matrizCoef = criarArrayDeZeros(ordem, ordem)
        vetorIndep = criarArrayDeZeros(ordem)

        // Preencher as matrizes e vetores
        para i de 0 até ordem-1 {
            para j de 0 até ordem-1 {
                matrizCoef[i, j] = converterParaFlutuante(matriz[i, j])
            }
            vetorIndep[i] = converterParaFlutuante(matriz[i, ordem])
        }

        retornar matrizCoef, vetorIndep
    }

    funcao criterioDeConvergencia(matrizCoef, vetorIndep) {
        criterio = 1

        // Verificar o critério de diagonal dominante
        para i de 0 até obterComprimento(vetorIndep)-1 {
            soma = 0
            para j de 0 até obterComprimento(vetorIndep)-1 {
                se (i != j) {
                    soma = soma + valorAbsoluto(matrizCoef[i][j])
                }
            }
            se (soma > valorAbsoluto(matrizCoef[i][i])) {
                escrever("Critério da diagonal dominante não foi satisfeito!!!")
                criterio = 0
            }
        }

        retornar criterio
    }
r
    funcao gaussSeidel(referencia matrizCoef, vetor vetorIndep, vetor x, real precisao, real maxIter) {
        // Inicializar vetor de erros
        erro = criarArrayDeUns(obterComprimento(vetorIndep))

        k = 0

        // Exibir cabeçalho
        escrever("************************************************************************************************************************")
        escrever("* Método de Gauss-Seidel")
        escrever("************************************************************************************************************************")
        escrever("*   i\t", fim = '')

        // Exibir rótulos de colunas
        para i de 0 até obterComprimento(vetorIndep)-1 {
            escrever("   x(%2.0f)   " %(i), fim = '')
        }

        para i de 0 até obterComprimento(vetorIndep)-1 {
            escrever("    err(%2.0f)  " %(i), fim = '')
        }

        escrever("  erro  ", fim = '')        
        escrever("\n************************************************************************************************************************")

        // Enquanto a condição de parada não for atingida
        enquanto ((max(erro) >= precisao) e (k < maxIter)) {
            // Exibir valores atuais
            escrever("* %4i" %(k), fim = '')
            para i de 0 até obterComprimento(vetorIndep)-1 {
                escrever("%10.6f  " %(x[i]), fim = '')
            }

            para i de 0 até obterComprimento(vetorIndep)-1 {
                escrever("%10.6f  " %(erro[i]), fim = '')
            }

            escrever("%10.6f" %(max(erro)))

            // Atualizar os valores
            para i de 0 até obterComprimento(vetorIndep)-1 {
                soma = 0
                aux  = x[i]
                para j de 0 até obterComprimento(vetorIndep)-1 {
                    se (i != j) {
                        soma = soma - (matrizCoef[i][j] * x[j])
                    }
                }
                x[i]    = (1/matrizCoef[i][i]) * (soma + vetorIndep[i])
                erro[i] = valorAbsoluto(x[i] - aux)/valorAbsoluto(x[i])
            }

            k = k + 1
        }

        // Exibir valores finais
        escrever("* %4i" %(k), fim = '')
        para i de 0 até obterComprimento(vetorIndep)-1 {
            escrever("%10.6f  " %(x[i]), fim = '')
        }

        para i de 0 até obterComprimento(vetorIndep)-1 {
            escrever("%10.6f  " %(erro[i]), fim = '')
        }

        escrever("%10.6f" %(max(erro)))
        escrever("************************************************************************************************************************")

        retornar 0
    }

    funcao inicio() {
        // Leitura do arquivo e definição dos parâmetros
        matrizCoef, vetorIndep = leituraDeArquivo('sistema.txt')
        x0      = [4.8, 0.5, 2.2, 7.5] 
        precisao = 0.001
        maxIter = 10

        escrever(matrizCoef)
        escrever(vetorIndep)

        // Verificação do critério de convergência e execução do método
        se (criterioDeConvergencia(matrizCoef, vetorIndep)) {
            escrever("Critério da diagonal dominante foi satisfeito!!!")    
            gaussSeidel(matrizCoef, vetorIndep, x0, precisao, maxIter)
        }
    }
}
