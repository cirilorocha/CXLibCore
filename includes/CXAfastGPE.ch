//Array aDetAfas fun��o FDiasAfast (GpeXCal1.prx)
Static cDA_PD	    := 01	AS Integer	//Codigo verba (R8_PD)
Static nDA_DIAPG	:= 02	AS Integer	//Qtd Dias a Pagar
Static cDA_NUMID	:= 03	AS Integer	//Numero ID (R8_NUMID)
Static nDA_DFGTS	:= 04	AS Integer	//Dias para FGTS
Static nDA_DENC	    := 05	AS Integer	//Dias para Encargos
Static nDA_DAUX_AFA	:= 06	AS Integer	//Total dias afastados
Static cDA_CODSEF	:= 07	AS Integer	//Codigo SEFIP (RCM_CODSEF)
Static dDA_DTINI	:= 08	AS Integer	//Data Inicial do Afastamento (R8_DATAINI)
Static nDA_MESMED	:= 09	AS Integer	//Quantidade de meses para calculo de media
Static dDA_DTFIM	:= 10	AS Integer	//Data Final do Afastamento (R8_DATAFIM)
Static cDA_TPEFD	:= 11	AS Integer	//Tipo de afastamento eSocial (RCM_TPEFD)
Static cDA_PDSUP	:= 12	AS Integer	//Verba Sup. (RCM_PDSUP)
Static nDA_DIASEM	:= 13	AS Integer	//Dias Pg Empr (RCM_DIASEM)
Static cDA_SEQ		:= 14	AS Integer	//Sequ�ncia (R8_SEQ)
Static cDA_CONTAFA	:= 15	AS Integer	//Nr.Sequencia (R8_CONTAFA)
Static nDA_DTOTAFA	:= 16	AS Integer	//Total dias afastados
Static nDA_DIAPG2	:= 17	AS Integer	//Qtd Dias a Pagar
Static cDA_TIPOAFA	:= 18	AS Integer	//Tipo de afastamento (R8_TIPOAFA)

//Array aAfast fun��o fRetAfasBra (GpeXFun1.prx)
Static nAF_AVOSAP	    := 01	AS Integer	//Avos afastados 
Static nAF_DIASAP	    := 02	AS Integer	//Dias afastados
Static dAF_INIAFA	    := 03	AS Integer	//In�cio do afastamento
Static dAF_FIMAFA	    := 04	AS Integer	//Fim do afastamento
Static cAF_TIPOAF	    := 05	AS Integer	//RCM_TIPOAF Tipo do afastamento (4->F=F�rias;#->A=Afast.)
Static cAF_CODRAIS	    := 06	AS Integer	//RCM_CODRAI C�digo RAIS
Static cAF_FERIAS	    := 07	AS Integer	//RCM_FERIAS Tratamento de F�rias (1=Perda ap�s 180 dias;2=Suspens�o do per�odo;3=Perda ap�s 30 dias;4=N�o perde)
Static cAF_DECIMO	    := 08	AS Integer	//RCM_DECIMO Tratamento de 13� Sal�rio (1=Sim;2=N�o)
Static cAF_PROVFE	    := 09	AS Integer	//RCM_PROVFE Tratamento Provis�o de F�rias (1=N�o Congela;2=Congela ap�s o primeiro m�s;3=Congela ap�s 6 meses)
Static cAF_PROV13	    := 10	AS Integer	//RCM_PROV13 Tratamento de Provis�o de 13� Sal�rio (1=Congela;2=N�o Congela)
Static nAF_DIASAFA	    := 11	AS Integer	//Dura��o do afastamento
Static cAF_PD	        := 12	AS Integer	//RCM_PD     Verba
Static cAF_TIPO	        := 13	AS Integer	//RCM_TIPO/R8_TIPOAFA   Tipo da aus�ncia (c�digo)
Static nAF_AVOSTOT	    := 14	AS Integer	//nAvosTot
Static nAF_DIASEMP	    := 15	AS Integer	//RCM_DIASEM Dias pagos pela empresa
Static cAF_CODSEF	    := 16	AS Integer	//RCM_CODSEF C�digo Sefip
Static cAF_DEPFGT	    := 17	AS Integer	//RCM_DEPFGT FGTS
Static cAF_ENCEMP	    := 18	AS Integer	//RCM_ENCEMP Encargos
Static nAF_DIASPGAUX	:= 19	AS Integer	//R8_DPAGOS  Dias Pagos - Usado na RAIS
Static nAF_DEMPRAIS		:= 20	AS Integer	//R8_DIASEMP Dias responsabilidade empresa - Usado na RAIS

