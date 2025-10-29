#INCLUDE "rwmake.ch"
#INCLUDE "SHELL.CH"
#INCLUDE "Protheus.ch"
#INCLUDE "TBICONN.CH"
#include 'FWCommand.CH'
#Include "ParmType.ch"
#Include "CXInclude.ch"

Static _cVersao := "1.61"							AS Character
Static _cDtVersao := "29/10/2025"					AS Character

// MANTER EM .PRW PARA PODER EXECUTAR STATICCALL
//#############################################################################
//##+==========+============+=======+===================+======+============+##
//##|Programa  | CXTestFunc | Autor | Cirilo Rocha      | Data | 28/05/2009 |##
//##+==========+============+=======+===================+======+============+##
//##|Descr.    | Fun��o gen�rica para execu��o de fontes.                   |##
//##|          |                                                            |##
//##|          | Utilizada para testar fun��es customizadas sem ter que     |##
//##|          |  criar a rotina no menu                                    |##
//##|          |                                                            |##
//##|          | Ela chama uma pergunta onde pode ser digitada uma fun��o   |##
//##|          |  customizada para o sistema executar                       |##
//##+==========+===========+================================================+##
//##|   DATA   |Programador| Manuten��o efetuada                            |##
//##+==========+===========+================================================+##
//##| 11/05/10 | Cirilo R. | Acrescentada op��o de informar os argumentos   |##
//##|          |           |  na fun��o                                     |##
//##| 14/08/11 | Cirilo R. | Alterado o ValidPerg para CXPergunta()         |##
//##| 26/08/11 | Cirilo R. | Adicionada nova pergunta para setar o m�dulo   |##
//##|          |           |  para execu��o                                 |##
//##| 02/09/11 | Cirilo R. | Adicionada mensagem com o retorno da fun��o    |##
//##|          |           |  executada.                                    |##
//##| 06/09/11 | Cirilo R. | Melhoria nos tratamentos das vari�veis dos     |##
//##|          |           |  m�dulos.                                      |##
//##| 08/09/11 | Cirilo R. | Melhoria na tela que mostra o retorno das fun- |##
//##|          |           |  ��es executadas                               |##
//##| 12/03/12 | Cirilo R. | Melhoria para permitir a execu��o desta fun��o |##
//##|          |           |  para poder ser executada dentro do IDE        |##
//##| 29/03/12 | Cirilo R. | Pequeno ajuste na abertura do SM0              |##
//##| 05/04/12 | Cirilo R. | Melhoria para listar retornos tipo array       |##
//##| 17/07/12 | Cirilo R. | Feito tratamento para aceitar executar fun��es |##
//##|          |           |  de baixo n�vel escritas em C/C++ que est�o    |##
//##|          |           |  compiladas diretamente nos bin�rios           |##
//##| 21/11/16 | Cirilo R. | Pequena melhoria na execu��o da fun��o         |##
//##| 23/01/17 | Cirilo R. | Feito tratamento de erro para n�o fechar a     |##
//##|          |           |  execu��o                                      |##
//##| 06/03/17 | Cirilo R. | Pequena revis�o no fonte                       |##
//##| 07/05/17 | Cirilo R. | Adicionada pesquisa para as informa��es do fon-|##
//##|          |           |  te e da fun��o                                |##
//##| 09/08/17 | Cirilo R. | Melhoria no controle de vari�veis de ambiente, |##
//##|          |           |  transa��o e controle de numera��es            |##
//##| 19/10/17 | Cirilo R. | Adicionadas fun��es para liberar transa��es e  |##
//##|          |           |  o arquivo do spool                            |##
//##| 29/04/18 | Cirilo R. | Controle de chamadas recursivas                |##
//##|          |           | Pequena revis�o do fonte                       |##
//##|          |           | Melhoria na valida��o dos fontes               |##
//##| 19/05/18 | Cirilo R. | Colocada a tela de retorno em fullscreen       |##
//##| 12/10/21 | Cirilo R. | Pequena revis�o (release 33)                   |##
//##| 16/12/21 | Cirilo R. | Mantido formato PRW para usar StaticCall       |##
//##| 05/04/22 | Cirilo R. | Adicionado par�metro com o c�digo de usu�rio   |##
//##|          |           |  para execu��o                                 |##
//##| 25/11/22 | Cirilo R. | Melhoria para buscar informa��es de classes    |##
//##| 19/04/23 | Cirilo R. | Melhoria para tamb�m informar a database       |##
//##| 02/11/23 | Cirilo R. | Corre��o na tela de sele��o de filiais para    |##
//##|          |           |  gest�o corporativa                            |##
//##| 29/10/25 | Cirilo R. | Moderniza��o das telas de interface            |##
//##|          |           | Talvez corrija alguns erros de execu��o        |##
//##|          |           |                                                |##
//##|          |           |                                                |##
//##+==========+===========+================================================+##
//#############################################################################
//Bloco de codigo de tratamento de erro
Static bErroCst      := {|oErr| MsgErroCst(oErr) }		AS CodeBlock
//-------------------------------------------------------------------------------------------------
User Function CXTestFunc()

	//Declaracao de variaveis----------------------------------------------------------------------
	Local uRet	          	AS Variant

	//Salva as variaveis publicas para restaurar apos a execucao
	Local cEmpBak			AS Character
	Local cFilBak           AS Character
	Local oArea             AS Object
//	Local aParam            AS Array
	Local nSvSx8Len         AS Numeric
	Local nRecSM0           AS Numeric
	Local dDtBak			AS Date

	Local cModAnt		    AS Character
	Local nModAnt		    AS Numeric
	Local cMenuAnt		    AS Character

	Local nX                AS Numeric
	Local nPos				AS Numeric
	Local lAchou            AS Logical
	Local cMsg              AS Character
	Local lCarrAmb		    AS Logical
	Local lRet			    AS Logical

	Local bErroBak          AS CodeBlock
	
	Private INCLUI,ALTERA   AS Variant

	Private lExecutou	    AS Logical
	Private lErroProc	    AS Logical

	Private aFuncArray      AS Array
	Private aClsArr			AS Array

	//Otimizacao
	Private aFuncRPO        AS Array
	Private aType		    AS Array
	Private aFile		    AS Array
	Private aLine		    AS Array
	Private aDate		    AS Array
	Private aTime		    AS Array

	Private cUsrRot			AS Character

	//Posicoes Array aClsArr
	Private nCL_NOME	:= 01	AS Integer
	Private nCL_PARENT	:= 02	AS Integer
	Private nCL_ATRIB	:= 03	AS Integer
	Private nCL_METHOD	:= 04	AS Integer

	//Inicializa Variaveis-------------------------------------------------------------------------
	cModAnt		:= ''
	nModAnt		:= 99
	cMenuAnt	:= ''

