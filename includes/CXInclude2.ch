//-------------------------------------------------------------------------------------------------
/*/{Protheus.doc} CXInclude2.ch  v1.10 (23/01/2026)
@description	Conjunto de comanandos básicos para auxiliar no desenvolvimento de fontes
@autor			Cirilo Rocha
@since			07/01/2026
-------------------------------------------------------------------------------------------------*/

#Include 'ParmTypeCH.ch'

//#############################################################################
//#############################################################################
//#############################################################################
//########################## DEFINIÇÕES GERAIS ################################
//#############################################################################
//#############################################################################
//#############################################################################

#Define _NomeProg_		_fNomeProg_(0)
#Define _NomeProg2_		_fNomeProg2_(0)
#Define _LINHA_			_fLINHA_(0)
#Define _MsgLinha_		_fMsgLinha_(0)

#Define _LINOK_				'S'+_LINHA_
#Define _LINERRO_			'E'+_LINHA_
#Define _LINALERT_			'A'+_LINHA_
#Define _LININFO_			'I'+_LINHA_

//-- Pseudo-funções para obtenção de nome do programa e linha atual com parâmetro de linha
#xTranslate _fLINOK_(<nL>)		=>	'S'+_fLINHA_(<nL>)
#xTranslate _fLINERRO_(<nL>)	=>	'E'+_fLINHA_(<nL>)
#xTranslate _fLINALERT_(<nL>)	=>	'A'+_fLINHA_(<nL>)
#xTranslate _fLININFO_(<nL>)	=>	'I'+_fLINHA_(<nL>)

//-- Pseudo-funções para obtenção de nome do programa e linha atual
#xTranslate _fNomeProg_(<nL>)	=>	RetFileName(ProcSource(<nL>))
#xTranslate _fNomeProg2_(<nL>)	=>	SubStr(_fNomeProg_(<nL>),Rat('.',_fNomeProg_(<nL>))+1)

#xTranslate _fLINHA_(<nL>)		=>	StrZero(ProcLine(<nL>),5)
#xTranslate _fMsgLinha_(<nL>)	=>	_fNomeProg2_(<nL>)+'('+_fLINHA_(<nL>)+')'

#Define _MgsMainWind_	oMainWnd:cTitle(Left(oMainWnd:cTitle,IIF('['$oMainWnd:cTitle,At('[',oMainWnd:cTitle)-1,99))+' ['+_NomeProg2_+'_v'+_cVersao+' | '+_cDtVersao+']')		//-- Mostra versão no título da janela

//-- Posições dbStruct
#Define _nST_CPO1			1
#Define _nST_TIP2			2
#Define _nST_TAM3			3
#Define _nST_DEC4			4


//-- Posições FwTamSX3
#Define nX3_TAM1			1
#Define nX3_DEC2			2
#Define nX3_TIP3			3


#Define _CR_		Chr(13)
#Define _LF_		Chr(10)
#Define _TAB_		Chr(09)


#Define _lRotAuto_	(		FWIsInCallStack('FWMVCRotAuto') ;	//-- Execauto MVC
					.Or.	FWIsInCallStack('MSExecAuto') 	;	//-- Execauto padrão
					.Or.	FWIsInCallStack('EnchAuto') 	;	//-- Execauto enchoice
					.Or.	FWIsInCallStack('mBrowseAuto')	;	//-- Execauto browser
					.Or.	IsBlind() 						;	//-- Sem Interface
					.Or.	GetRemoteType() == NO_REMOTE 	;	//-- Se SmartClient (-1)
					.Or.	(Type('__cInterNet') == 'C' .And. __cInterNet == 'AUTOMATICO') ;	//-- Rotina automática
					)

#define _TamX3_CAMPO	10

//-- Facilitadores para uso de NameSpaces!
#IFDEF _NAMESPACE_
	#Define _CNAMESPACE_	\'_NAMESPACE_.\'								//-- PARA USO EM CHAMADAS STRING
	#Define _CNS_LOAD_		\'_NAMESPACE_\'+'.QUALQUERCOISA'				//-- NÃO ENTENDO PORQUE PRECISA TER ALGUM SUFIXO PARA FUNCIONAR!!!
	NAMESPACE	_NAMESPACE_
#ENDIF

