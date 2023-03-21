//Operacoes possiveis na rotina MATA094------------------------------------------------------------

Static OP_LIB	:= "001" 	AS Character	// Liberado
Static OP_EST	:= "002" 	AS Character	// Estornar
Static OP_SUP	:= "003" 	AS Character	// Superior
Static OP_TRA	:= "004" 	AS Character	// Transferir Superior
Static OP_REJ	:= "005" 	AS Character	// Rejeitado
Static OP_BLQ	:= "006" 	AS Character	// Bloqueio
Static OP_VIW	:= "007" 	AS Character	// Visualizacao 	//NAO UTILIZAR

//Posicoes do retorno aRet-------------------------------------------------------------------------
Static cRET_ID	:= 02	AS Integer	//ID do Erro (Char)
Static cRET_MSG	:= 03	AS Integer	//Mensagem de erro (Char)
Static cRET_SOL	:= 04	AS Integer	//Solução Sugerida (Char)

Static nRET_TAM	:= 04   AS Integer	

Static lRET_OK	:= 01	AS Integer	//Operação realizada (Logico) //NESTE LOCAL PARA DIMINUIR OS AVISOS