//	cEmpAtu		:= ''
	lCarrAmb	:= .F.

	lExecutou	:= .F.
	lErroProc	:= .F.

	//Otimizacao
	aType		:= {}
	aFile		:= {}
	aLine		:= {}
	aDate		:= {}
	aTime		:= {}

	//Tive que fazer essa prote��o porque o padr�o est� chamando esse fonte recursivamente por
	// conta da fun��o EvalTrigger()->EvalGeneric() dentro do ExecAuto
	If FWIsInCallStack('EVALGENERIC')
		Return
	EndIf

	//---------------------------------------------------------------------------------------------
    //Controle de chamadas recursivas
    If Type('_lRecursivo') <> 'L'
		lAchou	:= .F.
		For nX := 0 to 20
			If ProcName(nX) == 'U_CXTESTFUNC'
				//Chamada Recursiva
				If lAchou
					cMsg	:= U_CXTxtMsg()+"ERRO: CHAMADA RECURSIVA CXTESTFUNC()."
					U_CXConOut('######### '+ANSIToOEM(cMsg)+' #########')
					ApMsgAlert(cMsg,U_CXTxtMsg(,,.T.))
					Return
				EndIf
				lAchou	:= .T.
			EndIf
		Next
	EndIf
	
	Private aModulos	:= RetModName(.T.)

	Private aCbMod		:= {}

	//Acrescenta o modulo configurador pois este nao vem na funcao padrao
	//aAdd(aModulos,{99,'SIGACFG','Configurador',.F.,'',99})

	//Ordena por nome do modulo
	ASort ( aModulos, , , { |x,y| x[3] < y[3] } )

	//Preenche combo
	For nX := 1 to len(aModulos)
		aAdd(aCbMod,aModulos[nX][3])
	Next

	//---------------------------------------------------------------------------------------------
	//Se N�O foi executado a partir do configurador
	If Type('cFilAnt') == 'U'
		Private aSM0EmpFil	:= {}

		Private cEmp_			:= ''
		Private cFil_			:= ''
		Private cMod_			:= ''

		//Seleciona a empresa / filial
		If !SelEmpFil()
			Return
		EndIf

		nPos		:= aScan(aCbMod,{|x| AllTrim(x) == AllTrim(cMod_) })
		If nPos == 0
			cMod_	:= 'FAT'
		Else
			cMod_	:= Rtrim(SubStr(aModulos[nPos][2],5))
		EndIf

		RpcClearEnv()

		// N�o consome licensa de uso
		RPCSetType(3)

		// Abre ambiente de trabalho -- FWMSGRUN DEU PAU EM ALGUNS AMBIENTES!!!!
		//MsgRun('Aguarde...',U_CXTxtMsg()+"Montando Ambiente. Empresa [" + cEmp_ + "] Filial [" + cFil_ +"].",;
		MsAguarde(;
		;//FWMsgRun(/*oSay*/,;
				{||	;
					lRet := RPCSetEnv(	cEmp_			,;	//01 Empresa
										cFil_			,;	//02 Filial
										/*cEnvUser*/	,;	//03 Usuario
										/*cEnvPass*/	,;	//04 Senha de Usuario
										cMod_			,;	//05 Modulo (3ch)
										'CXTestFunc'	,;	//06 Nome da Funcao
										/*aTables*/		,;	//07 Tabelas para abrir
										/*lShowFinal*/	,;	//08 Alimenta a variavel lMsFinalAuto
										.F.				,;	//09 Gera mensagem de erro ao ocorrer erro ao checar a licenca
										.T.				,;	//10 Pega a primeira filial do arquivo SM0 quando n�o passar a filial e realiza a abertura dos SXs
										.T.				);	//11 Faz a abertura da conexao com servidor do banco
							},;
				U_CXTxtMsg()+" Montando Ambiente. Empresa [" + cEmp_ + "] Filial [" + cFil_ +"].",;
				"Aguarde...")
//		PREPARE ENVIRONMENT EMPRESA Left(cEmp_,2) FILIAL Left(cFil_,2)

        If .Not. lRet
			FwAlertWarning(	'N�o foi poss�vel montar o ambiente selecionado.',_MsgLinha_)
            Return
        EndIf

		//-- Single Sign-On
		If .Not. sfSingleSignOn(@__cUserID)
			//-- Fecha o ambiente
			RpcClearEnv()
			Return
		EndIf

		U_CXSetUsr(__cUserID)
		__cInternet	:= NIL			//-- Preciso colocar aqui para for�ar mostrar mensagens
		lMsHelpAuto := .F.			//-- Preciso colocar aqui para for�ar mostrar mensagens
		lCarrAmb	:= .T. 			//-- Carregou o ambiente
		
		//PRECISO ABRIR OS SX'S AQUI PARA FUNCIONAR CORRETAMENTE
		OpenSm0()	//Abre o sigamat
		SIX->(dbSetOrder(1))	;	SX1->(dbSetOrder(1))	;		SX2->(dbSetOrder(1))
		SX3->(dbSetOrder(1))	;	SX5->(dbSetOrder(1))	;		SX6->(dbSetOrder(1))
		SX7->(dbSetOrder(1))	;	SX9->(dbSetOrder(1))	;		SXA->(dbSetOrder(1))
		SXB->(dbSetOrder(1))

		_lRecursivo	:= .F.	//Desativa o controle de recursividade

		//Cria uma janela principal para trabalho
		Public oMainWnd					AS Object
		
		oMainWnd := TWindow():New( 0, 0, 600, 800, U_CXTxtMsg()+"CXTestFunc-oMainWnd",,,,,,,,,,,,.T.,.T.,.T.,.T.,.T.)
		oMainWnd:Activate( "MAXIMIZED", oMainWnd:bLClicked, oMainWnd:bRClicked, oMainWnd:bMoved,;
							oMainWnd:bResized, oMainWnd:bPainted, oMainWnd:bKeyDown, oMainWnd:bInit := { | Self | (U_CXTestFunc(),oMainWnd:End()) },;
							,,,,,,,,,, oMainWnd:bLButtonUp )

		//-- Fecha o ambiente
		RpcClearEnv()
		
		Return
	EndIf

	//---------------------------------------------------------------------------------------------
	
	oMainWnd:cTitle(Left(oMainWnd:cTitle,IIF('['$oMainWnd:cTitle,At('[',oMainWnd:cTitle)-1,99))+'['+RetFileName(ProcSource())+'_v'+_cVersao+' | '+_cDtVersao+']')		//-- Mostra vers�o no t�tulo da janela

	//---------------------------------------------------------------------------------------------
	Private lExecuta	:= .T.

	If Type('cArqMnu') == 'U'
		Private cArqMnu	:= ''
	EndIf

	//---------------------------------------------------------------------------------------------

	If Type('cModulo') == 'C'
		cModAnt		:= cModulo
	Else
		cModAnt		:= 'CFG'
		cModulo		:= 'CFG'
	EndIf

	If Type('nModulo') == 'N'
		nModAnt		:= nModulo
	Else
		nModAnt		:= 99
		nModulo		:= 99
	EndIf

	Private cComando	:= ''
	Private cArgumentos	:= ''