//Array aAfast1 fun��o fBuscaAfast (GpeXFun1.prx)
Static dA1_DATAINI		:= 01	AS Integer	//R8_DATAINI Data de Afastamento
Static dA1_DATAFIM		:= 02	AS Integer	//R8_DATAFIM Data Fim do Afastamento
Static cA1_CODRAI		:= 03	AS Integer	//RCM_CODRAI C�digo RAIS
Static cA1_TIPO			:= 04	AS Integer	//RCM_TIPOAF Tipo da Ausencia (4->F=F�rias;#->A=Aus�ncia)
Static cA1_FERIAS		:= 05	AS Integer	//RCM_FERIAS Tipo Ausencia Ferias (1=Perda ap�s 180 dias;2=Suspens�o do per�odo;3=Perda ap�s 30 dias;4=N�o perde)
Static cA1_DECIMO		:= 06	AS Integer	//RCM_DECIMO Abate avos de 13o (1=Sim;2=N�o)
Static cA1_PROVFE		:= 07	AS Integer	//RCM_PROVFE Tratamento Provis�o de F�rias (1=N�o Congela;2=Congela ap�s o primeiro m�s;3=Congela ap�s 6 meses)
Static cA1_PROV13		:= 08	AS Integer	//RCM_PROV13 Tratamento de Provis�o de 13� Sal�rio (1=Congela;2=N�o Congela)
Static nA1_DIASEM		:= 09	AS Integer	//RCM_DIASEM Dias Pagos pela Empresa
Static cA1_CONTAFA		:= 10	AS Integer	//R8_CONTAFA Continuacao da Sequencia
Static nA1_DURACAO		:= 11	AS Integer	//R8_DURACAO Numero Dias
Static cA1_PD			:= 12	AS Integer	//RCM_PD     Verba	
Static cA1_TIPO			:= 13	AS Integer	//RCM_TIPO/R8_TIPOAFA   Codigo da Ausencia
Static cA1_PLR			:= 14	AS Integer	//RCM_PLR	 Abate Avos PLR (1=Sim;2=N�o)
Static cA1_SEQ			:= 15	AS Integer	//R8_SEQ			
Static cA1_DEPFGT		:= 16	AS Integer	//RCM_DEPFGT Deposito FGTS. (1=C�lculo Integral;2=C�lculo pelos dias pagos)
Static cA1_ENCEMP		:= 17	AS Integer	//RCM_ENCEMP Encargos Empresa (1=C�lculo Integral;2=C�lculo pelos dias pagos)
Static nA1_REINCI		:= 18	AS Integer	//RCM_REINCI Dias Reincidencia Aus�nc.
Static cA1_CODSEF		:= 19	AS Integer	//RCM_CODSEF C�digo Aus�ncia SEFIP
Static cA1_TIPOAF		:= 20	AS Integer	//RCM_TIPOAF Tipo da Ausencia (1=Afastamento;2=Outras Aus�ncias;3=Informativo;4=Controle de Dias de Direito)
Static nA1_DIASEMP		:= 21	AS Integer	//R8_DIASEMP Dias Pagos pela Empresa
Static nA1_SDPAGAR		:= 22	AS Integer	//R8_SDPAGAR Saldo Dias
Static nA1_DPAGOS		:= 23	AS Integer	//R8_DPAGOS  Dias Pagos
Static nA1_DPAGAR		:= 24	AS Integer	//R8_DPAGAR  Dias a Pagar	
Static cA1_DESCRI		:= 25	AS Integer	//RCM_DESCRI Descri��o da Ausencia
Static cA1_CDSEF2		:= 26	AS Integer	//RCM_CODSEF C�digo Aus�ncia SEFIP
Static nA1_DIAS13		:= 27	AS Integer	//RCM_DIAS13 Dias Afast. 13.Sal.
Static nA1_DIASPL		:= 28	AS Integer	//RCM_DIASPL Dias Afast. PLR
Static nA1_DIASFE		:= 29	AS Integer	//RCM_DIASFE Dias Afast. F�rias
Static cA1_CSIND		:= 30	AS Integer	//RCM_CSIND  Desconto Contrib. Sindical (1=Nao;2=Sim)
Static cA1_CONGAF		:= 31	AS Integer	//RCM_CONGAF Congela Afastamento (1=Congelamento por per�odo;2=Congelamento por afastamento)
