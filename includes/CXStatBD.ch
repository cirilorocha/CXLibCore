/*
CONJUNTO DE FUNÇÕES PARA MEDIR OS TEMPOS DE EXECUÇÃO DAS ROTINAS DE COMUNICAÇÃO COM O BANCO DE DADOS
*/
Static aEstatist	:= {}										AS Array
//-------------------------------------------------------------------------------------------------
Static Function _UpdStat(nOp,uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
	
	//Declaracao de variaveis----------------------------------------------------------------------
	Local uRet		AS Variant
	Local nInicio	AS Numeric
	Local nFinal	AS Numeric
	Local cChvFun	AS Character
	Local cChvFun2	AS Character
	
	//Inicializa Variaveis-------------------------------------------------------------------------
	nInicio		:= Seconds()
	cChvFun		:= ProcName(2)

	If nOp == 1
		cChvFun2:= 'MpSysExecScalar'
		uRet	:= MPSySExECScAlaR(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
	ElseIf nOp == 2
		cChvFun2:= 'MpSysOpenQuery'
		uRet	:= MPSySOPeNQuErY(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
	ElseIf nOp == 3
		cChvFun2:= 'Posicione'
		uRet	:= PoSiCiOnE(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
	ElseIf nOp == 4
		cChvFun2:= 'MsSeek'
		uRet	:= MSSeEk(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
	ElseIf nOp == 5
		cChvFun2:= 'DbSeek'
		uRet	:= DbSeEK(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
	ElseIf nOp == 6
		cChvFun2:= 'CXExecQuery'
		uRet	:= U_cxExEcQUerY(@uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
	ElseIf nOp == 7
		cChvFun2:= 'CXQryCount'
		uRet	:= U_cxQRycOuNT(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
	EndIf
	nFinal	:= Seconds()
	
	_GrvStat(cChvFun,(nFinal-nInicio) )
	_GrvStat(cChvFun2,(nFinal-nInicio) )
	_GrvStat(cChvFun+'-'+cChvFun2, (nFinal-nInicio) )
	
Return uRet

//-------------------------------------------------------------------------------------------------
Static Function _GrvStat(cChvFun,nTempo)
	
	//Declaracao de variaveis----------------------------------------------------------------------
	Local nPos		AS Numeric
	
	//Inicializa Variaveis-------------------------------------------------------------------------
	nPos	:= aScan(aEstatist,{|x| x[1] == cChvFun })
	If nPos == 0
		aAdd(aEstatist,{cChvFun,0,0})
		nPos	:= Len(aEstatist)
	EndIf
	aEstatist[nPos][2]++			//Contagem de execuções
	aEstatist[nPos][3]	+= nTempo	//Tempo de execuções
Return

//-------------------------------------------------------------------------------------------------
Static Function _GetResult()
	
	aSort(aEstatist,,, { |x, y| x[3] > y[3] } )	//Maior tempo para menor
	
Return U_CXMostraTipo(aEstatist)

//-------------------------------------------------------------------------------------------------
Static Function U_MpSysExecScalar(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
Return _UpdStat(1,uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
//-------------------------------------------------------------------------------------------------
Static Function U_MpSysOpenQuery(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
Return _UpdStat(2,uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
//-------------------------------------------------------------------------------------------------
Static Function U_Posicione(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
Return _UpdStat(3,uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
//-------------------------------------------------------------------------------------------------
Static Function U_MsSeek(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
Return _UpdStat(4,uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
//-------------------------------------------------------------------------------------------------
Static Function U_DbSeek(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
Return _UpdStat(5,uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
//-------------------------------------------------------------------------------------------------
Static Function CXExecQuery(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
Return _UpdStat(6,@uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
//-------------------------------------------------------------------------------------------------
Static Function CXQryCount(uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
Return _UpdStat(7,uPar1,uPar2,uPar3,uPar4,uPar5,uPar6,uPar7,uPar8)
//-------------------------------------------------------------------------------------------------

#Define MpSysExecScalar U_MpSysExecScalar
#Define MpSysOpenQuery 	U_MpSysOpenQuery
#Define Posicione 		U_Posicione
#Define MsSeek 			U_MsSeek
#Define DbSeek 			U_DbSeek

#Define U_CXExecQuery 	CXExecQuery
#Define U_CXQryCount 	CXQryCount