//-- Facilitadores para uso de NameSpaces!
#IFDEF _USE_NAMESPACE_
	#Define _CUSE_NAMESPACE_	\'_USE_NAMESPACE_.\'						//-- PARA USO EM CHAMADAS STRING
	#Define _CUNS_LOAD_			\'_USE_NAMESPACE_\'+'.QUALQUERCOISA'		//-- NÃO ENTENDO PORQUE PRECISA TER ALGUM SUFIXO PARA FUNCIONAR!!!
	USING NAMESPACE	_USE_NAMESPACE_
#ENDIF

//-- Parâmetros usados em MVC
#Define nTP_MODEL	1
#Define nTP_VIEW	2

#Define nPE_MVC_MODEL		1
#Define nPE_MVC_IDPONTO		2
#Define nPE_MVC_IDMODEL		3
#Define nPE_MVC_LINHA		4

#Define MODEL_OPERATION_PRINT	8
#Define MODEL_OPERATION_COPY	9

//Parâmetros obrigatórios
#xCommand PARAMOBR [ <param> VAR ] <varname> ;
	[ MESSAGE <message> ] ;
	=> ;
	If (ValType(<varname>) == 'U' ) ;;
		UserException(PT_STR0001+<"param">+PT_STR0002+<"varname">+" erro, é obrigatório e está NULL. " [ MESSAGE <message> ]) ;;
	EndIf


//#############################################################################
//#############################################################################
//#############################################################################
//################### CONJUNTO DE PSEUDO-FUNÇÕES GERAIS! ######################
//#############################################################################
//#############################################################################
//#############################################################################

//-- Pseudo-Função para Concatenar Textos
#xTranslate _CXConcTxt(<cTexto>,<cTxtAdic>,<cSep>) => ;
	<cTexto>+If(Empty(<cTexto>).Or.Empty(<cTxtAdic>),'',<cSep>)+<cTxtAdic>


//-- Pseudo-Função para completar com zeros a esquerda, sem truncar o conteúdo
#xTranslate _CXCplCpo(<cConteudo>,<cCampo>)	=> ;
	_CXCplCpo(<cConteudo>,<cCampo>,'0')

#xTranslate _CXCplCpo(<cConteudo>,<cCampo>,<cChar>)	=> ;
	Replicate(<cChar>,FWTamSX3(<cCampo>)\[1\]-Len(AllTrim(<cConteudo>)))+AllTrim(<cConteudo>)


//-- Pseudo-Função para Extrair extensão do arquivo
#xTranslate _CxGetExt(<cTexto>) => ;
	Iif( (_nP:=Rat('.',<cTexto>))>0 , SubStr(<cTexto>,_nP+1) ,'')


#xTranslate _CXImpHora(<nHora>) => ;
	StrTran(StrZero(<nHora>,5,2),'.',':')


#xTranslate _CXDataExtenso(<dData>) => ;
	Day2Str(<dData>)+' de '+MesExtenso(<dData>)+' de '+Year2Str(<dData>)+'.' 	//-- Data extenso


#xTranslate _CXTransf(<xCont>,<cCampo>) => ;
	_CXTrf(<xCont>,<cCampo>)

#xTranslate _CXTrf(<xCont>,<cCampo>) => ;
	Transform(<xCont>,FwGetSx3Cache(<cCampo>,'X3_PICTURE'))

#xTranslate _CXaDel(<aDados>,<nPos>) => ;
	aDel(@<aDados>,<nPos>);;
	aSize(@<aDados>,len(<aDados>)-1)


#xTranslate _CxAIns(<aDados>,<nPos>) => ;
	aSize(@<aDados>,len(<aDados>)+1);;
	aIns(@<aDados>,<nPos>)


#xTranslate _CxFieldGet(<cCampo>) => ;
	FieldGet(FieldPos(<cCampo>))


#xTranslate _CxFieldPut(<cCampo>,<uConteudo>) => ;
	FieldPut(FieldPos(<cCampo>),<uConteudo>)


//-- Apaga tabela temporaria
#xTranslate  _CXClrTmp(<oArqTmp>) => ;
	If <oArqTmp> <> NIL ;;
		<oArqTmp>:Delete() ;;		//Apaga tabela temporaria
		FWFreeVar(<oArqTmp>) ;; 	//Destroi objeto
	EndIf


//-- Limpa objeto query
#xTranslate  _CXClrQry(<oQry>) => ;
	If <oQry> <> NIL ;;
		<oQry>:Destroy() ;;		//Chama o destrutor
		FWFreeVar(<oQry>) ;;  	//Destroi objeto
	EndIf


