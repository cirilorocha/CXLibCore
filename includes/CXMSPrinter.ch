//Posicoes array aImp
Static nIM_TITULO		:= 01		AS Integer
Static nIM_CAMPOS		:= 02		AS Integer
	Static nIC_TITULO		:= 01	AS Integer
	Static nIC_CONTEU		:= 02	AS Integer

Static nIC_TAMARR	:= 02			AS Integer

//Posicoes array aProds
Static nPR_TITULO		:= 01		AS Integer
Static nPR_DESCRI		:= 02		AS Integer
	Static nPD_TITULO		:= 01	AS Integer
	Static nPD_TAMANH		:= 02	AS Integer
	Static nPD_ALINHA		:= 03	AS Integer
Static nPR_CAMPOS		:= 03		AS Integer

Static nPR_TAMARR		:= 03		AS Integer

//Orientacoes
Static nPD_RETRATO 		:= 01 		AS Integer	// Portrait(retrato)
Static nPD_PAISAGEM		:= 02 		AS Integer	// Landscape(paisagem)

Static cPathDest		:= '\tReport\'		AS Character
Static nAdjust_Say		:= 30 		AS Numeric	//Ajuste padrao do say da totvs (FWMSPrinter)

//Alinhamento Horizontal
Static nALH_ESQUERDA	:= 0		AS Integer
Static nALH_DIREITA		:= 1		AS Integer
Static nALH_CENTRAL		:= 2		AS Integer
Static nALH_JUSTIFIC	:= 3		AS Integer

//Alinhamento Vertical
Static nALV_CENTRAL		:= 0		AS Integer
Static nALV_SUPERIOR	:= 1		AS Integer
Static nALV_INFERIOR	:= 2		AS Integer

//Dispositivos validos para a FWMsPrinter
Static aDevice	:= {"DISCO",; 	//01
					"SPOOL",; 	//02
					"EMAIL",; 	//03
					"EXCEL",; 	//04
					"HTML" ,; 	//05
					"PDF"  }; 	//06
						AS Array

Static aLocal	:= {"SERVER",; 	//01
					"CLIENT"};	//02
						AS Array

Static aOrientation	:= {"PORTRAIT",; 	//01
						"LANDSCAPE"}; 	//02
							AS Array
//------------------------------------------------------
#Define LN_SOLID			0 // Solid Line
#Define LN_DASH_LINE 		1 // Dash Line
#Define LN_DASH_DOT_LINE	2 // Dash Dot Line
#Define LN_DASH_DOT_DOT 	3 // Dash Dot Dot Line
#Define LN_DOT_LINE 		4 // Dot Line
#Define LN_CUSTOM_DASH 		5 // Custom Dash Line

//#Include "CXPathLog.ch" //Diretorio para gravacao logs de envio de email