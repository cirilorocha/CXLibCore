///////////////////////////////////////
//INCLUDE GERADO PELA FUNCAO CXGETINC//
///////////////////////////////////////

#define STR0001 FWI18NLANG("MDTA165","STR0001",0001)
#define STR0002 FWI18NLANG("MDTA165","STR0002",0002)
#define STR0003 FWI18NLANG("MDTA165","STR0003",0003)
#define STR0004 FWI18NLANG("MDTA165","STR0004",0004)
#define STR0005 FWI18NLANG("MDTA165","STR0005",0005)
#define STR0006 FWI18NLANG("MDTA165","STR0006",0006)
#define STR0007 FWI18NLANG("MDTA165","STR0007",0007)
#define STR0008 FWI18NLANG("MDTA165","STR0008",0008)
#define STR0009 FWI18NLANG("MDTA165","STR0009",0009)
#define STR0010 FWI18NLANG("MDTA165","STR0010",0010)
#define STR0011 FWI18NLANG("MDTA165","STR0011",0011)
#define STR0012 FWI18NLANG("MDTA165","STR0012",0012)
#define STR0013 FWI18NLANG("MDTA165","STR0013",0013)
#define STR0014 FWI18NLANG("MDTA165","STR0014",0014)
#define STR0015 FWI18NLANG("MDTA165","STR0015",0015)
#define STR0016 FWI18NLANG("MDTA165","STR0016",0016)
#define STR0017 FWI18NLANG("MDTA165","STR0017",0017)
#define STR0018 FWI18NLANG("MDTA165","STR0018",0018)
#define STR0019 FWI18NLANG("MDTA165","STR0019",0019)
#define STR0020 FWI18NLANG("MDTA165","STR0020",0020)
#define STR0021 FWI18NLANG("MDTA165","STR0021",0021)
#define STR0022 FWI18NLANG("MDTA165","STR0022",0022)
#define STR0023 FWI18NLANG("MDTA165","STR0023",0023)
#define STR0024 FWI18NLANG("MDTA165","STR0024",0024)
#define STR0025 FWI18NLANG("MDTA165","STR0025",0025)
#define STR0026 FWI18NLANG("MDTA165","STR0026",0026)
#define STR0027 FWI18NLANG("MDTA165","STR0027",0027)
#define STR0028 FWI18NLANG("MDTA165","STR0028",0028)
#define STR0029 FWI18NLANG("MDTA165","STR0029",0029)
#define STR0030 FWI18NLANG("MDTA165","STR0030",0030)
#define STR0031 FWI18NLANG("MDTA165","STR0031",0031)
#define STR0032 FWI18NLANG("MDTA165","STR0032",0032)
#define STR0033 FWI18NLANG("MDTA165","STR0033",0033)
#define STR0034 FWI18NLANG("MDTA165","STR0034",0034)
#define STR0035 FWI18NLANG("MDTA165","STR0035",0035)
#define STR0036 FWI18NLANG("MDTA165","STR0036",0036)
#define STR0037 FWI18NLANG("MDTA165","STR0037",0037)
#define STR0038 FWI18NLANG("MDTA165","STR0038",0038)
#define STR0039 FWI18NLANG("MDTA165","STR0039",0039)

//Cirilo Rocha - Prefiro definir a string dentro do include para diminuir o overhead do sistema
#IfDef SPANISH
		#define STR0001 "Buscar"
		#define STR0002 "Visualizar"
		#define STR0003 "Incluir"
		#define STR0004 "Modificar"
		#define STR0005 "Borrar"
		#define STR0006 "Ambiente Fisico"
		#define STR0007 " del Cliente: "
		#define STR0008 "Radiacion fuga"
		#define STR0009 "Radiacion de Fuga"
		#define STR0010 "Entorno vs Agente"
		#define STR0011 "Imprimir"
		#define STR0012 "Copiar"
		#define STR0013 "Generar Xml eSocial"
		#define STR0014 "ATENCIÓN"
		#define STR0015 "La nueva fecha de validez inicial no puede ser menor que la fecha de anterior."
		#define STR0016 "La fecha de validez inicial debe completarse al tener integración con el eSocial"
		#define STR0017 "¡Existen inconsistencias en la comunicación con el TAF!"
		#define STR0018 "¡Por favor, verifique!"
		#define STR0019 "Preencher a data de início da avaliação do ambiente (TNE_DTVINI)."
#Else
	#IfDef ENGLISH
		#define STR0001 "Search"
		#define STR0002 "View"
		#define STR0003 "Add"
		#define STR0004 "Edit"
		#define STR0005 "Delete"
		#define STR0006 "Physical environment"
		#define STR0007 " of Customer: "
		#define STR0008 "Scape Radiation"
		#define STR0009 "Scape Radiation"
		#define STR0010 "Ambiente x Agente"
		#define STR0011 "Print"
		#define STR0012 "Copy"
		#define STR0013 "Generate eSocial XML"
		#define STR0014 "ATTENTION"
		#define STR0015 "New start validity date cannot be before previous date."
		#define STR0016 "The start validity date must be completed in case of integration with eSocial"
		#define STR0017 "Inconsistencies in the communication with TAF!"
		#define STR0018 "Please check it out!"
		#define STR0019 "Enter the start date of evaluation of the environment (TNE_DTVINI)."
	#Else
		#define STR0001 "Pesquisar"
		#define STR0002 "Visualizar"
		#define STR0003 "Incluir"
		#define STR0004 "Alterar"
		#define STR0005 "Excluir"
		#define STR0006 "Ambiente Fisico"
		#define STR0007 " do Cliente: "
		#define STR0008 "Radiação Fuga"
		#define STR0009 "Radiação de Fuga"
		#define STR0010 "Ambiente x Agente"
		#define STR0011 "Imprimir"
		#define STR0012 "Copiar"
		#define STR0013 "Gerar Xml eSocial"
		#define STR0014 "ATENÇÃO"
		#define STR0015 "A nova data de validade inicial não pode ser menor que a data anterior."
		#define STR0016 "A data de validade inicial deve ser preenchida ao ter integração com o eSocial"
		#define STR0017 "Existem inconsistências na comunicação com o TAF!"
		#define STR0018 "Favor verificar!"
		#define STR0019 "Preencher a data de início da avaliação do ambiente (TNE_DTVINI)."
	#EndIf
#EndIf