//-- Pseudo-Função para Impressão de um box vazado
#xTranslate _CXImpBox(<oRpt>,<nTop>,<nLeft>,<nBottom>,<nRight>[,<cPixel>])	=> ;
	<oRpt>:Line(<nTop>		,<nLeft>	,<nTop>		,<nRight>	,,<cPixel>)	;;
	<oRpt>:Line(<nTop>		,<nLeft>	,<nBottom>	,<nLeft>	,,<cPixel>)	;;
	<oRpt>:Line(<nBottom>	,<nLeft>	,<nBottom>	,<nRight>	,,<cPixel>)	;;
	<oRpt>:Line(<nTop>		,<nRight>	,<nBottom>	,<nRight>	,,<cPixel>)	;;

//-- Pseudo-Função para Impressão de um box preenchido com uma cor/brush
#xTranslate _CXImpBoxFill(<oRpt>,<nTop>,<nLeft>,<nBottom>,<nRight>,<oBrush>[,<cPixel>])	=> ;
	<oRpt>:FillRect({<nTop>,<nLeft>,<nBottom>,<nRight>},oBrush);;
	_CXImpBox(<oRpt>,<nTop>,<nLeft>,<nBottom>,<nRight>,<cPixel>)


#xTranslate _CxSubStr(<cText>,[<nPIni>],[<nPFim>]) => ;
	SubStr(<cText>,<nPIni>,<nPFim>-<nPIni>+1+IIF(<nPFim><0,Len(<cText>),0))

	
#xTranslate _CXQryCount(<cQuery>[,<aBindParam>]) => ;
	MpSysExecScalar("SELECT Count(*) QTDREG FROM ( "+<cQuery>+" ) TEMP ",'QTDREG',<aBindParam>)


//-- Contagem de registro de tabela temporária, LastRec retorna recno, se apagar registros a contagem fica errada
#xTranslate _CXTabCount(<cNmTabTmp>[,<aBindParam>]) => ;
	MpSysExecScalar("SELECT Count(*) QTDREG FROM "+<cNmTabTmp>+" ",'QTDREG',<aBindParam>)



#xTranslate AnoMes(<dDate>)				=> Left(DtoS(<dDate>),6)	//-- Otimização
#xTranslate MesAno(<dDate>)				=> Left(DtoS(<dDate>),6)	//-- Otimização


#xTranslate  _ConOut(<cMsg>) => ;
	LogMsg(	RetFileName(ProcSource())	;	//01 cFunc		//-- Mostra fonte da função chamadora!
		,	22 /*FAC_FRAME_*/			;	//02 nFacility
		,	6 /*SEV_INFORM_*/			;	//03 nSeverity
		,	1							;	//04 nVersao
		,	StrZero(ProcLine(),5)		;	//05 cMsgId		//-- Mostra linha da função chamadora!
		,	''							;	//06 cStrData
		,	ANSIToOEM(<cMsg>)			;	//07 cMsg
			)



#xTranslate _EhDic(<cTab>)	=> ;	//-- É dicionário
	( Left(AllTrim(<cTab>), 3)  + "," $ "SIX," .OR. Left(AllTrim(<cTab>), 2)  + "," $ "SX,XX,XA,XB," )


#xTranslate Decorrido => _CXDecorrido


#xTranslate _CXDecorrido(<nSeconds>) => ;
	PadL(LTrim(Str(Int((Seconds() - <nSeconds>)*1000))),10)

//#############################################################################
//#############################################################################
//#############################################################################
//##################### Controles da régua de processamento ###################
//#############################################################################
//#############################################################################
//#############################################################################

#Define _nSteps		200

#xTranslate _InicRegua() => ;
	SetPrvt('_nPasso,_nCont,_nQtdReg')	

#xTranslate __ProcRegua(<nQtRg>,<cFunc>) => ;
	_nCont	:= 0;;
	_nQtdReg:= <nQtRg>;;
	_nPasso	:= Ceiling(_nQtdReg/_nSteps);;
	<cFunc>(Ceiling(_nQtdReg/_nPasso));;
	ProcessMessages()

#xTranslate __IncProc(<cTxtProc>,<cFunc>) => ;
	If (_nCont++ % _nPasso) == 0 ;;
		<cFunc>(<cTxtProc>+' - '+Transform(_nCont,'@E 999,999,999')+' / '+;
				LTrim(Transform(_nQtdReg,'@E 999,999,999'))+;
				' ('+LTrim(Transform(NoRound((_nCont/_nQtdReg)*100,0),'@E 999'))+' %)');;
		ProcessMessages();;
	EndIf

