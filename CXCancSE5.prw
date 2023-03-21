#INCLUDE 'RWMake.ch'
#INCLUDE 'Totvs.ch'
#INCLUDE 'ParmType.ch'
#INCLUDE 'CXInclude.ch'

//#############################################################################
//##+----------+----------+-------+--------------------+------+-------------+##
//##|Programa  |CXCancSE5 | Autor | Cirilo Rocha       | Data | 24/12/2015  |##
//##+----------+----------+-------+--------------------+------+-------------+##
//##|Descricao | Funcao que retorna a expressao de filtro da SE5 para veri- |##
//##|          | ficar se existem cancelamentos ou estornos dos movimentos  |##
//##|          |                                                            |##
//##|          | Baseado parcialmente no fonte TemBxCanc (MATXFUNB)         |##
//##+----------+-----------+------------------------------------------------+##
//##|   DATA   |Programador| Manutencao Efetuada                            |##
//##+----------+-----------+------------------------------------------------+##
//##| 01/08/16 | Cirilo R. | Retirado o documento da chave, pois, estava    |##
//##|          |           | dando problema com as baixas de titulos normais|##
//##| 12/03/21 | Cirilo R. | Tratamento para o estorno de compensação de    |##
//##|          |           | cheques                                        |##
//##|          |           |                                                |##
//##|          |           |                                                |##
//##|          |           |                                                |##
//##+----------+-----------+------------------------------------------------+##
//#############################################################################
User Function CXCancSE5(	cAliasQry	,;	//01 Alias (def SE5)
							lApenasES	);	//02 Desconsidera apenas o estorno (def .T.), .F. desconsidera os dois movimentos
								AS Character

	Local cQuery	AS Character

	//Parâmetros da rotina-------------------------------------------------------------------------
	ParamType 0		VAR cAliasQry		AS Character		Optional Default 'SE5'
	ParamType 1		VAR lApenasES		AS Logical			Optional Default .T.

	//---------------------------------------------------------------------------------------------
	cQuery	:= ""
	cQuery 	+= "	( "+CRLF
	cQuery 	+= "	E5_SITUACA NOT IN ('C','X','E') " + CRLF //E e X sao estornos de movimentacao bancaria
	cQuery 	+= "	AND NOT EXISTS ( " + CRLF
	cQuery 	+= "					SELECT * " + CRLF
	cQuery 	+= "      				FROM "+RetSqlName('SE5')+" AUX " + CRLF
	cQuery 	+= "      				WHERE  AUX.D_E_L_E_T_ = '' " + CRLF
	cQuery 	+= "		              	AND AUX.E5_RECPAG  = (CASE WHEN "+cAliasQry+".E5_RECPAG = 'R' THEN 'P' ELSE 'R' END) " + CRLF
	If lApenasES
		cQuery 	+= "           				AND AUX.E5_TIPODOC = 'ES' " + CRLF //Testado e OK! em conjunto com o Situacao 'X' e 'E'
	EndIf
	//Baixa normal
	cQuery 	+= "      		      		AND AUX.E5_FILIAL  = "+cAliasQry+".E5_FILIAL " + CRLF
	cQuery 	+= "						AND	AUX.E5_PREFIXO = "+cAliasQry+".E5_PREFIXO " + CRLF
	cQuery 	+= "						AND AUX.E5_NUMERO  = "+cAliasQry+".E5_NUMERO " + CRLF
	cQuery 	+= "						AND AUX.E5_PARCELA = "+cAliasQry+".E5_PARCELA " + CRLF
	cQuery 	+= "						AND AUX.E5_TIPO    = "+cAliasQry+".E5_TIPO " + CRLF
	cQuery 	+= "						AND AUX.E5_CLIFOR  = "+cAliasQry+".E5_CLIFOR " + CRLF
	cQuery 	+= "						AND AUX.E5_LOJA    = "+cAliasQry+".E5_LOJA " + CRLF
//	cQuery 	+= "           				AND AUX.E5_DATA   >= "+cAliasQry+".E5_DATA    " + CRLF //Estava causando problemas
	//Compensacoes
//	cQuery 	+= "           				AND AUX.E5_DOCUMEN = "+cAliasQry+".E5_DOCUMEN " + CRLF //Estava dando problema na baixa normal
	//Operacoes bancarias (movimento bancario)
	cQuery 	+= "      			      	AND AUX.E5_BANCO   = "+cAliasQry+".E5_BANCO   " + CRLF
	cQuery 	+= "      			      	AND AUX.E5_AGENCIA = "+cAliasQry+".E5_AGENCIA " + CRLF
	cQuery 	+= "    	  		      	AND AUX.E5_CONTA   = "+cAliasQry+".E5_CONTA   " + CRLF
	cQuery 	+= "  	         			AND AUX.E5_NUMCHEQ = "+cAliasQry+".E5_NUMCHEQ " + CRLF
	cQuery 	+= "            			AND AUX.E5_SEQ     = "+cAliasQry+".E5_SEQ     " + CRLF
	//Tratamento específico para cancelamento compensação de cheques onde o estorno também fica marcado como ES
	cQuery 	+= "            			AND ( SE5.E5_TIPODOC <> 'CH' OR AUX.E5_SITUACA NOT IN ('C') ) " + CRLF
	cQuery 	+= "  						) " + CRLF
	cQuery 	+= "  ) " + CRLF

Return cQuery