//	aPerm			:= PswRet(3)

	//U_CXPergunta({{"Comando/Funcao:"	, "C", 90,  0}	,;
	//				{"Argumentos:"		, "C", 90,  0}	,;
	//				{"Modulo:"			, "N", 02,  0}	;
	//				},cPerg)

	bErroBak		:= ErrorBlock(bErroCst)
	cUsrRot			:= __cUserID		//Guardo o usuario por seguranca
	While lExecuta
		lExecutou	:= .F.

	//	If ! pergunte(cPerg,.T.)
	//		Return
	//	EndIf

		//Limpa as variaveis publicas
		MV_PAR01 := ''
		MV_PAR02 := ''
		MV_PAR03 := ''
		MV_PAR04 := ''
		MV_PAR05 := ''

		//Salva variaveis de ambiente
		cEmpBak		:= cEmpAnt	//Salvo para comparar depois
		cFilBak		:= cFilAnt	//Salvo para comparar depois
		nRecSM0		:= SM0->(Recno())	//Salvo para comparar depois
		nSvSx8Len 	:= GetSx8Len() //Salvo para comparar depois
		dDtBak		:= dDataBase
		
		oArea		:= tCtrlAlias():GetArea({'SM0','#PAR','#KEY','#PSW'})
		//aParam		:= U_CXGetParam(60) //Salva parametros
		SaveInter() //Salva Variaveis Publicas

		//Chama tela de pagametros
		If .Not. Parametros()
			//Restaura error block padrao
			ErrorBlock(bErroBak)

			//Nestes casos forca a finalizacao
			If 	lErroProc .Or. ;
				Type('_lRecursivo') == 'L'
				
				//Final()
				Break
			EndIf

			Return
		EndIf

		//Seta o modulo se informado
	//	If MV_PAR03 > 0
	//		nPosMod	:= Ascan(aModulos,{|x| x[1] == MV_PAR03 })
	//		If nPosMod > 0
	//			cModulo	:= Right(aModulos[nPosMod][2],3)
	//			nModulo	:= MV_PAR03
	//		EndIf
	//	EndIf

		//Tratamento para a variavel cArqMnu
	//	nPosMnu	:= Ascan(aPerm[1],{|x| Left(x,2) == StrZero(nModulo,2) })
	//	If nPosMnu > 0
	//		cArqMnu	:= AllTrim(Right(aPerm[1][nPosMnu],len(aPerm[1][nPosMnu])-3))
	//	EndIf

		//Limpa as variaveis publicas
		MV_PAR01 := ''
		MV_PAR02 := ''
		MV_PAR03 := ''
		MV_PAR04 := ''
		MV_PAR05 := ''

		__cInternet	:= NIL 
		VAR_IXB		:= NIL
		aPergunta	:= NIL //Variavel de perguntas

		//Tratamentos de erro de execucao
		Begin Sequence
			lExecutou	:= .T.
			uRet	 	:= &(cComando+'('+cArgumentos+')')
//			uRet	 	:= __ExecMacro(cComando+'('+cArgumentos+')')  //Deu problema no debug
//			uRet		:= __Execute('CFGA500()')
		End Sequence

		//U_CXRestParam(aParam) 	//Restaura parametros

		//Restaura variaveis padrao
		ErrorBlock(bErroCst)
		__ReadVar	:= ''
		INCLUI		:= NIL
		ALTERA		:= NIL
		VAR_IXB		:= NIL
		__cInternet	:= NIL
		aPergunta	:= NIL //Variavel de perguntas
		dDataBase	:= dDtBak
		RestInter() // Restauro variaveis publicas

		If inTransact() //Esta dentro de uma transacao
			DisarmTransaction()
			FwAlertError("A fun��o executada deixou a transa��o pendente."+CRLF+;
						"Um RollBack foi executado.",U_CXTxtMsg(,,.T.))
		EndIf
		//Libera transacoes e arquivo de impressao
		dbCommitAll()
		MS_FLUSH()

		If GetSx8Len() > nSvSx8Len
			FwAlertError("A fun��o executada deixou confirma��es de numera��o pendentes."+CRLF+;
						"Um RollBack das numera��es pendentes foi executado.",U_CXTxtMsg(,,.T.))
		EndIf

		If cEmpAnt <> cEmpBak
			FwAlertWarning(	"ATEN��O! A fun��o alterou a vari�vel de sistema cEmpAnt."+CRLF+;
						"ISSO PODE GERAR PROBLEMAS NAS ROTINAS.",U_CXTxtMsg(,,.T.))
		EndIf
		If cFilAnt <> cFilBak
			FwAlertWarning(	"ATEN��O! A fun��o alterou a vari�vel de sistema cFilAnt."+CRLF+;
						"ISSO PODE GERAR PROBLEMAS NAS ROTINAS.",U_CXTxtMsg(,,.T.))
		EndIf

		If Select('SM0') == 0
			cMsg	:= U_CXTxtMsg()+"ERRO: A ROTINA "+Upper(cComando)+" LIMPOU O AMBIENTE DE EXECU��O"
			U_CXConOut(ANSIToOEM(cMsg))
			FwAlertWarning(cMsg,U_CXTxtMsg(,,.T.))

			// N�o consome licensa de uso
			RPCSetType(3)

			// Abre ambiente de trabalho
			RPCSetEnv(	cEmpBak			,;	//01 Empresa
						cFilBak			,;	//02 Filial
						/*cEnvUser*/	,;	//03 Usuario
						/*cEnvPass*/	,;	//04 Senha de Usuario
						/*cMod*/		,;	//05 Modulo (3ch)
						'CXTestFunc'	,;	//06 Nome da Funcao
						/*aTables*/		,;	//07 Tabelas para abrir
						/*lShowFinal*/	,;	//08 Alimenta a variavel lMsFinalAuto
						.T.				,;	//09 Gera mensagem de erro ao ocorrer erro ao checar a licenca
						.T.				,;	//10 Pega a primeira filial do arquivo SM0 quando n�o passar a filial e realiza a abertura dos SXs
						.T.				) 	//11 faz a abertura da conexao com servidor do banco
		ElseIf nRecSM0 <> SM0->(Recno())
			FwAlertWarning(	"ATEN��O! A fun��o desposicionou o Sigamat."+CRLF+;
						"ISSO PODE GERAR PROBLEMAS NAS ROTINAS.",U_CXTxtMsg(,,.T.))
		EndIf

		oArea:RestArea()		//Restaura area
				
		//Exibe resultado da funcao
		If lExecutou
			MostraRet(uRet)
		EndIf

	EndDo

	//Restaura error block padrao
	ErrorBlock(bErroBak)

	//Restaura nome da funcao
	SetFunName('CXTestFunc')

	//Restaura as variaveis publicas
	cArqMnu		:= cMenuAnt
	cModulo		:= cModAnt
	nModulo		:= nModAnt

	If lCarrAmb
		//Fecha o ambiente
		RpcClearEnv()
	EndIf
	
	If 	Type('_lRecursivo') == 'L' .And. ;
		Type('oMainWnd') == 'O'

		oMainWnd:End()
	EndIf
	
Return

