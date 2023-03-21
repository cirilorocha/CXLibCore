//Posicoes do retorno da funcao CXeS_H
Static nTHE_TIPO	:= 01	AS Integer
Static nTHE_AUT		:= 02	AS Integer
Static nTHE_NAUT	:= 03	AS Integer

Static nTHE_TAMARR	:= 03	AS Integer

//-----------------------------------------------------------------------------------------------//
//AO EFETUAR MANUTENÇÕES AVALIAR OS FONTES CXESOCIAL E OUTROS FONTES QUE UTILIZAM ESSE INCLUDE   //
//-----------------------------------------------------------------------------------------------//
Static cIdBsINSSFol	:= GetMV('MS_IDBINSF',.F.,'0013,0014,0221')		AS Character
Static cIdBsINSS13	:= GetMV('MS_IDBINS1',.F.,'0019,0020')			AS Character
Static cIdINSSFol	:= GetMV('MS_IDINSFL',.F.,'0064')			    AS Character
Static cIdINSSFer	:= GetMV('MS_IDINSFR',.F.,'0065,1412')			AS Character
Static cIdINSS13	:= GetMV('MS_IDINS13',.F.,'0070')			    AS Character

Static cVbSalFam	:= GetMV('MS_OUTRSF',.F.,'008,916') 			AS Character	//Outras verbas de salario familia
Static bVbSalMat	:= {||	RV_CODFOL $ '0040,0407,1338,1339,1340,1341,1342,1351,1352,1353,1354,1355' .Or. ;	//Salario Maternidade
							RV_CODFOL $ '1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1732,1733,1651,1652' .Or. ; // Sal Mat 13
							RV_NATUREZ $ '4051,4050,9930,9931' .Or. ;
							RV_INCCP $ '21,22' } 	AS CodeBlock			//21 - Sal mat mensal pago pelo Empregador, 22 - Sal mat 13o pago pelo Empregador
Static bVbSalFam	:= &("{||	RV_CODFOL $ '0034' .Or. "+;					//Salario Familia
								"RV_COD $ '"+cVbSalFam+"' .Or. "+;			//FEITO ASSIM PARA UTILIZAR VARIAVEIS NO BLOCO E NA QUERY
								"RV_NATUREZ $ '1409' .Or. "+;
								"RV_INCCP == '51' }")
Static bVbSest		:= {||	RV_CODFOL $ '0437'}		AS CodeBlock
Static bVbSenat		:= {||	RV_CODFOL $ '1456'}		AS CodeBlock
//-------------------------------------------------------------------------------------------------
Static aCdBsCont	:=	{;//FEITO ASSIM PARA UTILIZAR VARIAVEIS NO BLOCO E NA QUERY
							{'##',&("{||	RV_CODFOL $ '"+cIdBsINSSFol+"' .Or. "+;		//Base INSS Mes
											"RV_CODFOL $ '"+cIdBsINSS13+"' }") },;		//Base INSS 13
							{'21',&("{||	RV_CODFOL $ '"+cIdINSSFol+"' .Or. "+;		//INSS Mes
											"RV_CODFOL $ '"+cIdINSSFer+"' .Or. "+;		//INSS Férias
											"RV_CODFOL $ '"+cIdINSS13+"' }") },;		//INSS 13
							{'22',bVbSest 	},;						//SEST
							{'23',bVbSenat 	},;						//SENAT
							{'31',bVbSalFam	},;
							{'32',bVbSalMat };
						}		AS Array

//Codigos das bases das contribuicoes (aCdBsCont)
Static cCB_COD		:= 01			AS Integer
Static bCB_BLK		:= 02			AS Integer

Static cXERPAlias	:= 'TAFXERP'	AS Character
Static cTAFST2Alias	:= 'TAFST2'	    AS Character

//Categorias Com Vinculo Empregatício
Static cCatTCV		:= 	fCatTrabEFD("TCV")+'|'+;
						GetMV('MX_SSTCEFD',.F.,'')	//Categorias adicionais a serem consideradas na geração dos eventos S-2240

Static dMS_SSTESOD	:= GetMV('MS_SSTESOD',.F.,CtoD('01/01/40')) //Define a data incial de obrigatoriedade de envio dos eventos do SESMT ao eSocial
Static lMS_SSTESOC	:= GetMV('MS_SSTESOC',.F.,.F.)				//Ativa integração SST
Static cMS_CERRIGT	:= GetMV('MS_CERRIGT',.F.,'000026')			//Códigos de erro TAF ignorados na integração
Static cMS_STAFPEN	:= GetMV('MS_STAFPEN',.F.,'2/6/9')			//Status que não permitem manipulação 2=Transmitido (aguardando); 6=Exclusão Transmitida (aguardando); 9=Processamento
Static cAMS10		:= GetMV('MX_ESVS10',.F.,'202205')			//Início de utilização da nova versão S1.0
Static cAMS1220		:= GetMV('MX_ESS1220',.F.,'999999')			//Início da utilização do evento S-1220