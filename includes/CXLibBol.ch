//Vide documentacao da Febraban sobre o fator de vencimento
Static _dFatVcto	:= CtoD("07/10/1997") 	AS Date		//Fator de vencimento para o boleto
Static _dPrxFVct	:= _dFatVcto + 9000		AS Date
Static _nFxAnt		:= 3000 	AS Integer				//Faixa limite inferior ao dia atual
Static _nFxPos		:= 5500 	AS Integer				//Faixa limite superior ao dia atual
Static _cMskBol		:= '@R 99999.99999 99999.999999 99999.999999 9 99999999999999'		AS Character
Static _cMskCon		:= '@R 99999999999-9 99999999999-9 99999999999-9 99999999999-9'		AS Character
Static _nTamCB		:= 44	AS Integer	
Static _nTamLD		:= 48	AS Integer	

//Primeira dimensao do array _aPBol
Static _nNorm		:= 01	AS Integer	//Boleto Normal
Static _nConv		:= 02	AS Integer	//Convenio

//Segunda dimensao do array _aPBol
Static _nCB			:= 01	AS Integer	//Codigo de Barras
Static _nLD			:= 02	AS Integer	//Linha digitavel

//Terceira dimensao do array _aPBol
Static _nVct		:= 01	AS Integer	//Campo Vencimento
Static _nVlr		:= 02	AS Integer	//Campo Valor

//Este array contem as coordenadas dos campos Vencimento e Valor do boleto
Static _aPBol		:= __InitFun()	AS Array

//Preenchimento abaixo para ficar um pouco mais legível
Static Function __InitFun()
	Local aRet	:= Array(2,2,2)

	aRet[_nNorm][_nCB][_nVct] := {06,04,00,00}
	aRet[_nNorm][_nCB][_nVlr] := {10,10,00,00}
	aRet[_nNorm][_nLD][_nVct] := {34,04,00,00}
	aRet[_nNorm][_nLD][_nVlr] := {38,10,00,00}

	aRet[_nConv][_nCB][_nVct] := {20,08,00,00}
	aRet[_nConv][_nCB][_nVlr] := {05,11,00,00}
	aRet[_nConv][_nLD][_nVct] := {21,03,25,05}
	aRet[_nConv][_nLD][_nVlr] := {05,07,13,04}

Return aRet