//-------------------------------------------------------------------------------------------------
// Monta tela para mostrar o retorno
//-------------------------------------------------------------------------------------------------
Static Function MostraRet(uRet)

	//Declaracao de variaveis----------------------------------------------------------------------
	Local oDlg			AS Object
	Local cGtTipo       AS Character
	Local oGtRet        AS Object
	Local cGtRet        AS Character

	//Posicionamento janela
	Local aTamJan		AS Array
	Local aCordW		AS Array

	Local nMrg			AS Numeric
	Local nLrg	        AS Numeric
	Local nAltBt		AS Numeric
	Local nLarBt		AS Numeric
	Local nClBt1	    AS Numeric
	Local nClBt2	    AS Numeric
	Local nClBt3	    AS Numeric
	Local nLnBt	        AS Numeric

	Local cTipo			AS Character
	Local oFonte		AS Object
	Local lMostraTp	    AS Logical
	Local cNomeVar	    AS Character

	//Inicializa Variaveis-------------------------------------------------------------------------

	//Posicionamento janela
	aTamJan	:= MsAdvSize() 		//tamanhos da janela
	//Problema ao obter os tamanhos
	If aTamJan[6] == 0
		aTamJan[6]	:= 600
	EndIf
	If aTamJan[5] == 0
		aTamJan[5]	:= 800
	EndIf
	aCordW	:= {000,000,aTamJan[6],aTamJan[5]}

	nMrg	:= 005
	nAltBt	:= 015
	nLarBt	:= 4*nAltBt

	cTipo	:= ValType(uRet)
	oFonte	:= tFont():New("Courier New",,14,,.T.,,,,.F.,.F.)

	//Calculos posicoes objetos
	nLrg	:= ((aCordW[4]-aCordW[2])/2)
	nLnBt	:= ((aCordW[3]-aCordW[1])/2)-nMrg-nAltBt
	nClBt1	:= nMrg
	nClBt2	:= (nLrg/2)-020		//Centro
	nClBt3	:= nLrg-nLarBt-nMrg	//Lado direito

	cGtTipo	:= U_CXDescTipo(cTipo,.T.)
	If cTipo $ 'C,A'
		cGtTipo	+= ' ('+LTrim(Str(len(uRet)))+')'
	EndIf

	lMostraTp	:= (cTipo $ 'A,O' )
	cNomeVar	:= ''
	If lMostraTp
		cNomeVar	:= 'uRet'
	EndIf

	//Preenche as informacoes do Ret
	cGtRet	:= U_CXMostraTipo(uRet,,,,,,,cNomeVar,lMostraTp)

	//Monta caixa de dialogo
	oDlg	:= MSDialog():New(	aCordW[1],aCordW[2],aCordW[3],aCordW[4],U_CXTxtMsg()+'Retorno da Fun��o',/*cPar6*/,/*nPar7*/,;
								/*lPar8*/,DS_MODALFRAME,/*anClrText*/,/*anClrBack*/,/*oPar12*/,/*oMainWnd*/,.T.)

		tSay():New(nMrg+4,nMrg	 ,{|| 'Tipo do Retorno:'},oDlg,,,,,,.T.,,,040,nAltBt)
		TGet():New(nMrg  ,nMrg+45,bSetGet(cGtTipo), oDlg, 130,nAltBt,'@',,,,,,,.T.,,,,,,,.T.,,,'cGtTipo')

	//	tSay():New(022,010,{|| 'Retorno:'},oDlg,,,,,,.T.,,,040,010)
		oGtRet	:=	tMultiget():New(nAltBt+nMrg*2,nMrg,bSetGet(cGtRet),;
									oDlg,nLrg-nMrg*2,nLnBt-nMrg*2,oFonte,,,,,.T.,,,,,,.T.)
		oGtRet:EnableVScroll( .T. )
		oGtRet:EnableHScroll( .T. )
		oGtRet:lWordWrap := .F.

		// Bot�o para fechar a janela
		tButton():New(nMrg,nClBt3,'Fechar',oDlg,{|| oDlg:End()},nLarBt,nAltBt,,,,.T.)

		oGtRet:SetFocus() //Preciso setar o foco nesse componente para que o sistema aceite fechar pela tecla ESC
	
		oDlg:lEscClose	:= .T.	//Precisa estar aqui!
	
	// ativa di�logo centralizado
	oDlg:Activate(/*uPar1*/,/*uPar2*/,/*uPar3*/,.T./*lCenter*/,/*{|Self| Valid }*/,/*uPar6*/,/*{|Self| Init }*/ )

Return

//-------------------------------------------------------------------------------------------------
// Tela para selecao de empresa e filial
//-------------------------------------------------------------------------------------------------
Static Function SelEmpFil();
						AS Logical

	//-- Declara��o de Vari�veis ----------------------------------------------
	Local aSM0									AS Array
	Local aEmp		:= {}   					AS Array
	Local aFil		:= {}   					AS Array
	Local nEmpTst 	:= 1						AS Numeric
	Local nPosEmp								AS Numeric
	Local nPosFil								AS Numeric
	Local oDlg, oPnl							AS Object
	Local oFont									AS Object

	Local nX            						AS Numeric
	Local lRet		:= .F.    					AS Logical

	Private oEmp        						AS Object
	Private oFil								AS Object
	Private aSM0EmpFil	:= {}					AS Array

	//-------------------------------------------------------------------------
	OpenSm0()	//Abre o sigamat
	aSM0	:= FWLoadSM0()
	For nX := 1 to len(aSM0)
		nPosEmp	:= aScan(aSM0EmpFil,{|x| x[1] == RTrim(aSM0[nX][SM0_GRPEMP]) })
		If 	nPosEmp == 0
			aAdd(aSM0EmpFil,{RTrim(aSM0[nX][SM0_GRPEMP]),{},{}})
			nPosEmp	:= len(aSM0EmpFil)
			aAdd(aEmp,RTrim(aSM0[nX][SM0_GRPEMP])+'-'+RTrim(IIF(Empty(aSM0[nX][SM0_NOMECOM]),aSM0[nX][SM0_NOME],aSM0[nX][SM0_NOMECOM])))
			If aSM0[nX][SM0_GRPEMP] == '99'	//-- Guardo a empresa teste se existir
				nEmpTst	:= nPosEmp
			EndIF
		EndIf
		
		aAdd(aSM0EmpFil[nPosEmp][2],RTrim(aSM0[nX][SM0_CODFIL])+'-'+Rtrim(aSM0[nX][SM0_NOMRED]))
		aAdd(aSM0EmpFil[nPosEmp][3],RTrim(aSM0[nX][SM0_CODFIL]))	//C�digos de filial
	Next

	//Carrega parametros
	aParam	:= GetParam('CXTestFuncE.par')
	If Len(aParam) <> 3
		aParam		:= Array(3)
		aParam[1]	:= aSM0EmpFil[nEmpTst][1]
		aParam[2]	:= '@#@#@'	//-- Para pegar a primeira empresa
		aParam[3]	:= 'Faturamento'
	EndIf
	nPosEmp		:= aScan(aSM0EmpFil,{|x| x[1] == AllTrim(aParam[1]) })
	If nPosEmp > 0
		nPosFil	:= aScan(aSM0EmpFil[nPosEmp][3],{|x| x == AllTrim(aParam[2]) })
		If nPosFil <= 0
			nPosFil	:= 1
		EndIf
	EndIf
	cMod_	:= aParam[3]
	cEmp_ 	:= aEmp[nPosEmp]
	cFil_	:= aSM0EmpFil[nPosEmp][2][nPosFil]

	//Preenche array de filiais
	aFil	:= aSM0EmpFil[nPosEmp][2]
	oFont	:= TFont():New('Arial',, -11, .T., .T.)
	//-------------------------------------------------------------------------
	oDlg := FWDialogModal():New()
		oDlg:SetEscClose(.T.)
		oDlg:setTitle(_MsgLinha_+' - Selecione a empresa e filial')
		oDlg:setSize(145,180)
		oDlg:createDialog()

		oPnl := oDlg:getPanelMain()

		TSay():New( 005, 005,{|| "Selecione a Empresa:" },oPnl,,oFont,.F.,.F.,.F.,.T.,,,,,.F.,.F.,.F.,.F.,.F.,.F. )
		oEmp	:= tComboBox():New(013,05,bSetGet(cEmp_),aEmp,165,20,oPnl,,,;
										{|| VldEmp(oEmp:nAt)},,,.T.,,,,,,,,,'cEmp_')
		oEmp:Select(nPosEmp)

		TSay():New( 030, 005,{|| "Selecione a Filial:" },oPnl,,oFont,.F.,.F.,.F.,.T.,,,,,.F.,.F.,.F.,.F.,.F.,.F. )
		oFil	:= tComboBox():New(038,05,bSetGet(cFil_),aFil,165,20,oPnl,,,,,,.T.,,,,,,,,,'cFil_')
		oFil:Select(nPosFil)

		TSay():New( 055, 005,{|| "Selecione o M�dulo (licen�a):" },oPnl,,oFont,.F.,.F.,.F.,.T.,,,,,.F.,.F.,.F.,.F.,.F.,.F. )
		tComboBox():New(063,005,bSetGet(cMod_),aCbMod,165,20,oPnl,,,,,,.T.,,,,,,,,,'cMod_')

		TSay():New( 080, 110,{||  "Vers�o: "+_cVersao+' | '+_cDtVersao},oPnl,,,.F.,.F.,.F.,.T.,,,,,.F.,.F.,.F.,.F.,.F.,.F. )

		oDlg:addCloseButton({|| lRet := .F. , oDlg:DeActivate() }, "Cancelar")
		oDlg:addOkButton({|| IIf((lRet := sfVldEmpFil()),oDlg:DeActivate(),) }, "OK")

	//-- ativa di�logo centralizado
	oDlg:Activate()

	If lRet
		SlvParam({cEmp_,cFil_,cMod_},'CXTestFuncE.par')
	EndIf

