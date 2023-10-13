programa{
funcao leitDeArquivo(caracter endereco)
    tentar{
        arq = abrirArquivo(endereco, 'r')
    }excepto (ErroDeLeitura){
        escrever('Arquivo não pode ser aberto!!!\n')
        sair(1)
        }
    m, M = [], []
    para cada linha em arq
        linha = linha.removerEspacos()
        M = linha.split()
        m.adicionar(M)
    fecharArquivo(arq)
    m = array(m)

    ordem = tamanho(m)
    matCoef = criarMatrizZeros(ordem, ordem)
    vetInd = criarVetorZeros(ordem)
    para i de 0 ate ordem-1
        para j de 0 ate ordem-1
            matCoef[i, j] = converterParaReal(m[i, j])
        vetInd[i] = converterParaReal(m[i, ordem])

    retornar matCoef, vetInd

funcao SobreRelaxacaoSucessiva(matCoef, vetInd, x, prec, maxIter, w){
    erro = criarVetorUns(tamanho(vetInd))
    k = 0
    escrever('************************************************************************************************************************')
    escrever('* Método da Sobre-relaxação Sucessiva')
    escrever('************************************************************************************************************************')
    escrever('*   i\t', fim = '')
    para cada i de 0 ate tamanho(vetInd)-1
        escrever('   x(%2.0f)   ' %(i), fim = '')
    para cada i de 0 ate tamanho(vetInd)-1
        escrever('    err(%2.0f)  ' %(i), fim = '')
    escrever('  erro  ', fim = '')        
    escrever('\n************************************************************************************************************************')
    
    enquanto (max(erro) >= prec) e (k < maxIter)
        escrever('* %4i' %(k), fim = '')
        para cada i de 0 ate tamanho(vetInd)-1
            escrever('%10.6f  ' %(x[i]), fim = '')
        para cada i de 0 ate tamanho(vetInd)-1
            escrever('%10.6f  ' %(erro[i]), fim = '')
        escrever('%10.6f' %(max(erro)))
            
        para cada i de 0 ate tamanho(vetInd)-1
            soma = 0
            aux = x[i]                
            para cada j de 0 ate tamanho(vetInd)-1
                se (i != j)
                    soma = soma - (matCoef[i][j] * x[j])
            x[i] = (w/matCoef[i][i]) * (soma + vetInd[i]) + (1 - w) * aux
            erro[i] = abs(x[i] - aux)/abs(x[i])
            
        k = k + 1

    escrever('* %4i' %(k), fim = '')
    para cada i de 0 ate tamanho(vetInd)-1
        escrever('%10.6f  ' %(x[i]), fim = '')
    para cada i de 0 ate tamanho(vetInd)-1
        escrever('%10.6f  ' %(erro[i]), fim = '')
    escrever('%10.6f' %(max(erro)))
    escrever('************************************************************************************************************************')

    retornar 0
}
funcao inicio(){
    matCoef, vetInd = leitDeArquivo('sistema.txt')
    x0 = [0, 0, 0, 0, 0] 
    prec = 0.00001
    maxIter = 500
    w = 1.2

    SobreRelaxacaoSucessiva(matCoef, vetInd, x0, prec, maxIter, w)
}
}