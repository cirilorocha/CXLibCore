#INCLUDE "rwmake.ch"
#INCLUDE "SHELL.CH"
#INCLUDE "Protheus.ch"
#INCLUDE "TBICONN.CH"
#include 'FWCommand.CH'
#Include "ParmType.ch"
#Include "CXInclude.ch"
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
	Local aSM0				AS Array
	Local nPos				AS Numeric
	Local nTamEmp			AS Numeric
	Local dDtBak			AS Date

	Local cModAnt		    AS Character
	Local nModAnt		    AS Numeric
	Local cMenuAnt		    AS Character

	Local cEmpAtu		    AS Character
	Local nX                AS Numeric
	Local lAchou            AS Logical
	Local cMsg              AS Character
	Local lCarrAmb		    AS Logical

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

		OpenSm0()	//Abre o sigamat

		aSM0	:= FWLoadSM0()
		For nX := 1 to len(aSM0)
			nTamEmp	:= Len(aSM0[nX][SM0_GRPEMP])
			cEmpAtu	:= aSM0[nX][SM0_GRPEMP]+'-'+aSM0[nX][SM0_NOMECOM]
			nPos	:= aScan(aSM0EmpFil,{|x| Left(x[1],nTamEmp) == aSM0[nX][SM0_GRPEMP] })
			If 	nPos == 0
				aAdd(aSM0EmpFil,{cEmpAtu,{}})
				nPos	:= len(aSM0EmpFil)
			EndIf
			
			aAdd(aSM0EmpFil[nPos][2],aSM0[nX][SM0_CODFIL]+'-'+Rtrim(aSM0[nX][SM0_NOMRED]))
		Next

		cEmp_ 	:= Left(aSM0EmpFil[1][1],2)
		cFil_	:= Space(2)

		//Seleciona a empresa / filial
		If !SelEmpFil()
			Return
		EndIf

		// Não consome licensa de uso
		RPCSetType(3)
		// Abre ambiente de trabalho
		RPCSetEnv(	Left(cEmp_,2)	,;	//01 Empresa
					Left(cFil_,2)	,;	//02 Filial
					/*cEnvUser*/	,;	//03 Usuario
					/*cEnvPass*/	,;	//04 Senha de Usuario
					/*cMod*/		,;	//05 Modulo (3ch)
					'CXTestFunc'	,;	//06 Nome da Funcao
					/*aTables*/		,;	//07 Tabelas para abrir
					/*lShowFinal*/	,;	//08 Alimenta a variavel lMsFinalAuto
					.T.				,;	//09 Gera mensagem de erro ao ocorrer erro ao checar a licenca
					.T.				,;	//10 Pega a primeira filial do arquivo SM0 quando não passar a filial e realiza a abertura dos SXs
					.T.				) 	//11 Faz a abertura da conexao com servidor do banco
//		PREPARE ENVIRONMENT EMPRESA Left(cEmp_,2) FILIAL Left(cFil_,2)

		__cUserID	:= '000000'
		cUserName	:= 'Administrador'

		lCarrAmb		:= .T. //Carregou o ambiente
		
		//Cria uma janela principal para trabalho