Return lRet

/*=================================================================================================
Autor      : Cirilo Rocha
Data       : 02/11/2023 
Info       : Valida��o do OK da tela de sele��o de empresa e filial, usado para setar as vari�veis
=================================================================================================*/
Static Function sfVldEmpFil();
					AS Logical

	//Declaracao de variaveis----------------------------------------------------------------------
	Local lRet	:= .T.				AS Logical

	//Seta a empresa e filial selecionados
	cEmp_:= aSM0EmpFil[oEmp:nAt][1]	
	cFil_:= aSM0EmpFil[oEmp:nAt][3][oFil:nAt]

Return lRet

//-------------------------------------------------------------------------------------------------
//Funcao para validar a combo da empresa e preencher o combo a filiais
//-------------------------------------------------------------------------------------------------
Static Function VldEmp(nPosEmp	AS Numeric) AS Logical

	//Parametros da rotina-------------------------------------------------------------------------
	ParamType 0		VAR nPosEmp		AS Numeric
//	ParamObg 0		VAR nPosEmp

	oFil:aItems := aSM0EmpFil[nPosEmp][2]
	oFil:Select(1)	//Seleciona a primeira filial da lista

Return .T.

//-------------------------------------------------------------------------------------------------
// Tela para selecao dos parametros
//-------------------------------------------------------------------------------------------------
Static Function Parametros() AS Logical

	//-- Declara��o de Vari�veis ----------------------------------------------
	Local oDlg, oPnl								AS Object
	Local oGtUsr									AS Object
	Local nX										AS Numeric
//	Local cCbMod									AS Object

	Local lRet			:= .F.						AS Logical
	Local nPos										AS Numeric
	Local bSavKeyF4									AS CodeBlock

	Private aParam									AS Array

	Private cFunType	:= ''						AS Character
	Private cTxtLin1	:= ''						AS Character
	Private cTxtLin2	:= ''						AS Character

	//Seta tecla de atalho
	bSavKeyF4 	:= SetKey( VK_F4 , { || ConsFonte(MV_PAR01) } )  //Consulta programa fonte

	aParam	:= GetParam('CXTestFuncP.par')
	For nX := 1 to len(aParam)
		&("MV_PAR"+StrZero(nX,2)+" := aParam["+StrZero(nX,2)+"] ")
	Next
	
	//-- Ajusta tamanho dos campos
	MV_PAR01	:= PadR(MV_PAR01,120)
	MV_PAR02	:= PadR(MV_PAR02,120)
	MV_PAR03	:= MV_PAR03
	MV_PAR04	:= PadR(MV_PAR04,Len(__cUserID))
	MV_PAR05	:= StoD(MV_PAR05)

	//---------------------------------------------------------------------------------------------
	oDlg := FWDialogModal():New()
		oDlg:SetEscClose(.T.)
		oDlg:setTitle(_MsgLinha_+' - Executar Fun��o')
		oDlg:setSize(160,320)
		oDlg:createDialog()

		oPnl := oDlg:getPanelMain()

		tSay():New(012,010,{|| 'Fun��o:'	},oPnl,,/*oFont*/,,,,.T.,,,050,010)
		tGet():New(010,045,bSetGet(MV_PAR01), oPnl, 265,010,,;
					{|| VldFunc() },,,,,,.T.,,,,,,,,,,'MV_PAR01')

		tSay():New(032,010,{|| 'Par�metros:'	},oPnl,,/*oFont*/,,,,.T.,,,050,010)
		tGet():New(030,045,bSetGet(MV_PAR02), oPnl, 265,010,,;
					,,,,,,.T.,,,,,,,,,,'MV_PAR02')

		tSay():New(052,010,{|| 'Usu�rio:'	},oPnl,,/*oFont*/,,,,.T.,,,050,010)
		oGtUsr	:= tGet():New(050,045,bSetGet(MV_PAR04), oPnl, 050,010,,;
								{|| Vazio() .Or. UsrExist(MV_PAR04) },,,,,,.T.,,,,,,,,,,'MV_PAR04')
		oGtUsr:cF3	:= 'USR'

		tSay():New(052,100,{|| 'DataBase:'	},oPnl,,/*oFont*/,,,,.T.,,,050,010)
		tGet():New(050,130,{|u| If( PCount() == 0 .Or. ValType(u) <> 'D' , MV_PAR05, MV_PAR05 := u ) }, oPnl, 060,010,,;		//-- FEITA PROTE��O DA VARI�VEL POR CAUSA DA CONSULTA DO CAMPO ANTERIOR!
					,,,,,,.T.,,,,,,,,,,'MV_PAR05')

		tComboBox():New(050,200,bSetGet(MV_PAR03),aCbMod,110,013,oPnl,,;
						,,,,.T.,,,,,,,,,'MV_PAR03')

		tSay():New(070,010,{|| cFunType	},oPnl,,/*oFont*/,,,,.T.,,,265,10)
		tSay():New(080,010,{|| cTxtLin1	},oPnl,,/*oFont*/,,,,.T.,,,265,37)
		tSay():New(090,010,{|| cTxtLin2	},oPnl,,/*oFont*/,,,,.T.,,,265,35)

		//-----------------------------------------------------------------------------------------
		oDlg:addCloseButton({|| lRet := .F. , oDlg:DeActivate() }, "Cancelar")
		oDlg:addOkButton({|| lRet := .T. , oDlg:DeActivate() }, "OK")

	//-- Ativa di�logo centralizado
	oDlg:Activate()

	If lRet
		nPos		:= aScan(aCbMod,{|x| AllTrim(x) == AllTrim(MV_PAR03) })