#xTranslate _ProcRegua(<nQtRg>) => ;
	__ProcRegua(<nQtRg>,ProcRegua)

#xTranslate _IncProc(<cTxtProc>) => ;
	__IncProc(<cTxtProc>,IncProc)

#xTranslate _SetRegua(<nQtRg>) => ;
	__ProcRegua(<nQtRg>,SetRegua)

#xTranslate _IncRegua() => ;
	If (_nCont++ % _nPasso) == 0 ;;
		IncRegua();;
		ProcessMessages();;
	EndIf


//#############################################################################
//#############################################################################
//#############################################################################
//######################### TROCA DE FUNÇÕES PADRÃO ###########################
//#############################################################################
//#############################################################################
//#############################################################################

//-- MELHORIA EM ALGUMAS FUNÇÕES PADRÕES
#xTranslate IsInCallStack	=> FWIsInCallStack

#xTranslate PrefixoCpo		=> FwPrefixoCpo

#xTranslate inTransaction	=> inTransact

//-- Função de uso restrito que foi alterada para FW
#xTranslate PTInternal		=> FwPtInternal

#xTranslate WriteProfString	=> FwWriteProfString

#xTranslate CriaVar			=> FwCriaVar

#xTranslate InitPad			=> FwInitPad

//-- Otimizacao destas funcoes para executar diretamenta a funcao de interface
#xTranslate Alert			=> FwAlertWarning

#xTranslate ApMsgAlert		=> FwAlertWarning

#xTranslate MsgAlert		=> FwAlertWarning

#xTranslate ApMsgInfo		=> FwAlertInfo

#xTranslate MsgInfo			=> FwAlertInfo

#xTranslate ApMsgStop		=> FwAlertError

#xTranslate MsgStop			=> FwAlertError

#xTranslate ApMsgYesNo		=> FwAlertYesNo

#xTranslate MsgYesNo		=> FwAlertYesNo

#xTranslate ApMsgNoYes		=> FwAlertNoYes

#xTranslate MsgNoYes		=> FwAlertNoYes

#xTranslate RetSqlName		=> FWSX2Util():GetFile

#xTranslate FwX2Nome		=> FwSX2Util():GetX2Name

#xTranslate NoAcento		=> FwNoAccent
#xTranslate FwNoAcento		=> FwNoAccent
#xTranslate MsDocument		=> MpDocument

//-- Trocar a funcao Separa() padrao pela função de baixo nível StrTokArr2() se comporta examente como a função separa
#xTranslate Separa(<cTexto>) => ;
	StrTokArr2(<cTexto>,',',.F.)

#xTranslate Separa(<cTexto>,<cSeparador>[,<lPodenulo>]) => ;
	StrTokArr2(<cTexto>,<cSeparador>,<lPodenulo>)
	

#xTranslate MsgRun([<cText>],<cHeader>,<bAction>) => ;
	FWMsgRun(,<bAction>,<cHeader>,<cText>)

//-- Otimiza funções de controle de numeração --------------------------------
#xTranslate GetSX8Num	=> FwGetSXENum

#xTranslate GetSXENum	=> FwGetSXENum

#xTranslate SuperGetMV	=> FwSuperGetMV

//#############################################################################
//#############################################################################
//#############################################################################
//###################### CONSTANTES PARA RELATÓRIOS ###########################
//#############################################################################
//#############################################################################
//#############################################################################

//-- Alinhamentos relatório FWMSPrinter():SayAlign()
#DEFINE ALIGN_H_LEFT0		0
#DEFINE ALIGN_H_RIGHT1		1
#DEFINE ALIGN_H_CENTER2		2
#DEFINE ALIGN_H_JUSTIF3		3

#DEFINE ALIGN_V_CENTER0		0
#DEFINE ALIGN_V_TOP1		1
#DEFINE ALIGN_V_BOTTOM2		2

//-- Alinhamentos Excel FwPrinterXlsx()
#DEFINE ALIGN_EX_H_LEFT1	'1'
#DEFINE ALIGN_EX_H_CENTER2	'2'
#DEFINE ALIGN_EX_H_RIGHT3	'3'

#DEFINE ALIGN_EX_V_TOP1		'1'
#DEFINE ALIGN_EX_V_BOTTOM2	'2'
#DEFINE ALIGN_EX_V_CENTER3	'3'
