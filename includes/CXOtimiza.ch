//FONTE VOLTADO PARA OTIMIZAR ROTINAS PADRAO FAZENDO SUBSTITUICAO 
//DE FONTES PADRAO POR OUTROS MAIS EFICIENTES
//#Define dbSeek MsSeek	//O MsSeek não é melhor que o DbSeek em todos os cenários, 
//#Define DbSeek MsSeek	//precisa analisar se o mesmo registro será mesmo posicionado 
//#Define dbseek MsSeek	//muitas vezes, aí vale a pena o custo do MsSeek
//#Define DBSEEK MsSeek

#Define DBSETORDER U_CXSetOrd
#Define dbsetorder U_CXSetOrd
#Define dbSetOrder U_CXSetOrd

#Define GETMV FWSuperGetMV
#Define getmv FWSuperGetMV
#Define GetMV FWSuperGetMV
#Define GetMv FWSuperGetMV
#Define getMV FWSuperGetMV
#Define getMv FWSuperGetMV
#Define Getmv FWSuperGetMV

//Otimiza controle de area
#xTranslate GetArea() => ;
	tCtrlAlias():GetAlias()

#xTranslate RestArea(<oArea>) => ;
	<oArea>:RestAlias()

#Include "CXRegua.ch"
//Trocar as funcoes de regua
#xTranslate ProcRegua(<nTotal>) => ;
	U_CXSetRegua(nRG_PROCESSA,<nTotal>)

#xTranslate IncProc(<cMsg>) => ;
	U_CXIncRegua(nRG_PROCESSA,,<cMsg>)

#xTranslate SetRegua(<nTotal>) => ;
	U_CXSetRegua(nRG_RPTSTATUS,<nTotal>)

#xTranslate IncRegua() => ;
	U_CXIncRegua(nRG_PROCESSA)