//		nModulo		:= aModulos[nPos][1]
//		cModulo		:= Right(aModulos[nPos][2],3)
		U_CXSetMod(aModulos[nPos][1])
		
		cComando 	:= Alltrim(MV_PAR01)
		cArgumentos	:= Alltrim(MV_PAR02)
		
		If .Not. Empty(MV_PAR04)
			U_CXSetUsr(MV_PAR04)
		Else
			U_CXSetUsr(cUsrRot)
		EndIf
		If .Not. Empty(MV_PAR05)
			dDataBase	:= MV_PAR05
		EndIf

		SlvParam({MV_PAR01,MV_PAR02,MV_PAR03,MV_PAR04,DToS(MV_PAR05)},'CXTestFuncP.par')
	EndIf

	//Restaura tecla de atalho
	SetKey(VK_F4 , bSavKeyF4)

Return lRet

//-------------------------------------------------------------------------------------------------
Static Function VldFunc();
					AS Logical

	//Declaracao de variaveis----------------------------------------------------------------------
	Local lOK			AS Logical
	Local nX            AS Numeric
	Local lBuscaRPO		AS Logical
	Local aParam        AS Array
	Local cParam        AS Character
	Local cVar			AS Character
	Local cComando		AS Character
	Local cCmdUsr		AS Character

	//Inicializa Variaveis-------------------------------------------------------------------------
	lOK			:= .T.
	lBuscaRPO	:= .F.
	cVar		:= ReadVar()
	cComando	:= AllTrim(&(cVar))
	cCmdUsr		:= ''

	//Variaveis compartilhadas de mensagens de erro
	cMsgErr		:= IIf(Type('cMsgErr')<>'C','',cMsgErr)
	cCodErr		:= IIf(Type('cCodErr')<>'C','',cCodErr)
	cSoluc		:= IIf(Type('cSoluc')<>'C','',cSoluc)
	cMsg		:= IIf(Type('cMsg')<>'C','',cMsg)

	//---------------------------------------------------------------------------------------------
	//Otimizacao
	If ValType(aFuncArray) <> 'A'
		//Recupera array com as funcoes internas (em C/C++)
		aFuncArray	:= U_CXRotInt()
	EndIf

	If .Not. U_CXSchVlRot(cComando,.F.,.T.)
		
		If .Not. ConsFonte(cComando)
			U_CXHelp(cCodErr,,cMsgErr,,cSoluc)
		EndIf
		
		lOK	:= .F.
	EndIf

	If lOK
		If Upper(Left(cComando,2)) == 'U_' 	//Funcao de usuario?
			cCmdUsr	:= SubStr(cComando,3) 	//Remove o U_
		ElseIf !FindFunction(cComando) 		//Se nao existe como funcao padrao, busca como funcao de usaurio
			cCmdUsr	:= cComando
		EndIf

		If !Empty(cCmdUsr) .And. ;
			ExistBlock(cCmdUsr)
			cFunType	:= 'Fun��o de Usu�rio'
			SetFunName(cCmdUsr) //Seta funcao de execucao
			cComando	:= 'U_'+cCmdUsr
			&(cVar)		:= PadR(cComando,120)
			lOK			:= .T.
			lBuscaRPO	:= .T.
		//Localiza funcao no array de funcoes de baixo nivel (C/C++)
		ElseIf ( nPos := aScan(aFuncArray,{|x| AllTrim(Upper(x[1])) == Upper(cComando) }) ) > 0
			cFunType	:= 'Fun��o Interna'
			SetFunName(cComando) //Seta funcao de execucao
			lOK			:= .T.
			lBuscaRPO	:= .F.
		ElseIf FindFunction(cComando)
			cFunType	:= 'Fun��o RPO'
			SetFunName(cComando) //Seta funcao de execucao
			lOK			:= .T.
			lBuscaRPO	:= .T.
		Else
			FwAlertWarning("Fun��o n�o compilada, digite uma fun��o v�lida.",U_CXTxtMsg(,,.T.))
			lOK := .F.
		EndIf
	EndIf

	If lOK
		If lBuscaRPO
			GetFuncArray( cComando, @aType, @aFile, @aLine, @aDate, @aTime ) //Busca dados da funcao no RPO
			If Len(aFile) > 0
				cTxtLin1	:= aFile[1]+' - '+DtoC(aDate[1])+' '+aTime[1]
			Else
				FwAlertWarning(	"Erro ao localizar informa��es da fun��o "+cComando,U_CXTxtMsg(,,.T.))
				cTxtLin1	:= 'ERRO AO LOCALIZAR INFORMA��ES'
			EndIf

			aParam	:= GetFuncPrm( cComando ) //Parametros da funcao

			cTxtLin2	:= ''
			If len(aParam) > 0
				For nX := 1 to len(aParam)
					cParam		:= Lower(Left(aParam[nX],1))+SubStr(aParam[nX],2)+'['+StrZero(nX,2)+']'
					cTxtLin2	:= U_CXConcTxt(cTxtLin2,cParam,', ')
				Next
			Else
				cTxtLin2	:= 'Nenhum'
			EndIf
			cTxtLin2	:= 'Par�metros: '+cTxtLin2
		Else
			cTxtLin1	:= ''
			cTxtLin2	:= ''
			cParam		:= aFuncArray[nPos][2]
			If len(cParam) > 0
				cTxtLin1	:= U_CXParForm(cParam)
			Else
				cTxtLin1	:= 'Nenhum'
			EndIf
			cTxtLin1	:= 'Par�metros: '+cTxtLin1
		EndIf
	EndIf

Return lOK