//		Public oMainWnd := TWorkSpace():New("CXTestFunc-oMainWnd")
		
		_lRecursivo	:= .F.	//Desativa o controle de recursividade
		
		DEFINE WINDOW oMainWnd FROM 001,001 TO 400,500 TITLE OemToAnsi( "CXTestFunc-oMainWnd" ) 
		ACTIVATE WINDOW oMainWnd MAXIMIZED ON INIT ( U_CXTestFunc() , oMainWnd:End() ) 
		
		Return
	EndIf

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
		aPergunta	:= {} //Variavel de perguntas
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
		TGet():New(nMrg  ,nMrg+45,{|u| if(PCount()>0,cGtTipo:=u,cGtTipo)}, oDlg, 130,nAltBt,'@',,,,,,,.T.,,,,,,,.T.,,,'cGtTipo')

	//	tSay():New(022,010,{|| 'Retorno:'},oDlg,,,,,,.T.,,,040,010)
		oGtRet	:=	tMultiget():New(nAltBt+nMrg*2,nMrg,{|u|if(Pcount()>0,cGtRet:=u,cGtRet)},;
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
	Local aEmp		    AS Array
	Local aFil		    AS Array
	Local oDlg			AS Object
	Local oEmp          AS Object
	Local oBOK			AS Object

	Local nX            AS Numeric
	Local nPos          AS Numeric
	Local lRet		    AS Logical

	Local nLarBt		AS Numeric
	Local nAltBt		AS Numeric
	Local aPosBt		AS Array

	Private oFil		AS Object

	//Inicializa Variaveis-------------------------------------------------------------------------
	aEmp		:= {}
	aFil		:= {}

	lRet		:= .F.

	nLarBt		:= 050
	nAltBt		:= 015

	//Preenche array de empresas
	For nX := 1 to len(aSM0EmpFil)
		aAdd(aEmp,AllTrim(aSM0EmpFil[nX][1]))
	Next

	//Carrega parametros
	aParam	:= GetParam('CXTestFuncE.par')
	If len(aParam) == 2
		cEmp_	:= AllTrim(aParam[1])
		cFil_	:= aParam[2]

		nPos		:= aScan(aEmp,{|X| X == cEmp_ })
		If nPos > 0
			aFil	:= aSM0EmpFil[nPos][2]
		Else
			cEmp_	:= AllTrim(aEmp[1])
			aFil	:= aSM0EmpFil[1][2]
		EndIf
	Else
		//Preenche array de filiais
		aFil	:= aSM0EmpFil[1][2]
	EndIf

	//---------------------------------------------------------------------------------------------
	oDlg	:= MSDialog():New(	000,000,160,350,U_CXTxtMsg()+'Selecione a empresa e filial',,,,DS_MODALFRAME,;
								/*CLR_BLACK*/,/*CLR_WHITE*/,,/*oWnd*/,.T.,,,,/*lTransparent*/)
		
		aPosBt	:= U_CXPosBtn(oDlg,nLarBt,nAltBt)
		
		oEmp	:= tComboBox():New(10,05,{|u|if(PCount()>0,cEmp_:=u,cEmp_)},aEmp,165,20,oDlg,,,;
										{|| VldEmp(oEmp:nAt)},,,.T.,,,,,,,,,'cEmp_')

		oFil	:= tComboBox():New(30,05,{|u|if(PCount()>0,cFil_:=u,cFil_)},aFil,165,20,oDlg,,,,,,.T.,,,,,,,,,'cFil_')

		tButton():New(aPosBt[1],aPosBt[5][1],'Cancelar'		,oDlg,{|| lRet := .F. , oDlg:End() },nLarBt,nAltBt,,,,.T.)
		oBOK	:= tButton():New(aPosBt[1],aPosBt[5][5],'OK'			,oDlg,{|| lRet := .T. , oDlg:End() },nLarBt,nAltBt,,,,.T.)
		oBOK:SetFocus()
		
	// ativa diálogo centralizado
	oDlg:Activate(,,,.T.,/*{|Self| Valid }*/,,/*{|Self| Init }*/ )

	If lRet
		SlvParam({cEmp_,cFil_},'CXTestFuncE.par')
	EndIf

Return lRet

//-------------------------------------------------------------------------------------------------
//Funcao para validar a combo da empresa e preencher o combo a filiais
//-------------------------------------------------------------------------------------------------
Static Function VldEmp(nPos	AS Numeric) AS Logical

	//Parametros da rotina-------------------------------------------------------------------------
	ParamObg 0		VAR nPos

	oFil:aItems := aSM0EmpFil[nPos][2]

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
		tGet():New(010,050,{|u| if(PCount()>0,MV_PAR01:=u,MV_PAR01)}, oDlg, 055,010,,;
					{|| VldFunc() },,,,,,.T.,,,,,,,,,,'MV_PAR01')
		tComboBox():New(010,110,{|u|if(PCount()>0,MV_PAR03:=u,MV_PAR03)},aCbMod,090,013,oDlg,,;
						,,,,.T.,,,,,,,,,'MV_PAR03')

		tSay():New(032,010,{|| 'Parâmetros:'	},oDlg,,/*oFont*/,,,,.T.,,,050,010)
		tGet():New(030,050,{|u| if(PCount()>0,MV_PAR02:=u,MV_PAR02)}, oDlg, 150,010,,;
					,,,,,,.T.,,,,,,,,,,'MV_PAR02')

		tSay():New(052,010,{|| 'Usuário:'	},oDlg,,/*oFont*/,,,,.T.,,,050,010)
		oGtUsr	:= tGet():New(050,050,{|u| if(PCount()>0,MV_PAR04:=u,MV_PAR04)}, oDlg, 050,010,,;
								{|| Vazio() .Or. UsrExist(MV_PAR04) },,,,,,.T.,,,,,,,,,,'MV_PAR04')
		oGtUsr:cF3	:= 'USR'
		tSay():New(052,110,{|| 'DataBase:'	},oDlg,,/*oFont*/,,,,.T.,,,050,010)
		tGet():New(050,140,{|u| if(PCount()>0,MV_PAR05:=u,MV_PAR05)}, oDlg, 060,010,,;
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

	U_CXWriteFile('C:\Temp\erro.log',cLogErro)

	U_CXApMsgMemo(cLogErro,'CXTestFunc-ERRO',.T.,.F.,.T.,.F.)

	Break

Return .F.
