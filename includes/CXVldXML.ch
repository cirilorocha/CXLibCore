Static Function InitVldXML()
	
	//Cria variavel como privada um nivel acima
	_SetOwnerPrvt("cNumDoc"		, NIL )
	_SetOwnerPrvt("cSerDoc"		, NIL )
	_SetOwnerPrvt("cChvDoc"		, NIL )

	_SetOwnerPrvt("cCNPJChav"	, NIL )
	_SetOwnerPrvt("cCNPJEmit"	, NIL )
	_SetOwnerPrvt("cCNPJDest"	, NIL )
	_SetOwnerPrvt("cCNPJRem"	, NIL )
	_SetOwnerPrvt("cCNPJToma"	, NIL )

	_SetOwnerPrvt("dDataEmis"	, NIL )
	_SetOwnerPrvt("cTipoDoc"	, NIL )
	_SetOwnerPrvt("cTipoToma"	, NIL )
	_SetOwnerPrvt("cNmEmit"		, NIL )
	_SetOwnerPrvt("cModFrete"	, NIL )
	_SetOwnerPrvt("cNatOp"		, NIL )
	_SetOwnerPrvt("nProd"		, NIL )	//vProd
	_SetOwnerPrvt("nTotal"		, NIL )	//vNF
	_SetOwnerPrvt("nDesc"		, NIL )	//vDesc
	_SetOwnerPrvt("nSeg"		, NIL )	//vSeg
	_SetOwnerPrvt("nOutro"		, NIL )	//vOutro
	_SetOwnerPrvt("nFrete"		, NIL )	//vFrete

	_SetOwnerPrvt("nBC"			, NIL )	//vBC
	_SetOwnerPrvt("nICMS"	    , NIL )	//vICMS
	_SetOwnerPrvt("nBCST"	    , NIL )	//vBCST
	_SetOwnerPrvt("nICMSSt"		, NIL )	//vST
	_SetOwnerPrvt("nICMSDes"	, NIL )	//vICMSDeson

	_SetOwnerPrvt("nIPI"	    , NIL )	//vIPI
	_SetOwnerPrvt("nII"			, NIL )	//vII

	_SetOwnerPrvt("nPBruto"		, NIL )
	_SetOwnerPrvt("nPLiqui"		, NIL )
	_SetOwnerPrvt("cObs"		, NIL )
	
	_SetOwnerPrvt("cTpFrete"	, NIL )
	_SetOwnerPrvt("cTpDoc"		, NIL )
	_SetOwnerPrvt("cTpNF"		, NIL )	//Tipo Entrada/Saída
	_SetOwnerPrvt("cModal"		, NIL )	//Modal do CTe

	_SetOwnerPrvt("aDocRef"		, NIL )
	_SetOwnerPrvt("aEsp"		, NIL )
	_SetOwnerPrvt("aVol"		, NIL )
	_SetOwnerPrvt("aICMS"		, NIL )
	_SetOwnerPrvt("aIPI"		, NIL )
	_SetOwnerPrvt("aItensNF"	, NIL )	//array produtos Det[]
		
	If Type('_lArqVld') == 'U'
		_SetOwnerPrvt("_lArqVld"	, .F. )
	EndIf
	
	_SetOwnerPrvt("lCXVldXML"	, .T.)	//Marca como ja inicializadas variaveis

	//Posicoes Array aItensNF ---------------------------------------------------------------------
	_SetOwnerPrvt("nIT_ITEM"	, 01 )	//nItem
	_SetOwnerPrvt("nIT_COD"		, 02 )	//cProd
	_SetOwnerPrvt("nIT_DESCRI"	, 03 )	//xProd
	_SetOwnerPrvt("nIT_QUANT"	, 04 )	//qCom ou qTrib
	_SetOwnerPrvt("nIT_UCOM"	, 05 )	//uCom

	_SetOwnerPrvt("nIT_PRCUNT"	, 06 )	//Não existe no XML
	_SetOwnerPrvt("nIT_VLRTOT"	, 07 )	//vProd
	_SetOwnerPrvt("nIT_DESCON"	, 08 )	//vDesc
	_SetOwnerPrvt("nIT_VALFRE"	, 09 )	//vFrete
	_SetOwnerPrvt("nIT_SEGURO"	, 10 )	//vSeg
	_SetOwnerPrvt("nIT_DESPES"	, 11 )	//vOutro
	
	_SetOwnerPrvt("nIT_CSTICM"	, 12 )
	_SetOwnerPrvt("nIT_BASICM"	, 13 )
	_SetOwnerPrvt("nIT_PCIMS"	, 14 )
	_SetOwnerPrvt("nIT_VALICM"	, 15 )
	_SetOwnerPrvt("nIT_BCICRT"	, 16 )
	_SetOwnerPrvt("nIT_ICMRET"	, 17 )
	
	_SetOwnerPrvt("nIT_BASIPI"	, 18 )
	_SetOwnerPrvt("nIT_PIPI"	, 19 )
	_SetOwnerPrvt("nIT_VALIPI"	, 20 )
	
	_SetOwnerPrvt("nIT_CFOP"	, 21 )	//CFOP
	_SetOwnerPrvt("nIT_NCM"		, 22 )	//NCM
	_SetOwnerPrvt("nIT_ORIGEM"	, 23 )

	_SetOwnerPrvt("nIT_CODSB1"	, 24 )
	_SetOwnerPrvt("nIT_DSCSB1"	, 25 )
	_SetOwnerPrvt("nIT_NCMSB1"	, 26 )

	_SetOwnerPrvt("nIT_NFREF"	, 27 )
	_SetOwnerPrvt("nIT_SERREF"	, 28 )
	_SetOwnerPrvt("nIT_ITORIG"	, 29 )
	_SetOwnerPrvt("nIT_CHVREF"	, 30 )

	_SetOwnerPrvt("nIT_NUMPC"	, 31 )
	_SetOwnerPrvt("nIT_ITPC"	, 32 )
	_SetOwnerPrvt("nIT_LOCAL"	, 33 )
	_SetOwnerPrvt("nIT_LOTE"	, 34 )

	_SetOwnerPrvt("nIT_TAMARR" 	, 34 )

	//Posicoes dos impostos aICMS e aIPI ----------------------------------------------------------
	_SetOwnerPrvt("nIC_CST"		, 01 )
	_SetOwnerPrvt("nIC_BASE"	, 02 )
	_SetOwnerPrvt("nIC_PERC"	, 03 )
	_SetOwnerPrvt("nIC_VLRIMP"	, 04 )
	_SetOwnerPrvt("nIC_REDBC"	, 05 )
	_SetOwnerPrvt("nIC_ORIGEM"	, 06 )
	_SetOwnerPrvt("nIC_BCSTRT"	, 07 )
	_SetOwnerPrvt("nIC_VLSTRT"	, 08 )
	_SetOwnerPrvt("nIC_ICMDES"	, 09 )

	_SetOwnerPrvt("nIC_TAMARR"	, 09 )

Return