//-------------------------------------------------------------------------------------------------
//Grava os parametros em um arquivo
//-------------------------------------------------------------------------------------------------
Static Function SlvParam(	aParametros	AS Array	,;
							cArquivo	AS Character)

	//Declaracao de variaveis----------------------------------------------------------------------
	Local cSlvArq		AS Character
	Local nX			AS Numeric
	Local cUser			AS Character

	//Parametros da rotina-------------------------------------------------------------------------
	ParamObg 0		VAR aParametros
	ParamObg 1		VAR cArquivo
	
	//---------------------------------------------------------------------------------------------
	If Type('cUsrRot') <> 'C'
		cUser	:= '000000'
	Else
		cUser	:= cUsrRot
	EndIf

	cSlvArq	:= ''
	For nX := 1 to len(aParametros)
		cSlvArq		+= aParametros[nX] + CRLF
	Next

	U_CXWriteFile('\system\'+cUser+cArquivo,cSlvArq)

Return

//-------------------------------------------------------------------------------------------------
// Recupera os parametros salvos
//-------------------------------------------------------------------------------------------------
Static Function GetParam(cArquivo AS Character) AS Array

	//Declaracao de variaveis----------------------------------------------------------------------
	Local aRet	:= {}	AS Array
	Local cUser			AS Character
	Local oFile			AS Object

	//Parametros da rotina-------------------------------------------------------------------------
	ParamObg 0		VAR cArquivo
	
	//Inicializa Variaveis-------------------------------------------------------------------------
	If Type('cUsrRot') <> 'C'
		cUser	:= '000000'
	Else
		cUser	:= cUsrRot
	EndIf
	
	//---------------------------------------------------------------------------------------------
	If U_CXFile('\system\'+cUser+cArquivo,,.T.)
		oFile := FWFileReader():New('\system\'+cUser+cArquivo)
		If oFile:Open()
			aRet	:= oFile:getAllLines()
			oFile:Close()
		EndIf
		FreeObj(oFile)
	EndIf

Return aRet

//#############################################################################
//##+==========+=============+=======+=================+======+=============+##
//##|Programa  | ConsFonte   | Autor | Cirilo Rocha    | Data | 08/05/2017  |##
//##+==========+=============+=======+=================+======+=============+##
//##|Descricao | Funcao para consultar um fonte no RPO e retornar as funcoes|##
//##|          | que a mesma contem                                         |##
//##+==========+===============+============================================+##
//##|   DATA   | Programador   | Manutencao efetuada                        |##
//##+==========+===============+============================================+##
//##|          |               |                                            |##
//##|          |               |                                            |##
//##|          |               |                                            |##
//##+==========+===============+============================================+##
//#############################################################################
Static Function ConsFonte(cFonte	AS Character);	//01
							AS Logical

	//Declaracao de variaveis----------------------------------------------------------------------
	Local aParam		AS Array
	Local aMethods		AS Array
	Local aAtribut		AS Array
	Local cTexto		AS Character
	Local cNomFun		AS Character
	Local cParam		AS Character
	Local lAchou		AS Logical
	Local lClasse		AS Logical
	Local nX,nY			AS Numeric
	Local nPosExt		AS Numeric

	//Parametros da rotina-------------------------------------------------------------------------
	ParamObg 0		VAR cFonte

	//Inicializa Variaveis-------------------------------------------------------------------------
	lAchou	:= .F.
	cFonte	:= AllTrim(cFonte)

	//Otimizacao
	If ValType(aFuncRPO) <> 'A'
		//Carrega informacoes das funcoes do RPO
		aFuncRPO	:= GetFuncArray( '*', @aType, @aFile, @aLine, @aDate, @aTime ) //Busca dados da funcao no RPO
	EndIf

	If ValType(aClsArr) <> 'A'
		aClsArr		:= __clsArr()	//Lista de classes de baixo n�vel
	EndIf

	//Monta lista de funcoes do fonte
	For nX := 1 to len(aFile)
		If RetFileName(Upper(aFile[nX])) == Upper(cFonte)
			cNomFun		:= aFuncRPO[nX]
			lClasse		:= ( '#NONE#' $ cNomFun ) //Classes
			cNomFun		:= StrTran(cNomFun,'#NONE#')
			nPosExt		:= Rat('.',cNomFun)
			If nPosExt > 0 //Remove exten��o do nome do arquivo
				cNomFun	:= Left(cNomFun,nPosExt-1)
			EndIf
			If At('-',cNomFun) > 0	//Tratamento de erros
				Loop
			EndIf

			nPosCls		:= aScan(aClsArr,{|x| Upper(x[nCL_NOME]) == Upper(cNomFun) })
			lClasse		:= 	lClasse .Or. ;	//Classes
							nPosCls > 0

			If !lAchou //Primeira localizacao
				cTexto	:= aFile[nX]+' - '+DtoC(aDate[nX])+' '+aTime[nX] +CRLF
				If .Not. lClasse
					cTexto	+= 'FUN��ES: '
				EndIf
			EndIf

			If 	lClasse
				cTexto	+= Chr(9)+cNomFun+'()'+CRLF	//Nome da Classe?
				If nPosCls > 0
					cTexto	+= TxtClasse(aClsArr[nPosCls])
				Else
					aMethods	:= &(cNomFun+'():TGetMethods()')
					aAtribut	:= &(cNomFun+'():TGetData()')
					If ValType(aMethods) == 'A'
						cTexto	+= Chr(9)+Chr(9)+'M�TODOS:'+CRLF	//M�TODOS
						For nY := 1 to len(aMethods)
							cTexto	+= Chr(9)+Chr(9)+Chr(9)+aMethods[nY]+'()'+CRLF
						Next
					EndIf
					If ValType(aAtribut) == 'A'
						cTexto	+= Chr(9)+Chr(9)+'ATRIBUTOS:'+CRLF	//M�TODOS
						For nY := 1 to len(aAtribut)
							cTexto	+= Chr(9)+Chr(9)+Chr(9)+aAtribut[nY]+CRLF
						Next
					EndIf

					FwFreeArray(aAtribut)
					aAtribut	:= NIL

					FwFreeArray(aAtribut)
					aAtribut	:= NIL
				EndIf
			Else
				aParam	:= GetFuncPrm( aFuncRPO[nX] ) //Parametros da funcao

				cParam	:= ''
				For nY := 1 to len(aParam)
					cParam	:= U_CXConcTxt(cParam,aParam[nY],', ')
				Next

				cTexto	:= U_CXConcTxt(cTexto,aFuncRPO[nX]+'('+cParam+')',CRLF)
			EndIf
			lAchou	:= .T.
		EndIf
	Next

	//Busca nas classes de baixo n�vel-------------------------------------------------------------
	If .Not. lAchou
		nPosCls		:= aScan(aClsArr,{|x| Upper(x[nCL_NOME]) == Upper(cFonte) })
		If nPosCls > 0
			cTexto	:= cFonte+'()'+CRLF	//Nome da Classe?
			cTexto	+= TxtClasse(aClsArr[nPosCls])
			lAchou	:= .T.
		EndIf
	EndIf

	If lAchou
		U_CXApMsgMemo(cTexto,U_CXTxtMsg()+'Dados do fonte',.T.,.F.,.T.,.F.)
	EndIf

Return lAchou

//-------------------------------------------------------------------------------------------------
Static Function TxtClasse(aClasse	AS Array);	//01 aClasse
										AS Character
	//Declaracao de variaveis----------------------------------------------------------------------
	Local cTexto		AS Character
	Local nX			AS Numeric

	//---------------------------------------------------------------------------------------------
	cTexto	:= Chr(9)+Chr(9)+'CLASSE PAI: '+aClasse[nCL_PARENT]+CRLF	//Classe Pai
	If Len(aClasse[nCL_METHOD]) > 0
		cTexto	+= Chr(9)+Chr(9)+'M�TODOS:'+CRLF	//M�TODOS
		For nX := 1 to Len(aClasse[nCL_METHOD])
			cParam	:= U_CXParForm(aClasse[nCL_METHOD][nX][2])
			cTexto	+= Chr(9)+Chr(9)+Chr(9)+aClasse[nCL_METHOD][nX][1]+'('+cParam+')'+CRLF
		Next
	EndIf
	If Len(aClasse[nCL_ATRIB]) > 0
		cTexto	+= Chr(9)+Chr(9)+'ATRIBUTOS:'+CRLF	//ATRIBUTOS
		For nX := 1 to Len(aClasse[nCL_ATRIB])
			cTexto	+= Chr(9)+Chr(9)+Chr(9)+aClasse[nCL_ATRIB][nX][1]+CRLF
		Next
	EndIf

Return cTexto

//#############################################################################
//##+==========+=============+=======+=================+======+=============+##
//##|Programa  | MsgErroCst  | Autor | Cirilo Rocha    | Data | 19/01/2017  |##
//##+==========+=============+=======+=================+======+=============+##
//##|Descricao | Funcao responsavel por mostrar as mensagens de erro em tem-|##
//##|          | po de execucao                                             |##
//##+==========+===============+============================================+##
//##|   DATA   | Programador   | Manutencao efetuada                        |##
//##+==========+===============+============================================+##
//##|          |               |                                            |##
//##|          |               |                                            |##
//##|          |               |                                            |##
//##+==========+===============+============================================+##
//#############################################################################
Static Function MsgErroCst(oErr);
							AS Logical

	//Declaracao de variaveis----------------------------------------------------------------------
	Local cLogErro		AS Character
	Local oModel		AS Object

	//Parametros da rotina-------------------------------------------------------------------------
	ParamType 0		VAR oErr  	  		AS Object

	//Inicializa Variaveis-------------------------------------------------------------------------
	cLogErro	:= 	oErr:ErrorStack+CRLF+;
					Replicate('#',60)+CRLF+CRLF+;
					oErr:ErrorEnv
	cLogErro	:= 	U_CXLimpaLog(cLogErro)

	lExecutou	:= .F.

	//Se passou por essas rotinas e deu erro precisa forcar o fechamento ao final do processo
	If ( FWIsInCallStack('PROCESSA') .Or. FWIsInCallStack('RPTSTATUS') ) .And. ;
		.Not. FWIsInCallStack('MDIEXECUTE')

		lErroProc	:= .T.
	EndIf
	
	If inTransact()
		DisarmTransaction()
	EndIf

	//+-------------------------------------------------+
	//| AINDA TEM UM ERRO USANDO ADV E OBJETOS, SE O    |
	//| OBJETO NAO TIVER SIDO APAGADO DA MEMORIA, O     |
	//| SISTEMA NAO DEIXA FEIXAR O SISTEMA, FICA PRESO. |
	//+-------------------------------------------------+
	
	//O MVC fica travado
	oModel	:= FWModelActive()
	If ValType(oModel) == 'O'
		//Final()
		oModel:DeActivate()
		oModel:Destroy()
		FreeObj(oModel)
		oModel := Nil
	EndIf

	U_CXWriteFile('C:\Protheus\erro.log',cLogErro)

	U_CXApMsgMemo(cLogErro,'CXTestFunc-ERRO',.T.,.F.,.T.,.F.)

	Break

Return .F.

/*=================================================================================================
Autor      : Cirilo Rocha
Data       : 05/05/2024
Info       : Fun��o para salvar o login do usu�rio baseado nas credenciais do windows cliente
=================================================================================================*/
Static Function sfSingleSignOn(cUser)	/*@cUser*/		AS Logical

	//-- Declaracao de variaveis ----------------------------------------------
	Local aConInfo	:= FWGetTopInfo()				AS Array		//-- Retorna informa��es da conex�o
	Local aUserInfo									AS Array
	Local cArqCred									AS Character
	Local cJson										AS Character
	Local cHashAtual								AS Character
	Local jCredUsr	:= JsonObject():New()			AS Json
	Local lOK		:= .F.							AS Logical
	Local ucMsgErr									AS Variant

	//-- Posi��es da do retorno da fun��o FWGetTopInfo()
	Local nIP		:= 01							AS Numeric
	Local nNmBco	:= 05							AS Numeric

	//-------------------------------------------------------------------------
	cArqCred	:= GetTempPath()+SHA1(aConInfo[nIP]+'|'+aConInfo[nNmBco])+'.dat'
	If File(cArqCred)
		cJson	:= MemoRead(cArqCred)
		ucMsgErr:= jCredUsr:FromJson(cJson) //-- Converte texto Json em Objeto, se erro retorna uErro a mensagem
		If ValType(ucMsgErr) == 'C'
			FwAlertError(	'Erro na leitura do arquivo de credenciais.'+CRLF+;
							'Ser� recriado.'+CRLF+;
							ucMsgErr,_MsgLinha_)
		EndIf
	EndIf

	//-------------------------------------------------------------------------
	//-- Chave = Data Atual + Credencial do Windows Cliente + Usu�rio Windows -- Validade s� de 1 dia por isso a data atual
	cHashAtual	:= Sha1(Dtos(Date())+'|'+GetCredential()+'|'+LogUserName(),2)
	If 	jCredUsr:hasProperty('hash') .And. ;
		jCredUsr:hasProperty('user')
		If cHashAtual == jCredUsr['hash']
			cUser	:= Decode64(jCredUsr['user'])	//-- Decodifica o c�digo de usu�rio!

			PswOrder(1)	//-- Ordem por codigo
			If PswSeek(cUser)
				aUserInfo	:= FWSFAllUsers({cUser},{'USR_MSBLQL'})
				If aUserInfo[1][3] <> '1'	//-- Usu�rio N�O bloqueado!
					lOK			:= .T.
				EndIf
			EndIf
		EndIf
	EndIf

	//-- N�o bateu a credencial salva, solicita uma nova ----------------------
	If .Not. lOK
		If FWAuthUser(@cUser) 	//-- Solicita a senha do usu�rio
			If FWIsAdmin(cUser) //-- Usu�rio � administrador
				lOK	:= .T.
				jCredUsr['hash']	:= cHashAtual
				jCredUsr['user']	:= Encode64(cUser)
				cJson	:= jCredUsr:toJson()
				MemoWrite(cArqCred,cJson)
			Else
				FwAlertError(	'Usu�rio sem acesso a rotina. Apenas administradores podem '+;
								'utilizar a ferramenta.',_MsgLinha_)
			EndIf
		EndIf
	EndIf

Return lOK


