#INCLUDE "rwmake.ch"
#INCLUDE "SHELL.CH"
#INCLUDE "Protheus.ch"
#INCLUDE "TBICONN.CH"
#include 'FWCommand.CH'
#Include "ParmType.ch"
#Include "CXInclude.ch"

Static cVersao := "1.50"
Static cDtVersao := "05/05/2024"

// MANTER EM .PRW PARA PODER EXECUTAR STATICCALL
//#############################################################################
//##+==========+============+=======+===================+======+============+##
//##|Programa  | CXTestFunc | Autor | Cirilo Rocha      | Data | 28/05/2009 |##
//##+==========+============+=======+===================+======+============+##
//##|Descr.    | Função genérica para execução de fontes.                   |##
//##|          |                                                            |##
//##|          | Utilizada para testar funções customizadas sem ter que     |##
//##|          |  criar a rotina no menu                                    |##
//##|          |                                                            |##
//##|          | Ela chama uma pergunta onde pode ser digitada uma função   |##
//##|          |  customizada para o sistema executar                       |##
//##+==========+===========+================================================+##
//##|   DATA   |Programador| Manutenção efetuada                            |##
//##+==========+===========+================================================+##
//##| 11/05/10 | Cirilo R. | Acrescentada opção de informar os argumentos   |##
//##|          |           |  na função                                     |##
//##| 14/08/11 | Cirilo R. | Alterado o ValidPerg para CXPergunta()         |##
//##| 26/08/11 | Cirilo R. | Adicionada nova pergunta para setar o módulo   |##
//##|          |           |  para execução                                 |##
//##| 02/09/11 | Cirilo R. | Adicionada mensagem com o retorno da função    |##
//##|          |           |  executada.                                    |##
//##| 06/09/11 | Cirilo R. | Melhoria nos tratamentos das variáveis dos     |##
//##|          |           |  módulos.                                      |##
//##| 08/09/11 | Cirilo R. | Melhoria na tela que mostra o retorno das fun- |##
//##|          |           |  ções executadas                               |##
//##| 12/03/12 | Cirilo R. | Melhoria para permitir a execução desta função |##
//##|          |           |  para poder ser executada dentro do IDE        |##
//##| 29/03/12 | Cirilo R. | Pequeno ajuste na abertura do SM0              |##
//##| 05/04/12 | Cirilo R. | Melhoria para listar retornos tipo array       |##
//##| 17/07/12 | Cirilo R. | Feito tratamento para aceitar executar funções |##
//##|          |           |  de baixo nível escritas em C/C++ que estão    |##
//##|          |           |  compiladas diretamente nos binários           |##
//##| 21/11/16 | Cirilo R. | Pequena melhoria na execução da função         |##
//##| 23/01/17 | Cirilo R. | Feito tratamento de erro para não fechar a     |##
//##|          |           |  execução                                      |##
//##| 06/03/17 | Cirilo R. | Pequena revisão no fonte                       |##
//##| 07/05/17 | Cirilo R. | Adicionada pesquisa para as informações do fon-|##
//##|          |           |  te e da função                                |##
//##| 09/08/17 | Cirilo R. | Melhoria no controle de variáveis de ambiente, |##
//##|          |           |  transação e controle de numerações            |##
//##| 19/10/17 | Cirilo R. | Adicionadas funções para liberar transações e  |##
//##|          |           |  o arquivo do spool                            |##
//##| 29/04/18 | Cirilo R. | Controle de chamadas recursivas                |##
//##|          |           | Pequena revisão do fonte                       |##
//##|          |           | Melhoria na validação dos fontes               |##
//##| 19/05/18 | Cirilo R. | Colocada a tela de retorno em fullscreen       |##
//##| 12/10/21 | Cirilo R. | Pequena revisão (release 33)                   |##
//##| 16/12/21 | Cirilo R. | Mantido formato PRW para usar StaticCall       |##
//##| 05/04/22 | Cirilo R. | Adicionado parâmetro com o código de usuário   |##
//##|          |           |  para execução                                 |##
//##| 25/11/22 | Cirilo R. | Melhoria para buscar informações de classes    |##
//##| 19/04/23 | Cirilo R. | Melhoria para também informar a database       |##
//##| 02/11/23 | Cirilo R. | Correção na tela de seleção de filiais para    |##
//##|          |           |  gestão corporativa                            |##
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

	Local cModAnt		    AS Character
	Local nModAnt		    AS Numeric
	Local cMenuAnt		    AS Character

	Local nX                AS Numeric
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

	//Tive que fazer essa proteção porque o padrão está chamando esse fonte recursivamente por
	// conta da função EvalTrigger()->EvalGeneric() dentro do ExecAuto
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
	
	//---------------------------------------------------------------------------------------------
	//Se foi executado a partir do configurador
	If Type('cFilAnt') == 'U'
		Private aSM0EmpFil	:= {}

		Private cEmp_			:= ''
		Private cFil_			:= ''

		//Seleciona a empresa / filial
		If !SelEmpFil()
			Return
		EndIf

		// Não consome licensa de uso
		RPCSetType(3)
		// Abre ambiente de trabalho
		//MsgRun('Aguarde...',U_CXTxtMsg()+"Montando Ambiente. Empresa [" + cEmp_ + "] Filial [" + cFil_ +"].",;
		MsAguarde(;
		;//FWMsgRun(/*oSay*/,;
				{||	;
					lRet := RPCSetEnv(	cEmp_			,;	//01 Empresa
										cFil_			,;	//02 Filial
										'000000'		,;	//03 Usuario
										/*cEnvPass*/	,;	//04 Senha de Usuario
										'FAT'			,;	//05 Modulo (3ch)
										'CXTestFunc'	,;	//06 Nome da Funcao
										/*aTables*/		,;	//07 Tabelas para abrir
										/*lShowFinal*/	,;	//08 Alimenta a variavel lMsFinalAuto
										.F.				,;	//09 Gera mensagem de erro ao ocorrer erro ao checar a licenca
										.T.				,;	//10 Pega a primeira filial do arquivo SM0 quando não passar a filial e realiza a abertura dos SXs
										.T.				);	//11 Faz a abertura da conexao com servidor do banco
							},;
				U_CXTxtMsg()+" Montando Ambiente. Empresa [" + cEmp_ + "] Filial [" + cFil_ +"].",;
				"Aguarde...")
//		PREPARE ENVIRONMENT EMPRESA Left(cEmp_,2) FILIAL Left(cFil_,2)

        If .Not. lRet
			FwAlertWarning(	'Não foi possível montar o ambiente selecionado.',_MsgLinha_)
            Return
        EndIf

		//-- Single Sign-On
		If .Not. sfSingleSignOn(@__cUserID)
			//-- Fecha o ambiente
			RpcClearEnv()
			Return
		EndIf

		U_CXSetUsr(__cUserID)
		__cInternet	:= NIL			//-- Preciso colocar aqui para forçar mostrar mensagens
		lMsHelpAuto := .F.			//-- Preciso colocar aqui para forçar mostrar mensagens
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
		
		oMainWnd := TWindow():New( 0, 0, 1000, 1000, U_CXTxtMsg()+"CXTestFunc-oMainWnd",,,,,,,,,,,,.T.,.T.,.T.,.T.,.F.)
		oMainWnd:Activate( "MAXIMIZED", oMainWnd:bLClicked, oMainWnd:bRClicked, oMainWnd:bMoved,;
							oMainWnd:bResized, oMainWnd:bPainted, oMainWnd:bKeyDown, oMainWnd:bInit := { | Self | (U_CXTestFunc(),oMainWnd:End()) },;
							,,,,,,,,,, oMainWnd:bLButtonUp )

		//Fecha o ambiente
		RpcClearEnv()
		
		Return
	EndIf

	//---------------------------------------------------------------------------------------------
	
	oMainWnd:cTitle(Left(oMainWnd:cTitle,Rat(' [',oMainWnd:cTitle))+'['+FileNoExt(ProcSource())+'_v'+cVersao+' | '+cDtVersao+']')		//-- Mostra versão no título da janela

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

	Private aModulos	:= RetModName()

	Private aCbMod		:= {}

	//Acrescenta o modulo configurador pois este nao vem na funcao padrao
	aAdd(aModulos,{99,'SIGACFG','Configurador',.F.,'',99})

	//Ordena por nome do modulo
	ASort ( aModulos, , , { |x,y| x[3] < y[3] } )

	//Preenche combo
	For nX := 1 to len(aModulos)
		aAdd(aCbMod,aModulos[nX][3])
	Next

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
			ApMsgStop(	"A função executada deixou a transação pendente."+CRLF+;
						"Um RollBack foi executado.",U_CXTxtMsg(,,.T.))
		EndIf
		//Libera transacoes e arquivo de impressao
		dbCommitAll()
		MS_FLUSH()

		If GetSx8Len() > nSvSx8Len
			ApMsgStop(	"A função executada deixou confirmações de numeração pendentes."+CRLF+;
						"Um RollBack das numerações pendentes foi executado.",U_CXTxtMsg(,,.T.))
		EndIf

		If cEmpAnt <> cEmpBak
			ApMsgAlert(	"ATENÇÃO! A função alterou a variável de sistema cEmpAnt."+CRLF+;
						"ISSO PODE GERAR PROBLEMAS NAS ROTINAS.",U_CXTxtMsg(,,.T.))
		EndIf
		If cFilAnt <> cFilBak
			ApMsgAlert(	"ATENÇÃO! A função alterou a variável de sistema cFilAnt."+CRLF+;
						"ISSO PODE GERAR PROBLEMAS NAS ROTINAS.",U_CXTxtMsg(,,.T.))
		EndIf

		If Select('SM0') == 0
			cMsg	:= U_CXTxtMsg()+"ERRO: A ROTINA "+Upper(cComando)+" LIMPOU O AMBIENTE DE EXECUÇÃO"
			U_CXConOut(ANSIToOEM(cMsg))
			ApMsgAlert(cMsg,U_CXTxtMsg(,,.T.))

			// Não consome licensa de uso
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
						.T.				,;	//10 Pega a primeira filial do arquivo SM0 quando não passar a filial e realiza a abertura dos SXs
						.T.				) 	//11 faz a abertura da conexao com servidor do banco
		ElseIf nRecSM0 <> SM0->(Recno())
			ApMsgAlert(	"ATENÇÃO! A função desposicionou o Sigamat."+CRLF+;
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
	oDlg	:= MSDialog():New(	aCordW[1],aCordW[2],aCordW[3],aCordW[4],U_CXTxtMsg()+'Retorno da Função',/*cPar6*/,/*nPar7*/,;
								/*lPar8*/,DS_MODALFRAME,/*anClrText*/,/*anClrBack*/,/*oPar12*/,/*oMainWnd*/,.T.)

		tSay():New(nMrg+4,nMrg	 ,{|| 'Tipo do Retorno:'},oDlg,,,,,,.T.,,,040,nAltBt)
		TGet():New(nMrg  ,nMrg+45,bSetGet(cGtTipo), oDlg, 130,nAltBt,'@',,,,,,,.T.,,,,,,,.T.,,,'cGtTipo')

	//	tSay():New(022,010,{|| 'Retorno:'},oDlg,,,,,,.T.,,,040,010)
		oGtRet	:=	tMultiget():New(nAltBt+nMrg*2,nMrg,bSetGet(cGtRet),;
									oDlg,nLrg-nMrg*2,nLnBt-nMrg*2,oFonte,,,,,.T.,,,,,,.T.)
		oGtRet:EnableVScroll( .T. )
		oGtRet:EnableHScroll( .T. )
		oGtRet:lWordWrap := .F.

		// Botão para fechar a janela
		tButton():New(nMrg,nClBt3,'Fechar',oDlg,{|| oDlg:End()},nLarBt,nAltBt,,,,.T.)

		oGtRet:SetFocus() //Preciso setar o foco nesse componente para que o sistema aceite fechar pela tecla ESC
	
		oDlg:lEscClose	:= .T.	//Precisa estar aqui!
	
	// ativa diálogo centralizado
	oDlg:Activate(/*uPar1*/,/*uPar2*/,/*uPar3*/,.T./*lCenter*/,/*{|Self| Valid }*/,/*uPar6*/,/*{|Self| Init }*/ )

Return

//-------------------------------------------------------------------------------------------------
// Tela para selecao de empresa e filial
//-------------------------------------------------------------------------------------------------
Static Function SelEmpFil();
						AS Logical

	//Declaracao de variaveis----------------------------------------------------------------------
	Local aSM0			AS Array
	Local aEmp		    AS Array
	Local aFil		    AS Array
	Local nPosEmp		AS Numeric
	Local nPosFil		AS Numeric
	Local oDlg			AS Object
	Local oBOK			AS Object

	Local nX            AS Numeric
	Local lRet		    AS Logical

	Local nLarBt		AS Numeric
	Local nAltBt		AS Numeric
	Local aPosBt		AS Array

	Private oEmp        AS Object
	Private oFil		AS Object
	Private aSM0EmpFil	:= {}			AS Array

	//Inicializa Variaveis-------------------------------------------------------------------------
	aEmp		:= {}
	aFil		:= {}

	lRet		:= .F.

	nLarBt		:= 050
	nAltBt		:= 015

	OpenSm0()	//Abre o sigamat
	aSM0	:= FWLoadSM0()
	For nX := 1 to len(aSM0)
		nPosEmp	:= aScan(aSM0EmpFil,{|x| x[1] == RTrim(aSM0[nX][SM0_GRPEMP]) })
		If 	nPosEmp == 0
			aAdd(aSM0EmpFil,{RTrim(aSM0[nX][SM0_GRPEMP]),{},{}})
			nPosEmp	:= len(aSM0EmpFil)
			aAdd(aEmp,RTrim(aSM0[nX][SM0_GRPEMP])+'-'+RTrim(IIF(Empty(aSM0[nX][SM0_NOMECOM]),aSM0[nX][SM0_NOME],aSM0[nX][SM0_NOMECOM])))
		EndIf
		
		aAdd(aSM0EmpFil[nPosEmp][2],RTrim(aSM0[nX][SM0_CODFIL])+'-'+Rtrim(aSM0[nX][SM0_NOMRED]))
		aAdd(aSM0EmpFil[nPosEmp][3],RTrim(aSM0[nX][SM0_CODFIL]))	//Códigos de filial
	Next

	//Carrega parametros
	aParam	:= GetParam('CXTestFuncE.par')
	nPosEmp	:= 1	//Primeira empresa
	nPosFil	:= 1	//Primeira filial
	If len(aParam) == 2
		nPosEmp		:= aScan(aSM0EmpFil,{|x| x[1] == AllTrim(aParam[1]) })
		If nPosEmp > 0
			nPosFil	:= aScan(aSM0EmpFil[nPosEmp][3],{|x| x == AllTrim(aParam[2]) })
			If nPosFil <= 0
				nPosFil	:= 1
			EndIf
		Else
			nPosEmp	:= 1	//Primeira empresa
			nPosFil	:= 1	//Primeira filial
		EndIf
	EndIf
	cEmp_ 	:= aEmp[nPosEmp]
	cFil_	:= aSM0EmpFil[nPosEmp][2][nPosFil]

	//Preenche array de filiais
	aFil	:= aSM0EmpFil[nPosEmp][2]

	//---------------------------------------------------------------------------------------------
	oDlg	:= MSDialog():New(	000,000,160,350,U_CXTxtMsg()+'Selecione a empresa e filial',,,,DS_MODALFRAME,;
								/*CLR_BLACK*/,/*CLR_WHITE*/,,/*oWnd*/,.T.,,,,/*lTransparent*/)
		
		aPosBt	:= U_CXPosBtn(oDlg,nLarBt,nAltBt)
		
		oEmp	:= tComboBox():New(10,05,bSetGet(cEmp_),aEmp,165,20,oDlg,,,;
										{|| VldEmp(oEmp:nAt)},,,.T.,,,,,,,,,'cEmp_')
		oEmp:Select(nPosEmp)

		oFil	:= tComboBox():New(30,05,bSetGet(cFil_),aFil,165,20,oDlg,,,,,,.T.,,,,,,,,,'cFil_')
		oFil:Select(nPosFil)

		tButton():New(aPosBt[1],aPosBt[5][1],'Cancelar'		,oDlg,{|| lRet := .F. , oDlg:End() },nLarBt,nAltBt,,,,.T.)
		oBOK	:= tButton():New(aPosBt[1],aPosBt[5][5],'OK'			,oDlg,{|| lRet := sfVldEmpFil() , oDlg:End() },nLarBt,nAltBt,,,,.T.)
		oBOK:SetFocus()
		
	// ativa diálogo centralizado
	oDlg:Activate(,,,.T.,/*{|Self| Valid }*/,,/*{|Self| Init }*/ )

	If lRet
		SlvParam({cEmp_,cFil_},'CXTestFuncE.par')
	EndIf

Return lRet

/*=================================================================================================
Autor      : Cirilo Rocha
Data       : 02/11/2023 
Info       : Validação do OK da tela de seleção de empresa e filial, usado para setar as variáveis
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

	//Declaracao de variaveis----------------------------------------------------------------------
	Local oDlg			AS Object
	Local oGtUsr		AS Object
	Local nX			AS Numeric
//	Local cCbMod		AS Object

	Local lRet			AS Logical
	Local nPos			AS Numeric
	Local bSavKeyF4		AS CodeBlock

	Local nLarBt		AS Numeric
	Local nAltBt		AS Numeric
	Local aPosBt		AS Array

	Private aParam		AS Array

	Private cFunType	AS Character
	Private cTxtLin1	AS Character
	Private cTxtLin2	AS Character

	//Inicializa Variaveis-------------------------------------------------------------------------
	lRet		:= .F.
	cFunType	:= ''
	cTxtLin1	:= ''
	cTxtLin2	:= ''

	nLarBt		:= 050
	nAltBt		:= 015

	//Seta tecla de atalho
	bSavKeyF4 	:= SetKey( VK_F4 , { || ConsFonte(MV_PAR01) } )  //Consulta programa fonte

	aParam	:= GetParam('CXTestFuncP.par')
	For nX := 1 to len(aParam)
		&("MV_PAR"+StrZero(nX,2)+" := aParam["+StrZero(nX,2)+"] ")
	Next
	//Ajusta tamanho dos campos
	MV_PAR01	:= PadR(MV_PAR01,30)
	MV_PAR02	:= PadR(MV_PAR02,100)
	MV_PAR03	:= MV_PAR03
	MV_PAR04	:= PadR(MV_PAR04,Len(__cUserID))
	MV_PAR05	:= StoD(MV_PAR05)

	//---------------------------------------------------------------------------------------------
	oDlg	:= MSDialog():New(	000,000,270,410,U_CXTxtMsg()+'Executar Função',,,,DS_MODALFRAME,;
								/*CLR_BLACK*/,/*CLR_WHITE*/,,/*oWnd*/,.T.,,,,/*lTransparent*/)
		
		aPosBt	:= U_CXPosBtn(oDlg,nLarBt,nAltBt)
		
		tSay():New(012,010,{|| 'Função:'	},oDlg,,/*oFont*/,,,,.T.,,,050,010)
		tGet():New(010,050,bSetGet(MV_PAR01), oDlg, 055,010,,;
					{|| VldFunc() },,,,,,.T.,,,,,,,,,,'MV_PAR01')
		tComboBox():New(010,110,bSetGet(MV_PAR03),aCbMod,090,013,oDlg,,;
						,,,,.T.,,,,,,,,,'MV_PAR03')

		tSay():New(032,010,{|| 'Parâmetros:'	},oDlg,,/*oFont*/,,,,.T.,,,050,010)
		tGet():New(030,050,bSetGet(MV_PAR02), oDlg, 150,010,,;
					,,,,,,.T.,,,,,,,,,,'MV_PAR02')

		tSay():New(052,010,{|| 'Usuário:'	},oDlg,,/*oFont*/,,,,.T.,,,050,010)
		oGtUsr	:= tGet():New(050,050,bSetGet(MV_PAR04), oDlg, 050,010,,;
								{|| Vazio() .Or. UsrExist(MV_PAR04) },,,,,,.T.,,,,,,,,,,'MV_PAR04')
		oGtUsr:cF3	:= 'USR'
		tSay():New(052,110,{|| 'DataBase:'	},oDlg,,/*oFont*/,,,,.T.,,,050,010)
		tGet():New(050,140,bSetGet(MV_PAR05), oDlg, 060,010,,;
					,,,,,,.T.,,,,,,,,,,'MV_PAR05')

		tSay():New(070,010,{|| cFunType	},oDlg,,/*oFont*/,,,,.T.,,,190,10)
		tSay():New(080,010,{|| cTxtLin1	},oDlg,,/*oFont*/,,,,.T.,,,190,37)
		tSay():New(090,010,{|| cTxtLin2	},oDlg,,/*oFont*/,,,,.T.,,,190,23)

		//-----------------------------------------------------------------------------------------
		tButton():New(aPosBt[1],aPosBt[5][5],'OK'			,oDlg,{|| lRet := .T. , oDlg:End() },nLarBt,nAltBt,,,,.T.)
		tButton():New(aPosBt[1],aPosBt[5][1],'Cancelar'		,oDlg,{|| lRet := .F. , oDlg:End() },nLarBt,nAltBt,,,,.T.)

	// ativa diálogo centralizado
	oDlg:Activate(,,,.T.,/*{|Self| Valid }*/,,/*{|Self| Init }*/ )

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

		SlvParam({MV_PAR01,MV_PAR02,MV_PAR03,MV_PAR04,DtoS(MV_PAR05)},'CXTestFuncP.par')
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
			cFunType	:= 'Função de Usuário'
			SetFunName(cCmdUsr) //Seta funcao de execucao
			cComando	:= 'U_'+cCmdUsr
			&(cVar)		:= PadR(cComando,120)
			lOK			:= .T.
			lBuscaRPO	:= .T.
		//Localiza funcao no array de funcoes de baixo nivel (C/C++)
		ElseIf ( nPos := aScan(aFuncArray,{|x| AllTrim(Upper(x[1])) == Upper(cComando) }) ) > 0
			cFunType	:= 'Função Interna'
			SetFunName(cComando) //Seta funcao de execucao
			lOK			:= .T.
			lBuscaRPO	:= .F.
		ElseIf FindFunction(cComando)
			cFunType	:= 'Função RPO'
			SetFunName(cComando) //Seta funcao de execucao
			lOK			:= .T.
			lBuscaRPO	:= .T.
		Else
			ApMsgAlert("Função não compilada, digite uma função válida.",U_CXTxtMsg(,,.T.))
			lOK := .F.
		EndIf
	EndIf

	If lOK
		If lBuscaRPO
			GetFuncArray( cComando, @aType, @aFile, @aLine, @aDate, @aTime ) //Busca dados da funcao no RPO
			If Len(aFile) > 0
				cTxtLin1	:= aFile[1]+' - '+DtoC(aDate[1])+' '+aTime[1]
			Else
				ApMsgAlert(	"Erro ao localizar informações da função "+cComando,U_CXTxtMsg(,,.T.))
				cTxtLin1	:= 'ERRO AO LOCALIZAR INFORMAÇÕES'
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
			cTxtLin2	:= 'Parâmetros: '+cTxtLin2
		Else
			cTxtLin1	:= ''
			cTxtLin2	:= ''
			cParam		:= aFuncArray[nPos][2]
			If len(cParam) > 0
				cTxtLin1	:= U_CXParForm(cParam)
			Else
				cTxtLin1	:= 'Nenhum'
			EndIf
			cTxtLin1	:= 'Parâmetros: '+cTxtLin1
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
		aClsArr		:= __clsArr()	//Lista de classes de baixo nível
	EndIf

	//Monta lista de funcoes do fonte
	For nX := 1 to len(aFile)
		If RetFileName(Upper(aFile[nX])) == Upper(cFonte)
			cNomFun		:= aFuncRPO[nX]
			lClasse		:= ( '#NONE#' $ cNomFun ) //Classes
			cNomFun		:= StrTran(cNomFun,'#NONE#')
			nPosExt		:= Rat('.',cNomFun)
			If nPosExt > 0 //Remove extenção do nome do arquivo
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
					cTexto	+= 'FUNÇÕES: '
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
						cTexto	+= Chr(9)+Chr(9)+'MÉTODOS:'+CRLF	//MÉTODOS
						For nY := 1 to len(aMethods)
							cTexto	+= Chr(9)+Chr(9)+Chr(9)+aMethods[nY]+'()'+CRLF
						Next
					EndIf
					If ValType(aAtribut) == 'A'
						cTexto	+= Chr(9)+Chr(9)+'ATRIBUTOS:'+CRLF	//MÉTODOS
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

	//Busca nas classes de baixo nível-------------------------------------------------------------
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
		cTexto	+= Chr(9)+Chr(9)+'MÉTODOS:'+CRLF	//MÉTODOS
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
Info       : Função para salvar o login do usuário baseado nas credenciais do windows cliente
=================================================================================================*/
Static Function sfSingleSignOn(cUser)	/*@cUser*/		AS Logical

	//-- Declaracao de variaveis ----------------------------------------------
	Local aConInfo	:= FWGetTopInfo()				AS Array		//-- Retorna informações da conexão
	Local aUserInfo									AS Array
	Local cArqCred									AS Character
	Local cJson										AS Character
	Local cHashAtual								AS Character
	Local jCredUsr	:= JsonObject():New()			AS Json
	Local lOK		:= .F.							AS Logical
	Local ucMsgErr									AS Variant

	//-- Posições da do retorno da função FWGetTopInfo()
	Local nIP		:= 01							AS Numeric
	Local nNmBco	:= 05							AS Numeric

	//-------------------------------------------------------------------------
	cArqCred	:= GetTempPath()+SHA1(aConInfo[nIP]+'|'+aConInfo[nNmBco])+'.dat'
	If File(cArqCred)
		cJson	:= MemoRead(cArqCred)
		ucMsgErr:= jCredUsr:FromJson(cJson) //-- Converte texto Json em Objeto, se erro retorna uErro a mensagem
		If ValType(ucMsgErr) == 'C'
			FwAlertError(	'Erro na leitura do arquivo de credenciais.'+CRLF+;
							'Será recriado.'+CRLF+;
							ucMsgErr,_MsgLinha_)
		EndIf
	EndIf

	//-------------------------------------------------------------------------
	//-- Chave = Data Atual + Credencial do Windows Cliente + Usuário Windows -- Validade só de 1 dia por isso a data atual
	cHashAtual	:= Sha1(Dtos(Date())+'|'+GetCredential()+'|'+LogUserName(),2)
	If 	jCredUsr:hasProperty('hash') .And. ;
		jCredUsr:hasProperty('user')
		If cHashAtual == jCredUsr['hash']
			cUser	:= Decode64(jCredUsr['user'])	//-- Decodifica o código de usuário!

			PswOrder(1)	//-- Ordem por codigo
			If PswSeek(cUser)
				aUserInfo	:= FWSFAllUsers({cUser},{'USR_MSBLQL'})
				If aUserInfo[1][3] <> '1'	//-- Usuário NÃO bloqueado!
					lOK			:= .T.
				EndIf
			EndIf
		EndIf
	EndIf

	//-- Não bateu a credencial salva, solicita uma nova ----------------------
	If .Not. lOK
		If FWAuthUser(@cUser) 	//-- Solicita a senha do usuário
			If FWIsAdmin(cUser) //-- Usuário é administrador
				lOK	:= .T.
				jCredUsr['hash']	:= cHashAtual
				jCredUsr['user']	:= Encode64(cUser)
				cJson	:= jCredUsr:toJson()
				MemoWrite(cArqCred,cJson)
			Else
				FwAlertError(	'Usuário sem acesso a rotina. Apenas administradores podem '+;
								'utilizar a ferramenta.',_MsgLinha_)
			EndIf
		EndIf
	EndIf

Return lOK
