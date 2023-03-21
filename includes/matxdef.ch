/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡„o    ?MATXDEF  ?Autor ³Alexandre Inacio Lemes ?Data ?7/04/2011 ³±?
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡„o ³Arquivo de DEFINEs utilizados pela MATXFIS.                  ³±?
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/

Static NF_TIPONF        := 01     //Tipo : N , I , C , P
Static NF_OPERNF        := 02     //E-Entrada | S - Saida
Static NF_CLIFOR        := 03     //C-Cliente | F - Fornecedor
Static NF_TPCLIFOR      := 04     //Tipo do destinatario R,F,S,X
Static NF_LINSCR        := 05     //Indica se o destino possui inscricao estadual
Static NF_GRPCLI        := 06     //Grupo de Tributacao
Static NF_UFDEST        := 07     //UF do Destinatario
Static NF_UFORIGEM      := 08     //UF de Origem
Static NF_DESCONTO      := 10     //Valor Total do Deconto
Static NF_FRETE         := 11     //Valor Total do Frete
Static NF_DESPESA       := 12     //Valor Total das Despesas Acessorias
Static NF_SEGURO        := 13     //Valor Total do Seguro
Static NF_AUTONOMO      := 14     //Valor Total do Frete Autonomo
Static NF_ICMS          := 15     //Array contendo os valores de ICMS
#DEFINE NF_BASEICM       15,01  //Valor da Base de ICMS
#DEFINE NF_VALICM        15,02  //Valor do ICMS Normal
#DEFINE NF_BASESOL       15,03  //Base do ICMS Solidario
#DEFINE NF_VALSOL        15,04  //Valor do ICMS Solidario
#DEFINE NF_BICMORI       15,05  //Base do ICMS Original
#DEFINE NF_VALCMP        15,06  //Valor do Icms Complementar
#DEFINE NF_BASEICA       15,07  //Base do ICMS sobre o Frete Autonomo
#DEFINE NF_VALICA        15,08  //Valor do ICMS sobre o Frete Autonomo
#DEFINE NF_RECFAUT       15,09  //1-Emitente, 2-Transportador
Static NF_IPI           := 16     //Array contendo os valores de IPI
#DEFINE NF_BASEIPI       16,01  //Valor da Base do IPI
#DEFINE NF_VALIPI        16,02  //Valor do IPI
#DEFINE NF_BIPIORI       16,03  //Valor da Base Original do IPI
Static NF_TOTAL         := 17     //Valor Total da NF
Static NF_VALMERC       := 18     //Total de Mercadorias
Static NF_FUNRURAL      := 19     //Valor Total do FunRural
Static NF_CODCLIFOR     := 20     //Codigo do Cliente/Fornecedor
Static NF_LOJA          := 21     //Loja do Cliente/Fornecedor
Static NF_LIVRO         := 22     //Array contendo o Demonstrativo Fiscal
Static NF_ISS           := 23     //Array contendo os Valores de ISS
#DEFINE NF_BASEISS       23,01  //Base de Calculo do ISS
#DEFINE NF_VALISS        23,02  //Valor do ISS
#DEFINE NF_DESCISS       23,03  //Valor de desconto total de ISS
Static  NF_IR            := 24     //Array contendo os valores do Imposto de renda
#DEFINE NF_BASEIRR       24,01  //Base do Imposto de Renda do item
#DEFINE NF_VALIRR        24,02  //Valor do IR do item
Static  NF_INSS          := 25     //Array contendo os valores de INSS
#DEFINE NF_BASEINS       25,01  //Base de calculo do INSS
#DEFINE NF_VALINS        25,02  //Valor do INSS do item
Static  NF_NATUREZA      := 26     //Codigo da natureza a ser gravado nos titulos do Financeiro.
Static  NF_VALEMB        := 27     //Valor da Embalagem
Static  NF_RESERV1       := 28     //Array contendo as Bases de Impostos ( Argentina,Chile,Etc.)
Static  NF_RESERV2       := 29     //Array contendo os valores de Impostos ( Argentina,Chile,Etc. )
Static  NF_IMPOSTOS      := 30     //Array contendo todos os impostos calculados na funcao Fiscal com quebra por impostos+aliquotas
Static  NF_BASEDUP       := 31     //Base de calculo das duplicatas geradas no financeiro
Static  NF_RELIMP        := 32     //Array contendo a relacao de impostos que podem ser alterados
Static  NF_IMPOSTOS2     := 33     //Array contendo todos os impostos calculados na funcao Fiscal com quebras por impostos
Static  NF_DESCZF        := 34     //Valor Total do desconto da Zona Franca
Static  NF_SUFRAMA       := 35     //Indica se o Cliente pertence a SUFRAMA
Static  NF_BASEIMP       := 36     //Array contendo as Bases de Impostos Variaveis
#DEFINE NF_BASEIV1       36,01  //Base de Impostos Variaveis 1
#DEFINE NF_BASEIV2       36,02  //Base de Impostos Variaveis 2
#DEFINE NF_BASEIV3       36,03  //Base de Impostos Variaveis 3
#DEFINE NF_BASEIV4       36,04  //Base de Impostos Variaveis 4
#DEFINE NF_BASEIV5       36,05  //Base de Impostos Variaveis 5
#DEFINE NF_BASEIV6       36,06  //Base de Impostos Variaveis 6
#DEFINE NF_BASEIV7       36,07  //Base de Impostos Variaveis 7
#DEFINE NF_BASEIV8       36,08  //Base de Impostos Variaveis 8
#DEFINE NF_BASEIV9       36,09  //Base de Impostos Variaveis 9
Static  NF_VALIMP        := 37     //Array contendo os valores de Impostos Agentina/Chile/Etc.
#DEFINE NF_VALIV1        37,01  //Valor do Imposto Variavel 1
#DEFINE NF_VALIV2        37,02  //Valor do Imposto Variavel 2
#DEFINE NF_VALIV3        37,03  //Valor do Imposto Variavel 3
#DEFINE NF_VALIV4        37,04  //Valor do Imposto Variavel 4
#DEFINE NF_VALIV5        37,05  //Valor do Imposto Variavel 5
#DEFINE NF_VALIV6        37,06  //Valor do Imposto Variavel 6
#DEFINE NF_VALIV7        37,07  //Valor do Imposto Variavel 7
#DEFINE NF_VALIV8        37,08  //Valor do Imposto Variavel 8
#DEFINE NF_VALIV9        37,09  //Valor do Imposto Variavel 96
Static  NF_TPCOMP        := 38     //Tipo de complemento  - F Frete , D Despesa Imp.
Static  NF_INSIMP        := 39     //Flag de Controle : Indica se podera inserir Impostos no Rodape.
Static  NF_PESO          := 40     //Peso Total das mercadorias da NF
Static  NF_ICMFRETE      := 41     //Valor do ICMS relativo ao frete
Static  NF_BSFRETE       := 42     //Base do ICMS relativo ao frete
Static  NF_BASECOF       := 43     //Base de calculo do COFINS
Static  NF_VALCOF        := 44     //Valor do COFINS
Static  NF_BASECSL       := 45     //Base de calculo do CSLL
Static  NF_VALCSL        := 46     //Valor do CSLL
Static  NF_BASEPIS       := 47     //Base de calculo do PIS
Static  NF_VALPIS        := 48     //Valor do PIS
Static  NF_ROTINA        := 49     //Nome da rotina que esta utilizando a funcao
Static  NF_AUXACUM       := 50     //Campo auxiliar para acumulacao no calculo de impostos
Static  NF_ALIQIR        := 51     //Aliquota de IRF do Cliente
Static  NF_VNAGREG       := 52     //Valor da Mercadoria nao agregada.
Static  NF_RECPIS        := 53     //Recolhe PIS
Static  NF_RECCOFI       := 54     //Recolhe CONFINS
Static  NF_RECCSLL       := 55     //Recolhe CSLL
Static  NF_RECISS        := 56     //Recolhe ISS
Static  NF_RECINSS       := 57     //Recolhe INSS
Static  NF_MOEDA         := 58     //Moeda da nota
Static  NF_TXMOEDA       := 59     //Taxa da moeda
Static  NF_SERIENF       := 60     //Serie da nota fiscal
Static  NF_TIPODOC       := 61     //Tipo do documento (localizacoes)
Static  NF_MINIMP        := 62     //Minimo para calcular Impostos Variaveis
#DEFINE NF_MINIV1        62,01  //Minimo para calcular Imposto Variavel 1
#DEFINE NF_MINIV2        62,02  //Minimo para calcular Imposto Variavel 2
#DEFINE NF_MINIV3        62,03  //Minimo para calcular Imposto Variavel 3
#DEFINE NF_MINIV4        62,04  //Minimo para calcular Imposto Variavel 4
#DEFINE NF_MINIV5        62,05  //Minimo para calcular Imposto Variavel 5
#DEFINE NF_MINIV6        62,06  //Minimo para calcular Imposto Variavel 6
#DEFINE NF_MINIV7        62,07  //Minimo para calcular Imposto Variavel 7
#DEFINE NF_MINIV8        62,08  //Minimo para calcular Imposto Variavel 8
#DEFINE NF_MINIV9        62,09  //Minimo para calcular Imposto Variavel 9
Static NF_BASEPS2       := 63     //Base de calculo do PIS 2
Static NF_VALPS2        := 64     //Valor do PIS 2
Static NF_ESPECIE       := 65     //Especie do Documento
Static NF_CNPJ          := 66     //CNPJ/CPF
Static NF_BASECF2       := 67     //Base de calculo do COFINS 2
Static NF_VALCF2        := 68     //Valor do COFINS 2
Static NF_ICMSDIF       := 69     //Valor do ICMS diferido
Static NF_MODIRF        := 70     //Calculo do IRPF
#DEFINE NF_PNF_COD       71,01  //Codigo do pagador do documento fiscal
#DEFINE NF_PNF_LOJ       71,02  //Loja   do pagador do documento fiscal
#DEFINE NF_PNF_UF        71,03  //UF do pagador do documento fiscal
#DEFINE NF_PNF_TPCLIFOR  71,04  //Tipo do pagador do documento fiscal
Static NF_CALCSUF       := 72     //Indica se cliente possui calculo suframa
Static NF_BASEAFRMM     := 73     //Base de calculo do AFRMM ( Cabecalho )
Static NF_VALAFRMM      := 74     //Valor do AFRMM ( Cabecalho )
Static NF_PIS252        := 75     //Decreto 252 de 15/06/2005 - Valor do PIS para retencao aquisicao a aquisicao - sem considerar R# 5.000,00 da Lei 10925
Static NF_COF252        := 76     //Decreto 252 de 15/06/2005 - Valor da COFINS para retencao aquisicao a aquisicao - sem considerar R# 5.000,00 da Lei 10925
Static NF_OPIRRF        := 77     //Indicacao de Orgao Publico para recolhimento de IRRF
Static NF_SEST          := 78     //Array contendo os valores do SEST (Servico Social do Transporte)
#DEFINE NF_BASESES       78,01  //Base de calculo do SEST
#DEFINE NF_VALSES        78,02  //Valor do SEST
Static NF_RECSEST       := 79     //Recolhe SEST
Static NF_BASEPS3       := 80     //Base de calculo do PIS Subst. Tributaria
Static NF_VALPS3        := 81     //Valor do PIS Subst. Tributaria
Static NF_BASECF3       := 82     //Base de calculo da COFINS Subst. Tributaria
Static NF_VALCF3        := 83     //Valor da COFINS Subst. Tributaria
Static NF_VLR_FRT       := 84     //Valor Total do Frete de Pauta
Static NF_VALFET        := 85     //Valor do FETHAB
Static NF_RECFET        := 86     //FETHAB
Static NF_CLIENT        := 87     //Codigo do cliente de entrega na nota fiscal de saida
Static NF_LOJENT        := 88     //Loja do cliente de entrega na nota fiscal de saida
Static NF_VALFDS        := 89     //Valor do Fundersul - Mato Grosso do Sul
Static NF_ESTCRED       := 90     //Valor do Estorno de Credito/Debito
Static NF_SIMPNAC       := 91     //Define se o Cliente/Fornecedor se enquadra no regime do Simples Nacional
#DEFINE NF_TRANSUF       92,01  //UF do transportador
#DEFINE NF_TRANSIN       92,02  //Indicacao de inscricao do transportador
Static NF_BASETST       := 93     //Base do ICMS de transporte Substituicao Tributaria
Static NF_VALTST        := 94     //Valor do ICMS de transporte Substituicao Tributaria
Static NF_CRPRSIM       := 95     //Valor Crédito Presumido Simples Nacional - SC, nas aquisições de fornecedores que se enquadram no simples
Static NF_VALANTI       := 96     //Valor Antecipacao ICMS
Static NF_DESNTRB       := 97     //Despesas Acessorias nao tributadas - Portugal
Static NF_TARA          := 98     //Tara - despesas com embalagem do transporte - Portugal
Static NF_NUMDEP        := 99     //Numero de dependentes - cálculo base IRRF pessoa fisica
Static NF_PROVENT       := 100     //Provincia de entrega
Static NF_VALFECP       := 101     //Valor FECP
Static NF_VFECPST       := 102     //Valor FECP ST
Static NF_CRDPRES       := 103     //Valor Credito Presumido SC
Static NF_IRPROG        := 104     //Calcula IR pela Tabela Progressiva mesmo para Pessoa Jurídica
Static NF_VALII         := 105     //Valor do Imposto de Importacao (PIS/COFINS)
Static NF_RECIV         := 106     //Flag que identifica se os impostos dos itens anteriores deverão ser recalculado recursivamente ou não - localizado PERU "PER"
Static NF_CRPREPE       := 107     //Credito Presumido - Art. 6 Decreto  n28.247
Static NF_VLRORIG       := 108
#DEFINE NF_VLRORI1       108,01  //Base de Impostos Variaveis 1
#DEFINE NF_VLRORI2       108,02  //Base de Impostos Variaveis 2
#DEFINE NF_VLRORI3       108,03  //Base de Impostos Variaveis 3
#DEFINE NF_VLRORI4       108,04  //Base de Impostos Variaveis 4
#DEFINE NF_VLRORI5       108,05  //Base de Impostos Variaveis 5
#DEFINE NF_VLRORI6       108,06  //Base de Impostos Variaveis 6
#DEFINE NF_VLRORI7       108,07  //Base de Impostos Variaveis 7
#DEFINE NF_VLRORI8       108,08  //Base de Impostos Variaveis 8
#DEFINE NF_VLRORI9       108,09  //Base de Impostos Variaveis 9
Static NF_VALFAB        := 109     //Valor do FABOV -  Mato grosso
Static NF_RECFAB        := 110     //Responsabilidade de recolhimento FABOV - Mato Grosso
Static NF_VALFAC        := 111     //Valor do FACS - Mato Grosso
Static NF_RECFAC        := 112     //Responsabilidade de recolhimento FACS - Mato Grosso
Static NF_LJCIPI        := 113     //Controla se calcula IPI (SIGALOJA)
Static NF_VALFUM        := 114     //Valor FUMACOP
Static NF_VLSENAR       := 115     //Valor do Senar
Static NF_CROUTSP       := 116     //Credito Outorgado SP - Decreto 56.018/2010
Static NF_BSSEMDS       := 117     //Valor Desconto - Decreto 43.080/2002 RICMS-MG
Static NF_ICSEMDS       := 118     //Valor Desconto - Decreto 43.080/2002 RICMS-MG
Static NF_DS43080       := 119     //Valor Desconto - Decreto 43.080/2002 RICMS-MG
Static NF_VL43080       := 120     //Valor de ICMS sem debito de imposto - Decreto 43.080/2002 RICMS-MG
Static NF_BASEFUN       := 121     //Valor da Base do FUNRURAL
Static NF_PEDIDO        := 122     //Pedido de Venda
Static NF_CODMUN        := 123     // Codigo do Municipio utilizado na operacao
#DEFINE NF_VALTPDP       124,01  //Valor da TPDP - PB
#DEFINE NF_BASTPDP       124,02  //Base da TPDP - PB
Static NF_VLINCMG       := 125     //Valor do incentivo prod.leite RICMS-MG
Static NF_BASEINA       := 126     //Base de calculo do INSS Condições Especiais
Static NF_VALINA        := 127     //Valor do INSS Condições Especiais
Static NF_VFECPRN       := 128     //Valor FECOP-RN
Static NF_VFESTRN       := 129     //Valor FECOP ST-RN
Static NF_CREDPRE       := 130     //Credito Presumido RS
Static NF_VFECPMG       := 131     //Valor FECP-MG
Static NF_VFESTMG       := 132     //Valor FECP ST-MG
Static NF_VREINT        := 133     //Valor de Reintegra
Static NF_BSREIN        := 134     //Base de Calculo do Reintegra
Static NF_VFECPMT       := 135     //Valor FECP-MT
Static NF_VFESTMT       := 136     //Valor FECP ST-MT
Static NF_REGESIM       := 137     // Regime simplificado MT - A1_REGESIM / A2_REGESIM
Static NF_PERCATM       := 138     // Pecentual de Carga Media - A1_PERCATM
Static NF_PESSOA        := 139     // Tipo Pessoa - Fisica/Juridica - A1_PESSOA
Static NF_NREDUZ        := 140     // Nome de Fantasia - A1_NREDUZ / A2_NREDUZ
Static NF_A1CRDMA       := 141     // Credito Estimulo de Manaus - A1_CRDMA
Static NF_SIMPSC        := 142     // Clie. optante SIMPLES/SC  - A1_SIMPLES
Static NF_CDRDES        := 143     //Regiao do cliente
#DEFINE NF_CLIEFAT       144,01  //Cliente do Faturamento
#DEFINE NF_LOJCFAT       144,02  //Loja do Cliente do Faturamento
#DEFINE NF_TIPOFAT       144,03  //Tipo do Cliente do Faturamento
#DEFINE NF_GRPFAT        144,04  //Grupo do Cliente do Faturamento
#DEFINE NF_NATUFAT       144,05  //Natureza do Cliente do Faturamento
Static NF_ISSABMT       := 145     //Abatimentos de Materiais do ISS
Static NF_ISSABSR       := 146     //Abatimentos de Servicos do ISS
Static NF_INSABMT       := 147     //Abatimentos de Materiais do INSS
Static NF_INSABSR       := 148     //Abatimentos de Servicos do INSS
Static NF_ADIANT        := 149     //Adiantamentos Mexico
Static NF_VTOTPED       := 150     //Total do Pedido
Static NF_DTEMISS       := 151     //Total do Pedido
Static NF_IDSA1         := 152     //ID Historico SA1
Static NF_IDSA2         := 153     //ID Historico SA2
Static NF_IDSED         := 154     //ID Historico SED
Static NF_DESCTOT       := 155     //Total do Desconto do Item - USO DO NOVO PDV - LOJA
Static NF_ACRESCI       := 156     //Total do Acrescimos do Item - USO DO NOVO PDV - LOJA
Static NF_TPFRETE       := 157     //Tipo de Frete definido no Pedido
Static NF_FRETISS       := 158     //Forma de Retencao do ISS. 1 - Considera Valor Minimo; 2 - Sempre Retem
Static NF_UFPREISS      := 159     //UF da prestacao do servico do ISS onde o servico foi prestado
Static NF_UFXUF         := 160     //Array com conteudo da tabela CFC
Static NF_VALCIDE       := 161     //Valor do CIDE
Static NF_RECCIDE       := 162     // RecCide SA2
Static NF_VALFETR       := 163     // VAlor do FETHAB retido pelo cliente/fornecedor
Static NF_MODAL         := 164     // Modal CTE SF1
Static NF_ADIANTTOT     := 167     //Adiantamento(PERU)
Static NF_BASECID       := 168     //Base de Calculo CIDE
Static NF_BASECPM       := 169     //Base do ISS CEPOM
Static NF_VALCPM        := 170     // Valor do ISS CEPOM
Static NF_IPIVFCF       := 171     //Valor IPI a ser inserido na base do ICM, venda futura CF
Static NF_BASEFMP       := 172     // Base Fumipeq
Static NF_VALFMP        := 173     // Valor Fumipeq
Static NF_VALFMD        := 174     //Valor Famad
Static NF_RECFMD        := 175     //Responsabilidade de recolhimento FAMAD - Mato Grosso
Static NF_SERSAT        := 176     //Responsabilidade de recolhimento FAMAD - Mato Grosso
Static NF_BASNDES       := 177     // Base ICMS ST Recolh. Ant.
Static NF_ICMNDES       := 178     // Valor ICMS ST Recolhido Anteriormente.
Static NF_TPCOMPL       := 179     // Tipo de Complemento
Static NF_DIFAL         := 180     //Difal
Static NF_PPDIFAL       := 181     //regra para calculo de Difal para consumidor final
Static NF_VFCPDIF       := 182
Static NF_BASEDES       := 183     //Base Difal estado de destino
Static NF_CLIDEST       := 184     //Cliente de destino da mercadoria
Static NF_LOJDEST       := 185     //Loja de destino da mercadoria
Static NF_UFCDEST       := 186     //UF de destino da mercadoria
Static NF_CLIEDEST      := 187     //verifica se cliente de destino da mercadoria é contribuinte
Static NF_VALFUND       := 188     //Valor do FUNDESA
Static NF_VALIMA        := 189     //Valor do IMA-MT
Static NF_VALFASE       := 190     //Valor do FASE-MT
Static NF_VLIMAR        := 191     //Valor do IMA-MT retido pelo cliente/fornecedor
Static NF_VLFASER       := 192     //Valor do FASE-MT retido pelo cliente/fornecedor
Static NF_RECIMA        := 193     //Recolhimento IMA-MT
Static NF_RECFASE       := 194     //Recolhimento FASE-MT
Static NF_PRCMEDP       := 195     //Preço Médio Ponderado, para ser utilizado como base de ICMS ST
Static NF_INDICE        := 196     //Indice tabela F0R
Static NF_VALPEDG       := 197     //Valor do Pedágio, informado pela rotina MATA116.
Static NF_TPACTIV       := 198     //Actividad economica
Static NF_CALCINP       := 199     //Calcula INSS Patronal
Static NF_VALINP        := 200     //Valor do INSS Patronal
Static NF_AFRMIMP       := 201     //Valor do AFRMM na Importação
Static NF_VALPRO        := 202     //Valor PROTEGE-GO
Static NF_INDUFP        := 203     //Indice Mato Grosso
Static NF_VALFEEF       := 204     //Valor FEEF-RJ
Static NF_DEDBSPC       := 205     // Impostos que serão deduzidos da base de PIS/COFINS.
Static NF_M0CODMUN      := 206     // Codigo do municipio do SIGAMAT.
Static NF_TIPORUR       := 207     // Tipo do Fornecedor para efeito da contribuicao seguridade social.
Static NF_RECIRRF       := 208     // Recolhe IRRF sim ou não.
Static NF_BFCPANT       := 209     // Base do FCP recolhido anteriormente.
Static NF_VFCPANT       := 210     // Valor do FCP recolhido anteriormente.
Static NF_PERFECP       := 211     // Percentual do FECP "por CNAE": Campo A1_PERFECP ou parametro MV_PERFECP.
Static NF_BASFECP       := 212     // Base do FECP - Proprio.
Static NF_BSFCPST       := 213     // Base do FECP - ST.
Static NF_BSFCCMP       := 214     // Base do FECP - Complementar.
Static NF_EMITENF       := 215     // Se nota fiscal ou cupom fiscal (Sigaloja)
Static NF_ALIQSN        := 216     // Alíquotas de ICMS/ISS calculadas pela apuração do SIMPLES NACIONAL.
Static NF_USAALIQSN     := 217     // Define se devem ou não ser utilizadas as alíquotas calculadas pela apuração do SIMPLES NACIONAL.
Static NF_GROSSIR       := 218     // Opção da base de cálculo do IR, se deverá ou não fazer o Gross Up
Static NF_TPJFOR        := 219     // Tipo de pessoa jurídica do fornecedor
Static NF_CODDECL       := 220     // Valida se possui estrutura para calcular valor Declaratorio
Static NF_TEMF2B        := 221     // Flag para indicar se existe, ao menos, uma regra na tabela F2B.
Static NF_TRIBGEN       := 222     // Totalizador dos tributos genéricos.
Static NF_CALCTG        := 223     // Flag para indicar se os tributos genéricos devem ou não ser calculados - deve ser passado como .T. somente após a preparação da rotina para gravação, visualização e exclusão dos tributos genéricos.
Static NF_PERF_PART     := 224     // Indica se o participante está contido em ao menos 1 perfil de participante dos tributos genéricos
Static NF_QTDITENS      := 225     // Quantidade de itens do documento
Static NF_TPBANCO       := 226     // Tipo do banco de dados do ambiente
Static NF_DEDICM        := 227     // Valor do ICMS a ser deduzido
Static NF_SAVEDEC_TG    := 228     // Controle do SavaDec dos tributos genéricos
Static NF_CHKTRIBLEG    := 229     // Flag indicando se deve chamar função ChkTribLeg de verificação de tributo genérico com ID de tributo legado.
Static NF_TOTAL_C1      := 230     // Grand Total in main currency
Static NF_BASEIMP_C1    := 231     // Tax calculation base in main currency
#DEFINE NF_BASEIV1_C1    231,01  //Base de Impostos Variaveis 1
#DEFINE NF_BASEIV2_C1    231,02  //Base de Impostos Variaveis 2
#DEFINE NF_BASEIV3_C1    231,03  //Base de Impostos Variaveis 3
#DEFINE NF_BASEIV4_C1    231,04  //Base de Impostos Variaveis 4
#DEFINE NF_BASEIV5_C1    231,05  //Base de Impostos Variaveis 5
#DEFINE NF_BASEIV6_C1    231,06  //Base de Impostos Variaveis 6
#DEFINE NF_BASEIV7_C1    231,07  //Base de Impostos Variaveis 7
#DEFINE NF_BASEIV8_C1    231,08  //Base de Impostos Variaveis 8
#DEFINE NF_BASEIV9_C1    231,09  //Base de Impostos Variaveis 9
#DEFINE NF_VALIMP_C1     232     // Value of Tax in main currency
#DEFINE NF_VALIV1_C1     232,01  //Valor do Imposto Variavel 1
#DEFINE NF_VALIV2_C1     232,02  //Valor do Imposto Variavel 2
#DEFINE NF_VALIV3_C1     232,03  //Valor do Imposto Variavel 3
#DEFINE NF_VALIV4_C1     232,04  //Valor do Imposto Variavel 4
#DEFINE NF_VALIV5_C1     232,05  //Valor do Imposto Variavel 5
#DEFINE NF_VALIV6_C1     232,06  //Valor do Imposto Variavel 6
#DEFINE NF_VALIV7_C1     232,07  //Valor do Imposto Variavel 7
#DEFINE NF_VALIV8_C1     232,08  //Valor do Imposto Variavel 8
#DEFINE NF_VALIV9_C1     232,09  //Valor do Imposto Variavel 9
#DEFINE NF_VALMERC_C1    233     //Goods Value in main currency

Static IT_GRPTRIB       := 01     //Grupo de Tributacao
Static IT_EXCECAO       := 02     //Array da EXCECAO Fiscal
Static IT_ALIQICM       := 03     //Aliquota de ICMS
Static IT_ICMS          := 04     //Array contendo os valores de ICMS
#DEFINE IT_BASEICM       04,01  //Valor da Base de ICMS
#DEFINE IT_VALICM        04,02  //Valor do ICMS Normal
#DEFINE IT_BASESOL       04,03  //Base do ICMS Solidario
#DEFINE IT_ALIQSOL       04,04  //Aliquota do ICMS Solidario
#DEFINE IT_VALSOL        04,05  //Valor do ICMS Solidario
#DEFINE IT_MARGEM        04,06  //Margem de lucro para calculo da Base do ICMS Sol.
#DEFINE IT_BICMORI       04,07  //Valor original da Base de ICMS
#DEFINE IT_ALIQCMP       04,08  //Aliquota para calculo do ICMS Complementar
#DEFINE IT_VALCMP        04,09  //Valor do ICMS Complementar do item
#DEFINE IT_BASEICA       04,10  //Base do ICMS sobre o frete autonomo
#DEFINE IT_VALICA        04,11  //Valor do ICMS sobre o frete autonomo
#DEFINE IT_DEDICM        04,12  //Valor do ICMS a ser deduzido
#DEFINE IT_VLCSOL        04,13  //Valor do ICMS Solidario calculado sem o credito aplicado
#DEFINE IT_PAUTIC        04,14  //Valor da Pauta do ICMS Proprio
#DEFINE IT_PAUTST        04,15  //Valor da Pauta do ICMS-ST
#DEFINE IT_PREDIC        04,16  //%Redução da Base do ICMS
#DEFINE IT_PREDST        04,17  //%Redução da Base do ICMS-ST
#DEFINE IT_MVACMP        04,18  //Margem do complementar
#DEFINE IT_PREDCMP       04,19  //%Redução da Base do ICMS-CMP
#DEFINE IT_BASEDES       04,20  //Base de ICMS difal do destinatario // EC 87
#DEFINE IT_BSICARD       04,21  //Base do ICMS complementar antes da reducao
#DEFINE IT_VLICARD       04,22  //Valor do ICMS complementar antes da reducao
Static IT_ALIQIPI       := 05     //Aliquota de IPI
Static IT_IPI           := 06     //Array contendo os valores de IPI
#DEFINE IT_BASEIPI       06,01  //Valor da Base do IPI
#DEFINE IT_VALIPI        06,02  //Valor do IPI
#DEFINE IT_BIPIORI       06,03  //Valor da Base Original do IPI
#DEFINE IT_PREDIPI       06,04  //%Redução da Base do IPI
#DEFINE IT_PAUTIPI       06,05  //Valor da Pauta do IPI
Static IT_NFORI         := 07     //Numero da NF Original
Static IT_SERORI        := 08     //Serie da NF Original
Static IT_RECORI        := 09     //RecNo da NF Original (SD1/SD2)
Static IT_DESCONTO      := 10     //Valor do Desconto
Static IT_FRETE         := 11     //Valor do Frete
Static IT_DESPESA       := 12     //Valor das Despesas Acessorias
Static IT_SEGURO        := 13     //Valor do Seguro
Static IT_AUTONOMO      := 14     //Valor do Frete Autonomo
Static IT_VALMERC       := 15     //Valor da mercadoria
Static IT_PRODUTO       := 16     //Codigo do Produto
Static IT_TES           := 17     //Codigo da TES
Static IT_TOTAL         := 18     //Valor Total do Item
Static IT_CF            := 19     //Codigo Fiscal de Operacao
Static IT_FUNRURAL      := 20     //Aliquota para calculo do Funrural
Static IT_PERFUN        := 21     //Valor do Funrural do item
Static IT_DELETED       := 22     //Flag de controle para itens deletados
Static IT_LIVRO         := 23     //Array contendo o Demonstrativo Fiscal do Item
Static IT_ISS           := 24     //Array contendo os valores de ISS
#DEFINE IT_ALIQISS       24,01  //Aliquota de ISS do item
#DEFINE IT_BASEISS       24,02  //Base de Calculo do ISS
#DEFINE IT_VALISS        24,03  //Valor do ISS do item
#DEFINE IT_CODISS        24,04  //Codigo do ISS
#DEFINE IT_CALCISS       24,05  //Flag de controle para calculo do ISS
#DEFINE IT_RATEIOISS     24,06  //Flag de controle para calculo do ISS
#DEFINE IT_CFPS          24,07  //Codigo Fiscal de Prestacao de Servico
#DEFINE IT_PREDISS       24,08  //Redução da base de calculo do ISS
#DEFINE IT_VALISORI      24,09  //Valor do ISS do item sem aplicar o arredondamento
#DEFINE IT_ALISSOR       24,10  //Alíquota do ISS que seria utilizada caso houvesse ISS (utilizada em cálculo virtual, etc)
#DEFINE IT_ISSCPM        24,11  //Indica se o ISS é Bi tributado (concomitante) por exigência do CEPOM
Static IT_IR            := 25     //Array contendo os valores do Imposto de renda
#DEFINE IT_BASEIRR       25,01  //Base do Imposto de Renda do item
#DEFINE IT_REDIR         25,02  //Percentual de Reducao da Base de calculo do IR
#DEFINE IT_ALIQIRR       25,03  //Aliquota de Calculo do IR do Item
#DEFINE IT_VALIRR        25,04  //Valor do IR do Item
Static IT_INSS          := 26     //Array contendo os valores de INSS
#DEFINE IT_BASEINS       26,01  //Base de calculo do INSS
#DEFINE IT_REDINSS       26,02  //Percentual de Reducao da Base de Calculo do INSS
#DEFINE IT_ALIQINS       26,03  //Aliquota de Calculo do INSS
#DEFINE IT_VALINS        26,04  //Valor do INSS
#DEFINE IT_ACINSS        26,05  //Acumulo INSS
#DEFINE IT_SECP15        26,06  //Valor do serviço para contribuição previdenciária (INSS) especial em 15 anos
#DEFINE IT_BSCP15        26,07  //Base para contribuição previdenciária (INSS) especial em 15 anos
#DEFINE IT_ALCP15        26,08  //Alíquota para contribuição previdenciária (INSS) especial em 15 anos
#DEFINE IT_VLCP15        26,09  //Valor da contribuição previdenciária (INSS) especial em 15 anos
#DEFINE IT_SECP20        26,10  //Valor do serviço para contribuição previdenciária (INSS) especial em 20 anos
#DEFINE IT_BSCP20        26,11  //Base para contribuição previdenciária (INSS) especial em 20 anos
#DEFINE IT_ALCP20        26,12  //Alíquota para contribuição previdenciária (INSS) especial em 20 anos
#DEFINE IT_VLCP20        26,13  //Valor da contribuição previdenciária (INSS) especial em 20 anos
#DEFINE IT_SECP25        26,14  //Valor do serviço para contribuição previdenciária (INSS) especial em 25 anos
#DEFINE IT_BSCP25        26,15  //Base para contribuição previdenciária (INSS) especial em 25 anos
#DEFINE IT_ALCP25        26,16  //Alíquota para contribuição previdenciária (INSS) especial em 25 anos
#DEFINE IT_VLCP25        26,17  //Valor da contribuição previdenciária (INSS) especial em 25 anos
Static IT_VALEMB        := 27     //Valor da embalagem
Static IT_BASEIMP       := 28     //Array contendo as Bases de Impostos Variaveis
#DEFINE IT_BASEIV1       28,01  //Base de Impostos Variaveis 1
#DEFINE IT_BASEIV2       28,02  //Base de Impostos Variaveis 2
#DEFINE IT_BASEIV3       28,03  //Base de Impostos Variaveis 3
#DEFINE IT_BASEIV4       28,04  //Base de Impostos Variaveis 4
#DEFINE IT_BASEIV5       28,05  //Base de Impostos Variaveis 5
#DEFINE IT_BASEIV6       28,06  //Base de Impostos Variaveis 6
#DEFINE IT_BASEIV7       28,07  //Base de Impostos Variaveis 7
#DEFINE IT_BASEIV8       28,08  //Base de Impostos Variaveis 8
#DEFINE IT_BASEIV9       28,09  //Base de Impostos Variaveis 9
Static IT_ALIQIMP       := 29     //Array contendo as Aliquotas de Impostos Variaveis
#DEFINE IT_ALIQIV1       29,01  //Aliquota de Impostos Variaveis 1
#DEFINE IT_ALIQIV2       29,02  //Aliquota de Impostos Variaveis 2
#DEFINE IT_ALIQIV3       29,03  //Aliquota de Impostos Variaveis 3
#DEFINE IT_ALIQIV4       29,04  //Aliquota de Impostos Variaveis 4
#DEFINE IT_ALIQIV5       29,05  //Aliquota de Impostos Variaveis 5
#DEFINE IT_ALIQIV6       29,06  //Aliquota de Impostos Variaveis 6
#DEFINE IT_ALIQIV7       29,07  //Aliquota de Impostos Variaveis 7
#DEFINE IT_ALIQIV8       29,08  //Aliquota de Impostos Variaveis 8
#DEFINE IT_ALIQIV9       29,09  //Aliquota de Impostos Variaveis 9
Static IT_VALIMP        := 30     //Array contendo os valores de Impostos Agentina/Chile/Etc.
#DEFINE IT_VALIV1        30,01  //Valor do Imposto Variavel 1
#DEFINE IT_VALIV2        30,02  //Valor do Imposto Variavel 2
#DEFINE IT_VALIV3        30,03  //Valor do Imposto Variavel 3
#DEFINE IT_VALIV4        30,04  //Valor do Imposto Variavel 4
#DEFINE IT_VALIV5        30,05  //Valor do Imposto Variavel 5
#DEFINE IT_VALIV6        30,06  //Valor do Imposto Variavel 6
#DEFINE IT_VALIV7        30,07  //Valor do Imposto Variavel 7
#DEFINE IT_VALIV8        30,08  //Valor do Imposto Variavel 8
#DEFINE IT_VALIV9        30,09  //Valor do Imposto Variavel 9
Static IT_BASEDUP       := 31     //Base das duplicatas geradas no financeiro
Static IT_DESCZF        := 32     //Valor do desconto da Zona Franca do item
Static IT_DESCIV        := 33     //Array contendo a descricao dos Impostos Variaveis
#DEFINE IT_DESCIV1       33,1   //Array contendo a Descricao dos IV 1
#DEFINE IT_DESCIV2       33,2   //Array contendo a Descricao dos IV 2
#DEFINE IT_DESCIV3       33,3   //Array contendo a Descricao dos IV 3
#DEFINE IT_DESCIV4       33,4   //Array contendo a Descricao dos IV 4
#DEFINE IT_DESCIV5       33,5   //Array contendo a Descricao dos IV 5
#DEFINE IT_DESCIV6       33,6   //Array contendo a Descricao dos IV 6
#DEFINE IT_DESCIV7       33,7   //Array contendo a Descricao dos IV 7
#DEFINE IT_DESCIV8       33,8   //Array contendo a Descricao dos IV 8
#DEFINE IT_DESCIV9       33,9   //Array contendo a Descricao dos IV 9
Static IT_QUANT         := 34     //Quantidade do Item
Static IT_PRCUNI        := 35     //Preco Unitario do Item
Static IT_VIPIBICM      := 36     //Valor do IPI Incidente na Base de ICMS
Static IT_PESO          := 37     //Peso da mercadoria do item
Static IT_ICMFRETE      := 38     //Valor do ICMS Relativo ao Frete
Static IT_BSFRETE       := 39     //Base do ICMS Relativo ao Frete
Static IT_BASECOF       := 40     //Base de calculo do COFINS
Static IT_ALIQCOF       := 41     //Aliquota de calculo do COFINS
Static IT_VALCOF        := 42     //Valor do COFINS
Static IT_BASECSL       := 43     //Base de calculo do CSLL
Static IT_ALIQCSL       := 44     //Aliquota de calculo do CSLL
Static IT_VALCSL        := 45     //Valor do CSLL
Static IT_BASEPIS       := 46     //Base de calculo do PIS
Static IT_ALIQPIS       := 47     //Aliquota de calculo do PIS
Static IT_VALPIS        := 48     //Valor do PIS
Static IT_RECNOSB1      := 49     //RecNo do SB1
Static IT_RECNOSF4      := 50     //RecNo do SF4
Static IT_VNAGREG       := 51     //Valor da Mercadoria nao agregada.
Static IT_TIPONF        := 52     //Tipo da nota fiscal
Static IT_REMITO        := 53     //Remito
Static IT_BASEPS2       := 54     //Base de calculo do PIS 2
Static IT_ALIQPS2       := 55     //Aliquota de calculo do PIS 2
Static IT_VALPS2        := 56     //Valor do PIS 2
Static IT_BASECF2       := 57     //Base de calculo do COFINS 2
Static IT_ALIQCF2       := 58     //Aliquota de calculo do COFINS 2
Static IT_VALCF2        := 59     //Valor do COFINS 2
Static IT_ABVLINSS      := 60     //Abatimento da base do INSS em valor
Static IT_ABVLISS       := 61     //Abatimento da base do ISS em valor
Static IT_REDISS        := 62     //Percentual de reducao de base do ISS ( opcional, utilizar normalmente TS_BASEISS )
Static IT_ICMSDIF       := 63     //Valor do ICMS diferido
Static IT_DESCZFPIS     := 64     //Desconto do PIS
Static IT_DESCZFCOF     := 65     //Desconto do Cofins
Static IT_BASEAFRMM     := 66     //Base de calculo do AFRMM ( Item )
Static IT_ALIQAFRMM     := 67     //Aliquota de calculo do AFRMM ( Item )
Static IT_VALAFRMM      := 68     //Valor do AFRMM ( Item )
Static IT_PIS252        := 69     //Decreto 252 de 15/06/2005 - PIS no item para retencao aquisicao a aquisicao - sem considerar R# 5.000,00 da Lei 10925
Static IT_COF252        := 70     //Decreto 252 de 15/06/2005 - COFINS no item para retencao aquisicao a aquisicao - sem considerar R# 5.000,00 da Lei 10925
Static IT_CRDZFM        := 71     //Credito Presumido - Zona Franca de Manaus
Static IT_CNAE          := 72     //Codigo da Atividade Economica da Prestacao de Servicos
Static IT_ITEM          := 73     //Numero Item
Static IT_SEST          := 74     //Array contendo os valores do SEST
#DEFINE IT_BASESES       74,01  //Base de calculo do SEST
#DEFINE IT_ALIQSES       74,02  //Aliquota de calculo do SEST
#DEFINE IT_VALSES        74,03  //Valor do INSS
Static IT_BASEPS3      :=  75     //Base de calculo do PIS Subst. Tributaria
Static IT_ALIQPS3      :=  76     //Aliquota de calculo do PIS Subst. Tributaria
Static IT_VALPS3       :=  77     //Valor do PIS Subst. Tributaria
Static IT_BASECF3      :=  78     //Base de calculo da COFINS Subst. Tributaria
Static IT_ALIQCF3      :=  79     //Aliquota de calculo da COFINS Subst. Tributaria
Static IT_VALCF3       :=  80     //Valor da COFINS Subst. Tributaria
Static IT_VLR_FRT      :=  81     //Valor do Frete de Pauta
Static IT_BASEFET      :=  82     //Base do Fethab
Static IT_ALIQFET      :=  83     //Aliquota do Fethab
Static IT_VALFET       :=  84     //Valor do Fethab
Static IT_ABSCINS      :=  85     //Abatimento do Valor do INSS em Valor - SubContratada
Static IT_SPED         :=  86     //SPED
Static IT_ABMATISS     :=  87     //Abatimento da base do ISS em valor referente a material utilizado
Static IT_RGESPST      :=  88     //Indica se a operacao, mesmo sem calculo de ICMS ST, faz parte do Regime Especial de Substituicao Tributaria
Static IT_PRFDSUL      :=  89     //Percentual de UFERMS para o calculo do Fundersul - Mato Grosso do Sul
Static IT_UFERMS       :=  90     //Valor da UFERMS para o calculo do Fundersul - Mato Grosso do Sul
Static IT_VALFDS       :=  91     //Valor do Fundersul - Mato Grosso do Sul
Static IT_ESTCRED      :=  92     //Valor do Estorno de Credito/Debito
Static IT_CODIF        :=  93     //Codigo de autorizacao CODIF - Combustiveis
Static IT_BASETST      :=  94     //Base do ICMS de transporte Substituicao Tributaria
Static IT_ALIQTST      :=  95     //Aliquota do ICMS de transporte Substituicao Tributaria
Static IT_VALTST       :=  96     //Valor do ICMS de transporte Substituicao Tributaria
Static IT_CRPRSIM      :=  97     //Valor Crédito Presumido Simples Nacional - SC, nas aquisições de fornecedores que se enquadram no simples
Static IT_VALANTI      :=  98     //Valor Antecipacao ICMS
Static IT_DESNTRB      :=  99     //Despesas Acessorias nao tributadas - Portugal
Static IT_TARA         := 100     //Tara - despesas com embalagem do transporte - Portugal
Static IT_PROVENT      := 101     //Provincia de entrega
Static IT_VALFECP      := 102     //Valor do FECP
Static IT_VFECPST      := 103     //Valor do FECP ST
Static IT_ALIQFECP     := 104     //Aliquota FECP
Static IT_CRPRESC      := 105     //Credito Presumido SC
Static IT_DESCPRO      := 106     //Valor do desconto total proporcionalizado
Static IT_ANFORI2      := 107     //IVA Ajustado
#DEFINE IT_UFORI        107,01  //UF Original da Nota de Entrada para o calculo do IVA Ajustado( Opcional )
#DEFINE IT_ALQORI       107,02  //Aliquota Original da Nota de Entrada para o calculo do IVA Ajustado ( Opcional )
#DEFINE IT_PROPOR       107,03  //Quantidade proporcional na venda para o calculo do IVA Ajustado( Opcional )
#DEFINE IT_ALQPROR      107,04  //Aliquota proporcional na venda para o calculo do IVA Ajustado( Opcional )
Static IT_ANFII        := 108     //Array contendo os valores do Imposto de Importação
#DEFINE IT_ALIQII       108,01  //Aliquota do Imposto de Importação
#DEFINE IT_VALII        108,02  //Valor do Imposto de Importação (Digitado direto na Nota Fiscal)
Static IT_PAUTPIS      := 109     //Valor da Pauta do PIS
Static IT_PAUTCOF      := 110     //Valor da Pauta do Cofins
Static IT_ALIQDIF      := 111     //Aliquota interna do estado para calculo do Diferencial de aliquota do Simples Nacional
Static IT_CLASFIS      := 112     //Valor do Imposto de Importação (Digitado direto na Nota Fiscal)
Static IT_VLRISC       := 113     //Valor do imposto ISC (Localizado Peru) por unidade  "PER"
Static IT_CRPREPE      := 114     //Credito Presumido - Art. 6 Decreto  n28.247
Static IT_CRPREMG      := 115     //Credito Presumido MG
Static IT_SLDDEP       := 116     //Valor de desconto de depedendente fornecedor
Static IT_CRPRECE      := 117     //Credito Presumido Ceara
Static IT_BASEFAB      := 118     //Base do FABOV - Mato Grosso
Static IT_ALIQFAB      := 119     //Aliquota do FABOV - Mato Grosso
Static IT_VALFAB       := 120     //Valor do FABOV - Mato Grosso
Static IT_BASEFAC      := 121     //Base do FACS - Mato Grosso
Static IT_ALIQFAC      := 122     //Aliquota do FACS - Mato Grosso
Static IT_VALFAC       := 123     //Valor do FACS - Mato Grosso
Static IT_VALFUM       := 124     //Valor do FUMACOP
Static IT_ALIQFUM      := 125     //Aliquota FUMACOP
Static IT_CONCEPT      := 126     //Concepto de Retencao - Equador
Static IT_MOTICMS      := 127     //moticms
Static IT_ALSENAR      := 128     //Aliquota SENAR
Static IT_VLSENAR      := 129     //Valor do Senar
Static IT_BSSENAR      := 130     //Base de Calculo do Senar
Static IT_CROUTSP      := 131     //Cr    edito Outorgado SP - Decreto 56.018/2010
Static IT_AVLINSS      := 132     //Abatimento do valor do INSS Subcontratada
Static IT_BSSEMDS      := 133     //Base do ICMS sem desconto - Decreto 43.080/2002 RICMS-MG
Static IT_ICSEMDS      := 134     //Valor do ICMS sem desconto - Decreto 43.080/2002 RICMS-MG
Static IT_PR43080      := 135     //Percentual de Reducao - Decreto 43.080/2002 RICMS-MG
Static IT_BASEFUN      := 136     //Valor da Base do FUNRURAL
Static IT_BASVEIC      := 137     //Valor da Base Veiculos
#DEFINE IT_BASRESI      138,01  //Valor da Base ICMS ST nas operacoes substituidos do MT.
#DEFINE IT_VALRESI      138,02  //Valor do Valor ICMS ST nas operacoes substituidos do MT.
#DEFINE IT_ALQRESI      138,03  //Valor da Aliquota ICMS ST nas operacoes substituidos do MT.
Static IT_BASEFUM      := 139     //Valor da Base do FUMACOP
Static IT_CRPREPR      := 140     //Valor do Credito Presumido - PR - RICMS - (Art. 4) - Anexo III.
#DEFINE IT_TABNTRE      141,01  //Tabela Natureza da Receita
#DEFINE IT_CODNTRE      141,02  //Codigo Natureza da Receita
#DEFINE IT_GRPNTRE      141,03  //Grupo Natureza da Receita
#DEFINE IT_DATNTRE      141,04  //Data Final Natureza da Receita
#DEFINE IT_ALITPDP      142,01  // Aliquota da TPDP - Paraiba.
#DEFINE IT_BASTPDP      142,02  // Base de Calculo da TPDP - Paraiba.
#DEFINE IT_VALTPDP      142,03  // Valor da TPDP - Paraiba.
Static IT_VLINCMG      := 143     //Valor do incentivo prod.leite RICMS-MG
Static IT_PRINCMG      := 144     //Percentual de incentivo prod.leite artigo 207-B RICMS-MG
Static IT_INSSAD       := 145     //Array contendo os valores de INSS Condições Especiais
#DEFINE IT_BASEINA      145,01  //Base de calculo do INSS Condições Especiais
#DEFINE IT_ALIQINA      145,02  //Aliquota de Calculo do INSS Condições Especiais
#DEFINE IT_VALINA       145,03  //Valor do INSS Condições Especiais
Static IT_VFECPRN      := 146     //Valor do FECOP-RN
Static IT_VFESTRN      := 147     //Valor do FECOP ST-RN
Static IT_ALFECRN      := 148     //Aliquota FECOP-RN
Static IT_VLRFUE       := 149     //Valor do FUE - localização Austrália
Static IT_METODO       := 150     //Método utilizado cálculo FUE - localização Austrália
Static IT_NORESPE      := 151     //NF. Emitida sob Norma Específica
Static IT_COEPSST      := 152     //151 - Coeficiente de PIS por Substituição Tributária para fabricantes de cigarros
Static IT_COECFST      := 153     //152 - Coeficiente de COFINS por Substituição Tributária para fabricantes de cigarros
Static IT_CREDPRE      := 154     //154 - Credito Presumido RS
Static IT_PRCUNIC      := 155     //155 - Preco Unitario utilizado para calculo da Substituição tributária para fabrixante de Cigarros/
Static IT_RANTSPD      := 156     //156 - Recolhimento Antecipado - Para atender necessidades do SPEDFISCAL de MG
Static IT_VFECPMG      := 157     //Valor do FECP-MG
Static IT_VFESTMG      := 158     //Valor do FECP ST-MG
Static IT_ALFECMG      := 159     //Aliquota FECP-MG
Static IT_VREINT       := 160     //Valor de Reintegra
Static IT_BSREIN       := 161     //Base de Calculo do Reintegra
Static IT_VALCMAJ      := 162     //Valor da COFINS de Importacao Majorada.
Static IT_ALQCMAJ      := 163     //Aliquota da COFINS de Importacao Majorada.
Static IT_VFECPMT      := 164     //Valor do FECP-MT
Static IT_VFESTMT      := 165     //Valor do FECP ST-MT
Static IT_ALFECMT      := 166     //Aliquota FECP-MT
#DEFINE IT_LOTE         167,01  //Lote do Produto
#DEFINE IT_SUBLOTE      167,02  //Lote do Produto
Static IT_B1DIAT       := 168     //DIAT-SC
Static IT_CPDIFST      := 169     //Campo de diferimento na tabela SB1 - Conteudo do parametro MV_ALQDFB1
Static IT_CPPERST      := 170     //Campo Indica o % calculo do ICMS-ST tabela SB1 - Conteudo do parametro MV_B1PTST
Static IT_RSATIVO      := 171     //Indica Rastro ativo do IPI - B1_RSATIVO
Static IT_POSIPI       := 172     // Nomenclatura Ext.Mercosul - B1_POSIPI
Static IT_B1UM         := 173
Static IT_B1SEGUM      := 174
Static IT_AFABOV       := 175
Static IT_AFACS        := 176
Static IT_AFETHAB      := 177
Static IT_TFETHAB      := 178
Static IT_EXCEFAT      := 179     //Array da excessao fiscal do Cliente de Faturamento
Static IT_ADIANT       := 180     //Adiantamentos Mexico
Static IT_NATOPER      := 181     //Codigo da Natureza da Operacao/Prestacao
Static IT_PRD          := 182     //Array com os Dados do cadastro de produtos ( SB1 ou SBi ou SBZ )
#DEFINE IT_IDSF4        183,01  // ID Historico SF4
#DEFINE IT_IDSF7        183,02  // ID Historico SF7
#DEFINE IT_IDSA1        183,03  // ID Historico SA1
#DEFINE IT_IDSA2        183,04  // ID Historico SA2
#DEFINE IT_IDSB1        183,05  // ID Historico SB1
#DEFINE IT_IDSB5        183,06  // ID Historico SB5
#DEFINE IT_IDSBZ        183,07  // ID Historico SBZ
#DEFINE IT_IDSED        183,08  // ID Historico SED
#DEFINE IT_IDSFB        183,09  // ID Historico SFB
#DEFINE IT_IDSFC        183,10  // ID Historico SFC
#DEFINE IT_IDCFC        183,11  // ID Historico CFC
Static IT_DESCTOT      := 184     // Referencia de Desconto por Item - USO DO NOVO PDV - LOJA
Static IT_ACRESCI      := 185     // Referencia de Acrescimo por Item - USO DO NOVO PDV - LOJA
Static IT_VALPMAJ      := 186     //Valor da PIS de Importacao Majorada.
Static IT_ALQPMAJ      := 187     //Aliquota da PIS de Importacao Majorada.
Static IT_PRDFIS       := 188     // Identificação do produto fiscal
Static IT_RECPRDF      := 189     // Recno do produto fiscal
Static IT_NCMFIS       := 190     // Identificação do NCM secundario (produto fiscal)
Static IT_UFXPROD      := 191     // Array com conteudo da tabela CFC (por produto)
Static IT_VALCIDE      := 192     // Valor Cide
Static IT_CV139        := 193     // Identificação do tratamento do convênio 139/06.
Static IT_VALFETR      := 194     // Valor do FETHAB de algodão retido pelo cliente.
Static IT_ALFCST       := 195     // Aliquota do FECP ST
Static IT_ALFCCMP      := 196     // Aliquota do FECP Complementar (Diferencial de aliquotas/Antecipacao)
Static IT_BASNDES      := 197
Static IT_ICMNDES      := 198
Static IT_ADIANTTOT    := 199     // Adiantamento (Peru)
Static IT_UVLRC        := 200
Static IT_PRCCF        := 201     // Identifica o preço para Consumidor Final
Static IT_BASECID      := 202     //Base de cálculo cide
Static IT_ALQCIDE      := 203     //Aliquota Cide
Static IT_BASECPM      := 204     //Base do ISS CEPOM
Static IT_VALCPM       := 205     // Valor do ISS CEPOM
Static IT_ALQCPM       := 206     // Aliquota do ISS CEPOM
Static IT_IPIVFCF      := 207     //Valor IPI a ser inserido na base do ICM, venda futura CF
Static IT_BASEFMP      := 208     //Base Fumipeq
Static IT_VALFMP       := 209     //Valor Fumipeq
Static IT_ALQFMP       := 210     //Aliquota Fumipeq
Static IT_BASEFMD      := 211     //Base FAMAD
Static IT_VALFMD       := 212     //Valor FAMAD
Static IT_ALQFMD       := 213     // Alíquota FAMAD
Static IT_TS           := 214     // Array com as informacoes da TES.
Static IT_PAUTAPS      := 215
Static IT_PAUTACF      := 216
Static IT_GRPCST       := 217     //Enquadramento IPI
Static IT_CEST         := 218     //CEST
Static IT_BASECPB      := 219     //Base do CPRB
Static IT_VALCPB       := 220     // Valor do CPRB
Static IT_ALIQCPB      := 221     // Aliquota do CPRB
Static IT_ATIVCPB      := 222     // Código atividade CPRB
Static IT_DIFAL        := 223     //DIFAL icms
Static IT_PDDES        := 224
Static IT_PDORI        := 225
Static IT_VFCPDIF      := 226     //Valor FECP DIFAL
Static IT_FTRICMS      := 227     //Fator de Redução Desc.ICMS
Static IT_VRDICMS      := 228     //Valor de Redução Desc.ICMS
Static IT_BASFUND      := 229     //Base do FUNDESA
Static IT_ALIFUND      := 230     //Aliquota do FUNDESA
Static IT_VALFUND      := 231     //Valor do FUNDESA
Static IT_BASIMA       := 232     //Base do IMA-MT
Static IT_ALIIMA       := 233     //Aliquota do IMA-MT
Static IT_VALIMA       := 234     //Valor do IMA-MT
Static IT_AIMAMT       := 235     //Alíquota IMA-MT (SB1)
Static IT_VLIMAR       := 236     //Valor do IMA-MT retido pelo cliente.
Static IT_BASFASE      := 237     //Base do FASE-MT
Static IT_ALIFASE      := 238     //Aliquota do FASE-MT
Static IT_VALFASE      := 239     //Valor do FASE-MT
Static IT_AFASEMT      := 240     //Alíquota FASE-MT (SB1)
Static IT_VLFASER      := 241     //Valor do FASE-MT retido pelo cliente.
Static IT_PRCMEDP      := 242     //Preço Médio Ponderado, para ser utilizado como base de ICMS ST
Static IT_INDICE       := 243     //Indice tabela F0R
Static IT_VALPEDG      := 244     //Valor do Pedágio, informado pela rotina MATA116.
Static IT_VLSLXML      := 245     // Valor Solidario XML
Static IT_VLRCID       := 246     //Pauta CIDE
Static IT_CSOSN        := 247     //CSOSN
Static IT_BASEINP      := 248     //Base do INSS Patronal
Static IT_PERCINP      := 249     //Percentual do INSS Patronal
Static IT_VALINP       := 250     //Valor do INSS Patronal
Static IT_TRIBMU       := 251     // Código de Trib. Municipal
Static IT_AFRMIMP      := 252     // Valor do AFRMM na Importação
Static IT_CPRESPR      := 253     // Valor do Credito Presumido Paraná
Static IT_DS43080      := 254     //Valor do desconto - Decreto 43.080/2002 RICMS-MG
Static IT_VOPDIF       := 255     //Valor do ICMS da Operação - Sem diferimento (Valor como se não tivesse o diferimento)
Static IT_BASEPRO      := 256     //Base PROTEGE-GO
Static IT_ALIQPRO      := 257     //Aliquota PROTEGE-GO
Static IT_VALPRO       := 258     //Valor PROTEGE-GO
Static IT_BASFEEF      := 259     //Base FEEF-RJ
Static IT_ALQFEEF      := 260     //Aliquota FEEF-RJ
Static IT_VALFEEF      := 261     //Valor FEEF-RJ
Static IT_CODATIV      := 262     //Código de Atividade
Static IT_COLVDIF      := 263     //Coluna onde será escriturada a parcela diferida, na coluna Outros ou Isentod
Static IT_BFCPANT      := 264     // Base do FCP recolhido anteriormente.
Static IT_AFCPANT      := 265     // Aliquota do FCP recolhido anteriormente.
Static IT_VFCPANT      := 266     // Valor do FCP recolhido anteriormente.
Static IT_ALQNDES      := 267     // Aliquota ICMS ST Recolh. Ant.
Static IT_BASFECP      := 268     // Base do FECP - Proprio.
Static IT_BSFCPST      := 269     // Base do FECP - ST.
Static IT_BSFCCMP      := 270     // Base do FECP - Complementar.
Static IT_FCPAUX       := 271     // Indice auxiliar do FCP.
Static IT_CPPRODE      := 272     // Crédito Presumido Prodepe PE
Static IT_CTAREC       := 273     // Conta Contábil de Receita
Static IT_VICMBRT      := 274     // valor do ICMS antes de ser submetido ao arredondamento
Static IT_CODDECL      := 275     // Código declaratorio
Static IT_TRIBGEN      := 276     // Tributos genéricos calculados pelo motor
Static IT_ID_TRBGEN    := 277     // Id do tributo genérico, gerado automaticamente pela MATXFIS nas inclusões de notas
Static IT_ID_LOAD_TRBGEN := 278   // Id do tributo genérico para visualização e exclusão, este deverá vir de "fora" da MATXFIS
Static IT_TPOPER       := 279     // Tipo de Operação
Static IT_VIPIORI      := 280     // Valor IPI Origem para Orgãos Publicos
Static IT_BICEFET      := 281     // Valor Base ICMS EFETIVO
Static IT_PICEFET      := 282     // Valor ALIQ ICMS EFETIVO
Static IT_VICEFET      := 283     // Valor ICMS EFETIVO
Static IT_RICEFET      := 284     // Percentual da Redução do ICMS Efetivo
Static IT_BSTANT       := 285     // Valor Base ICMS Retido Anteriormente na saída
Static IT_PSTANT       := 286     // Percentual ICMS Retido Anteriormente na saída
Static IT_VSTANT       := 287     // Valor do ICMS Retido Anteriormente na saída
Static IT_VICPRST      := 288     // Valor do ICMS Próprio do Substituto
Static IT_RESSARC      := 289     // Array com informações das últimas notas fiscais de entradas
Static IT_BFCANTS      := 290     // Base de cálculo do FECP ST recolhido anteriormente através da média ponderada das últimas aquicoes
Static IT_PFCANTS      := 291     // Percentual do FECP ST recolhido anteriormente através da média ponderada das últimas aquicoes
Static IT_VFCANTS      := 292     // Valor FECP ST recolhido anteriormente através da média ponderada das últimas aquicoes
Static IT_ICMDESONE    := 293     // Valor do ICMS Desonerado Próprio
Static IT_ICMDESST     := 294     // Valor do ICMS Desonerado ST
Static IT_TOTEFET      := 295     // Valor Total considerado para calcular ICMS Efetivo
Static IT_QTDORI       := 296     // Quantidade de itens  devolvidos
Static IT_DESCFIS      := 297     // Descontos Fiscais de impostos
Static IT_ALANTICMS    := 298     // Aliquota da antecipacao de ICMS - Proprio
Static IT_CDDECL_AJU   := 299     // Array com informações do último enquadramento caso tenha codigo valor declaratorio e codigo de ajuste
Static IT_PERCVENXPMC  := 300     // Cálcula o percentual do valor da operação com relação ao valor de pauta do produto, cadastrado no campo B1_VLR_ICM
#DEFINE IT_VALMERC_C1   := 301     // Goods Value in main currency
#DEFINE IT_BASEIMP_C1   := 302     // Tax calculation base in main currency
#DEFINE IT_BASEIV1_C1   302,01  //Base de Impostos Variaveis 1
#DEFINE IT_BASEIV2_C1   302,02  //Base de Impostos Variaveis 2
#DEFINE IT_BASEIV3_C1   302,03  //Base de Impostos Variaveis 3
#DEFINE IT_BASEIV4_C1   302,04  //Base de Impostos Variaveis 4
#DEFINE IT_BASEIV5_C1   302,05  //Base de Impostos Variaveis 5
#DEFINE IT_BASEIV6_C1   302,06  //Base de Impostos Variaveis 6
#DEFINE IT_BASEIV7_C1   302,07  //Base de Impostos Variaveis 7
#DEFINE IT_BASEIV8_C1   302,08  //Base de Impostos Variaveis 8
#DEFINE IT_BASEIV9_C1   302,09  //Base de Impostos Variaveis 9
Static IT_VALIMP_C1    := 303     //Value of Tax in main currency
#DEFINE IT_VALIV1_C1    303,01  //Valor do Imposto Variavel 1
#DEFINE IT_VALIV2_C1    303,02  //Valor do Imposto Variavel 2
#DEFINE IT_VALIV3_C1    303,03  //Valor do Imposto Variavel 3
#DEFINE IT_VALIV4_C1    303,04  //Valor do Imposto Variavel 4
#DEFINE IT_VALIV5_C1    303,05  //Valor do Imposto Variavel 5
#DEFINE IT_VALIV6_C1    303,06  //Valor do Imposto Variavel 6
#DEFINE IT_VALIV7_C1    303,07  //Valor do Imposto Variavel 7
#DEFINE IT_VALIV8_C1    303,08  //Valor do Imposto Variavel 8
#DEFINE IT_VALIV9_C1    303,09  //Valor do Imposto Variavel 9
Static IT_TOTAL_C1     := 304     //Grand Total in main currency


Static LF_CFO           := 01    // Codigo Fiscal
Static LF_ALIQICMS      := 02    // Aliquota de ICMS
Static LF_VALCONT       := 03    // Valor Contabil
Static LF_BASEICM       := 04    // Base de ICMS
Static LF_VALICM        := 05    // Valor do ICMS
Static LF_ISENICM       := 06    // ICMS Isento
Static LF_OUTRICM       := 07    // ICMS Outros
Static LF_BASEIPI       := 08    // Base de IPI
Static LF_VALIPI        := 09    // IPI Tributado
Static LF_ISENIPI       := 10    // IPI Isento
Static LF_OUTRIPI       := 11    // IPI Outros
Static LF_OBSERV        := 12    // Observacao
Static LF_VALOBSE       := 13    // Valor na Observacao
Static LF_ICMSRET       := 14    // Valor ICMS Retido
Static LF_LANCAM        := 15    // Numero do Lancamento
Static LF_TIPO          := 16    // Tipo de Lancamento
Static LF_ICMSCOMP      := 17    // ICMS Complementar
Static LF_CODISS        := 18    // Cod.Serv. ISS
Static LF_IPIOBS        := 19    // IPI na Observacao
Static LF_NFLIVRO       := 20    // Numero do Livro
Static LF_ICMAUTO       := 21    // ICMS Frete Autonomo
Static LF_BASERET       := 22    // Base do ICMS Retido
Static LF_FORMUL        := 23    // Flag de Fom. Proprio
Static LF_FORMULA       := 24    // Formula
Static LF_DESPESA       := 25    // Despesas Acessorias
Static LF_ICMSDIF       := 26    // Icms Diferido
Static LF_TRFICM        := 27    // Transferencia de Debito e Credito
Static LF_OBSICM        := 28    // Icms na coluna de observacoes
Static LF_OBSSOL        := 29    // Solidario na coluna de observacoes
Static LF_SOLTRIB       := 30    // Valor do ICMS Solidario que possui tributacao com credito de imposto
Static LF_CFOEXT        := 31    // Codigo Fiscal Extendido
Static LF_ISSST         := 32    // Codigo Fiscal Extendido
Static LF_RECISS        := 33    // Codigo Fiscal Extendido
Static LF_ISSSUB        := 34    // ISS de Sub-empreitada.
#DEFINE LF_ISS_ALIQICMS  35,01 // Aliquota de ICMS
#DEFINE LF_ISS_ISENICM   35,02 // ICMS Isento
#DEFINE LF_ISS_OUTRICM   35,03 // ICMS Outros
#DEFINE LF_ISS_ISENIPI   35,04 // IPI Isento
#DEFINE LF_ISS_OUTRIPI   35,05 // IPI Outros
Static LF_CREDST        := 36    // Credito / Debito Substituição tributária.
Static LF_CRDEST        := 37    // Credito Estimulo de Manaus
Static LF_CRDPRES       := 38    // Credito Presumido
Static LF_SIMPLES       := 39    // Valor do ICMS para clientes optantes pelo Simples - SC
Static LF_CRDTRAN       := 40    // Credito Presumido - RJ - Prestacoes de Servicos de Transporte
Static LF_CRDZFM        := 41    // Credito Presumido - Zona Franca de Manaus
Static LF_CNAE          := 42    // Codigo da Atividade Economica da Prestacao de Servicos
Static LF_IDENT         := 43    // Identificador de gravacao
Static LF_CLASFIS       := 44    //Classificacao fiscal de acordo com o F4_SITTRIB + B1_ORIGEM
Static LF_CTIPI         := 45    //Codigo de Situacao tributaria do IPI
Static LF_ESTOQUE       := 46    //Movimentacao fisica do estoque
Static LF_DESPIPI       := 47    //IPI sobre despesas acessorias
Static LF_POSIPI        := 48    //NCM Produto
Static LF_OUTRRET       := 49    //ICMS Retido escriturado coluna Outros
Static LF_ISENRET       := 50    //ICMS Retido escriturado coluna Isento
Static LF_ITEMORI       := 51    //Numero Item da NF Ori
Static LF_CFPS          := 52    //Codigo Fiscal de Prestacao de Servicos
Static LF_ALIQIPI       := 53    //Aliquota de IPI
Static LF_CRPRST        := 54    //valor Credito Presumido Substituicao Tributaria retido pelo contratante do servico de transporte - Decreto 44.147/2005 (MG)
                               //   - Decreto 44.147/2005 (MG)
                               //   - Decreto 20.686, Art 111, $6 em diante. (AM)
Static LF_TRIBRET       := 55    //ICMS Retido escriturado coluna Tributado
Static LF_DESCZFR       := 56    //Desconto Zona Franca de Manaus
Static LF_BASEPS3       := 57    //Base PIS Subst. Tributaria
Static LF_ALIQPS3       := 58    //Aliquota do PIS Subst. Tributaria
Static LF_VALPS3        := 59    //Valor do PIS Subst. Tributaria
Static LF_BASECF3       := 60    //Base da Cofins Subst. Tributaria
Static LF_ALIQCF3       := 61    //Aliquota da da Cofins Subst. Tributaria
Static LF_VALCF3        := 62    //Valor da da Cofins Subst. Tributaria
Static LF_CRPRELE       := 63    //Valor Crédito Presumido nas operações de Saída com o ICMS destacado sobre os produtos resultantes da industrialização com componentes, partes e pecas recebidos do exterior, destinados a fabricacao de produtos de informatica, eletronicos e telecomunicacoes, por estabelecimento industrial desses setores. Tratamento conforme Art. 1?do DECRETO 4.316 de 19 de Junho de 1995.(BA)
Static LF_ISSMAT        := 64    //Valor da deducao da base de calculo do ISS referente ao material aplicado
Static LF_VALFDS        := 65    //Valor do Fundersul - Mato Grosso do Sul
Static LF_ESTCRED       := 66    //Valor do Estorno de Credito/Debito
Static LF_CRPRSIM       := 67    //Valor Crédito Presumido Simples Nacional - SC, nas aquisições de fornecedores que se enquadram no simples
Static LF_BASETST       := 68    //Base do ICMS de transporte Substituicao Tributaria
Static LF_VALTST        := 69    //Valor do ICMS de transporte Substituicao Tributaria
Static LF_ANTICMS       := 70    //Indica se a operacao se refere a Antecipacao Tribut. de ICMS (1=Sim/2=Nao)
Static LF_VALANTI       := 71    //Valor Antecipacao ICMS
Static LF_CRPREPR       := 72    // Credito Presumido - RICMS (Art.4) - Anexo III
Static LF_VALFECP       := 73    //Valor FECP
Static LF_VFECPST       := 74    //Valor FECP ST
Static LF_CSTPIS        := 75    //Codigo de Situacao tributaria do PIS
Static LF_CSTCOF        := 76    //Codigo de Situacao tributaria do COFINS
Static LF_CREDACU       := 77    //Indicacao do Credito Acumulado de ICMS - Bahia
Static LF_CRPRERO       := 78    //Credito Presumido - RICMS (Art.39) - Anexo IV
Static LF_VALII         := 79    //Valor do Imposto de Importacao (PIS/COFINS)
Static LF_CRPREPE       := 80    //Credito Presumido - Art. 6 Decreto  n28.247
Static LF_CSTISS        := 81    //Classificacao fiscal de acordo com o F4_CSTISS
Static LF_CPRESPR       := 82    //Credito Presumido art 631-A do RICMS/2008 - PR
Static LF_VALFET        := 83    //Valor do FACS - Mato Grosso
Static LF_VALFAB        := 84    //Valor do FABOV - Mato Grosso
Static LF_VALFAC        := 85    //Valor do FACS - Mato Grosso
Static LF_CRPRESP       := 86     //Credito Presumido - Decreto 52.586 de 28.12.2007
Static LF_VALFUM        := 87    //Valor FUMACOP
Static LF_MOTICMS       := 88     // Codigo Fiscal Extendido
Static LF_VLSENAR       := 89    //Valor do Senar
Static LF_CROUTSP       := 90    //Credito Outorgado SP - Decreto 56.018/2010
Static LF_DS43080       := 91    //Valor do desconto - Decreto 43.080/2002 RICMS-MG
Static LF_VL43080       := 92    //Valor do ICMS sem debito de imposto - Decreto 43.080/2002 RICMS-MG
Static LF_CPPRODE       := 93    // PRODEPE
Static LF_TPPRODE       := 94    // PRODEPE
Static LF_CODBCC        := 95    //Codigo da base de calculo do credito
Static LF_INDNTFR       := 96    //Indicador da natureza do frete contratado
Static LF_TABNTRE       := 97    //Tabela Natureza da Receita
Static LF_CODNTRE       := 98    //Codigo Natureza da Receita
Static LF_GRPNTRE       := 99    //Grupo Natureza da Receita
Static LF_DATNTRE       := 100    //Data Final Natureza da Receita
Static LF_VALTPDP       := 101    //Valor do TPDP PB
Static LF_VFECPRN       := 102    //Valor FECOP-RN
Static LF_VFESTRN       := 103    //Valor FECOP ST-RN
Static LF_CROUTGO       := 104    //Valor Credito Outorgado GO
Static LF_CRDPCTR       := 105    //Valor Credito Presumido utilizando percentual da carga tributária
Static LF_CREDPRE       := 106    //Credito Presumido RS
Static LF_VFECPMG       := 107    //Valor FECP-MG
Static LF_VFESTMG       := 108    //Valor FECP ST-MG
Static LF_VREINT        := 109    //Valor de Reintegra
Static LF_BSREIN        := 110    //Base de Calculo do Reintegra
Static LF_VALCMAJ       := 111    //Valor da COFINS de Importacao Majorada.
Static LF_ALQCMAJ       := 112    //Aliquota da COFINS de Importacao Majorada.
Static LF_VFECPMT       := 113    //Valor FECP-MT
Static LF_VFESTMT       := 114    //Valor FECP ST-MT
Static LF_VALPMAJ       := 115    //Valor da PIS de Importacao Majorada.
Static LF_ALQPMAJ       := 116     //Aliquota da PIS de Importacao Majora
Static LF_BASECPM       := 117 //Base do ISS CEPOM
Static LF_ALQCPM        := 118     // Valor do ISS CEPOM
Static LF_VALCPM        := 119     // Aliquota do ISS CEPOM
Static LF_BASEFMP       := 120 //Base do FUMIPEQ
Static LF_VALFMP        := 121     // Valor do FUMIPEQ
Static LF_ALQFMP        := 122     // Aliquota do FUMIPEQ
Static LF_VALFMD        := 123     //Valor FAMAD
Static LF_BASNDES       := 124 //Base ICMS ST Recolh. Ant.
Static LF_ICMNDES       := 125 //Valor ICMS ST Recolhido Anteriormente.
Static LF_BASECPB       := 126     //Base do CPRB
Static LF_VALCPB        := 127     //Valor do CPRB
Static LF_ALIQCPB       := 128     //Aliquota do CPRB
Static LF_DIFAL         := 129
Static LF_VFCPDIF       := 130     // Valor FECP DIFAL
Static LF_BASEDES       := 131     // Base Difal Destino
Static LF_BSICMOR       := 132     // Base ICMS original
Static LF_VALFUND       := 133 //Valor do FUNDESA
Static LF_VALIMA        := 134 //Valor do IMA-MT
Static LF_VALFASE       := 135 //Valor do FASE-MT
Static LF_PRCMEDP       := 136 //Preço Médio Ponderado, para ser utilizado como base de ICMS ST
Static LF_VALPEDG       := 137    //Valor do Pedágio, informado pela rotina MATA116.
Static LF_CSOSN         := 138    //CSOSN
Static LF_BASEINP       := 139     //Base do INSS Patronal
Static LF_PERCINP       := 140     //Percentual do INSS Patronal
Static LF_VALINP        := 141     //Valor do INSS Patronal
Static LF_TRIBMU        := 142     //Código de Trib. Municipal
Static LF_AFRMIMP       := 143     //Valor do AFRMM na Importação
Static LF_VOPDIF        := 144     //Valor do ICMS da Operação - Sem diferimento (Valor como se não tivesse o diferimento)
Static LF_CLIDEST       := 145     // Cliente de destino do CTE.
Static LF_LOJDEST       := 146     // Loja do cliente de destino do CTE.
Static LF_BFCPANT       := 147     // Base do FCP recolhido anteriormente.
Static LF_AFCPANT       := 148     // Alíquota do FCP recolhido anteriormente.
Static LF_VFCPANT       := 149     // Valor do FCP recolhido anteriormente.
Static LF_ALQNDES       := 150     // Alíquota do ICMS ST anterior não calculado pelo sistema e informado manualmente.
Static LF_ALFCCMP       := 151     // FECP ICMS complementar
Static LF_BASFECP       := 152     // Base do FECP - Proprio.
Static LF_BSFCPST       := 153     // Base do FECP - ST.
Static LF_BSFCCMP       := 154     // Base do FECP - Complementar.
Static LF_FCPAUX        := 155     // Indice auxiliar do FCP.
Static LF_BASEFUN       := 156     // Valor de Base do Funrural.
Static LF_VALFUN        := 157    // Valor do Funrural.
Static LF_BASECPR       := 158    // Base Crédito Presumido
Static LF_DESCFIS       := 159    // Descontos fiscais de impostos
Static LF_ALSENAR       := 160    //Aliquota Senar
Static LF_BSSENAR       := 161    //Base de calculo Senar

Static SP_ITEM         := 01
Static SP_CODPRO       := 02
Static SP_IMP          := 03
Static SP_ORIGEM       := 04
Static SP_CST          := 05
Static SP_MODBC        := 06     // 0 - Calculo por Margem de Lucro
                               // 1 - Calculo por pauta ?Valor unitário inferior ao preço comercializado
                               // 2 - Calculo por PMC ?Valor unitário superior ao preço comercializado
                               // 3 - Valor da Operação.
Static SP_MVA           := 07
Static SP_PREDBC        := 08
Static SP_BC            := 09
Static SP_ALIQ          := 10
Static SP_VLTRIB        := 11
Static SP_QTRIB         := 12
Static SP_PAUTA         := 13
Static SP_COD_MN        := 14
Static SP_DESCZF        := 15
Static SP_PARTICM       := 16
Static SP_GRPCST        := 17
Static SP_CEST          := 18
Static SP_PICMDIF       := 19
Static SP_VDDES         := 20
Static SP_PDDES         := 21
Static SP_PDORI         := 22
Static SP_ADIF          := 23
Static SP_PFCP          := 24
Static SP_VFCP          := 25
Static SP_DESONE        := 26
Static SP_PDEVOL        := 27
Static SP_BFCP          := 28

Static TS_CODIGO    :=  01    //Codigo da TES
Static TS_TIPO      :=  02    //Tipo da TES - S Saida , E Entrada
Static TS_ICM       :=  03    //Calcula ICMS , S-Sim,N-Nao
Static TS_IPI       :=  04    //Calcula IPI , S-Sim,N-Nao,R-Comerciante nao Atac.
Static TS_CREDICM   :=  05    //Credito de ICMS , S-Sim,N-Nao
Static TS_CREDIPI   :=  06    //Credito de IPI  , S-Sim,N-Nao
Static TS_DUPLIC    :=  07    //Gera Duplicata , S-Sim,N-Nao
Static TS_ESTOQUE   :=  08    //Movimenta Estoque , S-Sim,N-Nao
Static TS_CF        :=  09    //Codigo Fiscal de Operacao
Static TS_TEXTO     :=  10    //Descricao do TES
Static TS_BASEICM   :=  11    //Reducao da Base de ICMS
Static TS_BASEIPI   :=  12    //Reducao da Base de IPI
Static TS_PODER3    :=  13    //Controla Poder de 3os R-Remessa,D-Devolucao,N-Nao Controla
Static TS_LFICM     :=  14    //Coluna Livros Fiscais ICM - T-Tributado,I-Isentas,O-Outras,N-Nao,Z-ICMS Zerado
Static TS_LFIPI     :=  15    //Coluna Livros Fiscais IPI - T-Tributado,I-Isentas,O-Outras,N-Nao,Z-IPI Zerado
Static TS_DESTACA   :=  16    //Destaca IPI S-Sim,N-Nao
Static TS_INCIDE    :=  17    //Incide IPI na Base de ICMS , S-Sim,N-Nao
Static TS_COMPL     :=  18    //Calcula ICMS Complementar , S-Sim,N-NAo
Static TS_IPIFRET   :=  19    //Calcula IPI sobre Frete S-Sim,N-Nao
Static TS_ISS       :=  20    //Calcula ISS S-Sim,N-Nao
Static TS_LFISS     :=  21    //Coluna Livros Fiscais ISS - T=Tributado;I=Isento;O=Outros;N=Nao calcula
Static TS_NRLIVRO   :=  22    //Numero do Livro
Static TS_UPRC      :=  23    //Atualiza Ultimo Preco de Compra S-Sim,N-Nao
Static TS_CONSUMO   :=  24    //Material de Consumo S-Sim,N-Nao,O-Outros
Static TS_FORMULA   :=  25    //Formula para uso na impressao dos Livros Fiscais
Static TS_AGREG     :=  26    //Agrega Valor a Mercadoria S-Sim N-Nao
Static TS_INCSOL    :=  27    //Agrega Valor do ICMS Sol. S-Sim,N-Nao
Static TS_CIAP      :=  28    //Livro Fiscal CIAP S-Sim,N-Nao
Static TS_DESPIPI   :=  29    //Calcula IPI sobre Despesas S-Sim,N-Nao
Static TS_LIVRO     :=  30    //Formula para livro Fiscal
Static TS_ATUTEC    :=  31    //Atualiza SigaTec S-Sim,N-Nao
Static TS_ATUATF    :=  32    //Atualiza Ativo Fixo S-Sim,N-Nao
Static TS_TPIPI     :=  33    //Base do IPI B - Valor Bruto , L - Valor Liquido
Static TS_SFC       :=  34    //Array contendo os Itens do SFC
Static TS_LIVRO     :=  35    //Nome do Rdmake de complemento/geracao dos livors Fiscais
Static TS_STDESC    :=  36    //Define se considera o Desconto no calculo do ICMS Retido.
Static TS_DESPICM   :=  37    //Define se as Despesas entram na base de Calculo de ICMS
Static TS_BSICMST   :=  38    //% de Reduco da Base de Calculo do ICMS Solidario
Static TS_BASEISS   :=  39    //% de Reduco da Base de Calculo do ISS.
Static TS_IPILICM   :=  40    //O ipi deve ser lancado nas colunas nao tributadas do ICMS
Static TS_ICMSDIF   :=  41    //ICMS Diferido
Static TS_QTDZERO   :=  42    //Tes permite digitar quantidade zero.
Static TS_TRFICM    :=  43    //Tes permite digitar quantidade zero.
Static TS_OBSICM    :=  44    //Icms na coluna de observacao
Static TS_OBSSOL    :=  45    //Icms Solidario na coluna de observacao
Static TS_PICMDIF   :=  46    //Percentual do ICMS Diferido
Static TS_PISCRED   :=  47    //Credita/Debita PIS/COFIS
Static TS_PISCOF    :=  48    //Calcula PIS/COFIS
Static TS_CREDST    :=  49    //Credita Solidario
Static TS_BASEPIS   :=  50    //Percentual de Reducao do PIS
Static TS_ICMSST    :=  51    //Indica se o ICMS deve ser somado ao ICMS ST.
Static TS_FRETAUT   :=  52    //Indica se o Frete Automo deve ser calculo sobre o ICMS ou ICMS-ST
Static TS_MKPCMP    :=  53    //Indica se o ICMS complementar deve considerar a Margem de Lucro do solidario
Static TS_CFEXT     :=  54    //Codigo Fiscal de Operacao extendido
Static TS_BASECOF   :=  55    //Percentual de Reducao do PIS
Static TS_ISSST     :=  56
Static TS_MKPSOL    :=  57    //Informa a condição da Margem de Lucro no calculo do ICMS Solidario
Static TS_AGRPIS    :=  58    //Informa se agrega o valor do PIS ao total da nota
Static TS_AGRCOF    :=  59    //Informa se agrega o valor do COFINS ao total da nota
Static TS_AGRRETC   :=  60    //Informa se agrega o valor do ICMS Retido na Coluna Outras/Isenta
Static TS_PISBRUT   :=  61    //Informa a condição da Margem de Lucro no calculo do ICMS Solidario
Static TS_COFBRUT   :=  62    //Informa se agrega o valor do PIS ao total da nota
Static TS_COFDSZF   :=  63    //Informa se agrega o valor do COFINS ao total da nota
Static TS_PISDSZF   :=  64    //Informa se agrega o valor do ICMS Retido na Coluna Outras/Isenta
Static TS_LFICMST   :=  65    //Informa como ser?a escrituração do ICMS-ST.
Static TS_DESPRDIC  :=  66    //Informa se as despesas acessórias devem ser reduzidas juntamente com a base de calculo do ICMS.
Static TS_CRDEST    :=  67    //Informa se efetua o calculo do Credito Estimulo de Manaus (1 = Nao Calcula, 2 = Produtos Eletronicos, 3 = Contrucao Civil)
Static TS_CRDPRES   :=  68    //Percentual do Credito Presumido - RJ/PR
Static TS_AFRMM     :=  69    //Calcula AFRMM: S-Sim,N-Nao
Static TS_CRDTRAN   :=  70    //Percentual para calculo do Credito Presumido - RJ - Prestacoes de Serv.de Transporte
Static TS_CTIPI     :=  71
Static TS_SITTRIB   :=  72
Static TS_CFPS      :=  73    //Codigo Fiscal de Prestacao de Servicos
Static TS_CRPRST    :=  74    //valor Credito Presumido Substituicao Tributaria retido pelo contratante do servico de transporte - Decreto 44.147/2005 (MG)
Static TS_IPIOBS    :=  75    //valor Credito Presumido Substituicao Tributaria retido pelo contratante do servico de transporte - Decreto 44.147/2005 (MG)
Static TS_IPIPC     :=  76    //Indica se o valor do IPI deve compor a base de calculo do PIS e da COFINS. 1=Sim (Compoe) e 2=Nao(Nao Compoe)
Static TS_PSCFST    :=  77    //Indica se o PIS/COFINS devera ser calculado como Subst. Tributaria.
Static TS_CRPRELE   :=  78    //% Crédito Presumido nas operações de Saída com o ICMS destacado sobre os produtos resultantes da industrialização com componentes, partes e pecas recebidos do exterior, destinados a fabricacao de produtos de informatica, eletronicos e telecomunicacoes, por estabelecimento industrial desses setores. Tratamento conforme Art. 1?do DECRETO 4.316 de 19 de Junho de 1995.(BA)
Static TS_CALCFET   :=  79    //Informa se calcula o imposto FETHAB
Static TS_CONTSOC   :=  80    //Informa se calcula o imposto FUNRURAL
Static TS_COMPRED   :=  81    //Indica se o ICMS interestadual devera ser calculado de acordo com a reducao informada na NF ou desprezando a reducao
Static TS_CSTPIS    :=  82    //CST PIS
Static TS_CSTCOF    :=  83    //CST COF
Static TS_RGESPST   :=  84    //Indica se a operacao, mesmo sem calculo de ICMS ST, faz parte do Regime Especial de Substituicao Tributaria
Static TS_CLFDSUL   :=  85    //Indica se existira o calculo do Fundersul - Mato Grosso do Sul
Static TS_ESTCRED   :=  86    //Indica o percentual de Estorno de Credito/Debito
Static TS_LANCFIS   :=  87
Static TS_CRPRSIM   :=  88    //Indica se sera calculado o Crédito Presumido Simples Nacional - SC
Static TS_ANTICMS   :=  89    //Indica se a operacao se refere a Antecipacao Tribut. de ICMS (1=Sim/2=Nao)
Static TS_AGRDRED   :=  90    //Indica se deve agregar o valor da deducao ao total da nota. Em conjunto com TS_AGREG="D" (1=Agrega; 2=Nao agrega, ou seja, abate)
Static TS_DESCOND   :=  91    //Indica se a operacao tem descondo condicional (1=Sim/2=Nao)
Static TS_CRPREPR   :=  92    //Percentual do Credito Presumido - PR - RICMS - (Art. 4) - Anexo III.
Static TS_INTBSIC   :=  93    //Indica se o PIS, a Cofins ou Ambos integram a Base do ICMS, ou nao, para notas de importacao
Static TS_ISEFECP   :=  94    //Indica se a operacao tem Isencao do FECP (1=Sim/2=Nao)
Static TS_FECPANT   :=  95
Static TS_BCPCST    :=  96
Static TS_OPERSUC   :=  97    //Indica se a operacao e com sucata
Static TS_CREDACU   :=  98    //Indicacao do Credito Acumulado de ICMS - Bahia
Static TS_CRPRERO   :=  99    //Percentual do Credito Presumido - RO - RICMS - (Art. 39) - Anexo IV.
Static TS_REDANT    := 100    //Reducao do Valor da Antecipação de ICMS
Static TS_APLIRED   := 101    //Reduzir o valor do ICMS proprio para subtracao do ICMS-ST.
Static TS_APLIIVA   := 102    //Aplica o valor do IVA-ST quando o valor da pauta for menor que o valor do ITEM.
Static TS_APLREDP   := 103    //Aplica Reducao do Valor na Base do ICMS ST, conforme redução da base do ICMS Proprio - Convenio ICMS 06 de 03/04/2009
Static TS_PAUTICM   := 104    //Se igual a NAO utiliza o ICMS de PAUTA como base de ICMS mesmo quando o preco for MAIOR que a Pauta Informada no INT_ICM conforme convenio ICMS 15/90
Static TS_ATACVAR   := 105    //Se SIM Configura o calculo do ICMS-ST do Decreto 29560/2008 para Atacadistas e Varejistas do Estado do Ceara. Para que o calculo seja realizado ?necessario que a Empresa usuaria do Sistema esteja com o CNAE informado como Atacadista CNAE iniciado pelo numero 46xxxxx ou Varejista iniciado pelo numero 47xxxxx  e o produto nao possua margem informada no campo B1_PICMENT.
Static TS_CRPREPE   := 106    //Percentual do Credito Presumido - Art. 6 Decreto  n28.247
Static TS_BSRURAL   := 107    //Se 1 a Base do FUNRURAL sera o Valor do Produto Rural, se 2 = a Base do FUNRURAL sera o valor do produto + as despesas acessorias (FRETE + SEGURO + DESPESAS)
Static TS_DBSTCSL   := 108    //Indica se o Valor do ICMS Retido ira compor a base de calculo da CSLL retida - Empresa Publica.
Static TS_DBSTIRR   := 109    //Indica se o Valor do ICMS Retido ira compor a base de calculo do IRRF retido - Empresa Publica.
Static TS_CROUTGO   := 110    //Percentual de Credito Outorgado concedido pelo Estado de GO para operacoes interestaduais para o Estado de MG.
Static TS_STCONF    := 111    //Se SIM Configura o calculo do ICMS-ST do Decreto 28443/2006 para Confecçoes do estado do Ceara. Para que o calculo ocorra ?necessario que o produto nao possua margem informada no campo B1_PICMRET.
Static TS_CSTISS    := 112
Static TS_CPRESPR   := 113    // Credito Presumido - RICMS (Art.4) - Anexo III
Static TS_BSRDICM   := 114    // Se 1 base de cáclulo da red.ICMS=valor da mercadoria + despesas acessórias, se 2 somente valor da mercadoria
Static TS_CALCFAB   := 115    //Informa se calcula o imposto FABOV - Mato Grosso
Static TS_CALCFAC   := 116    //Informa se calcula o imposto FACS - Mato Grosso
Static TS_CRPRESP   := 117    //Credito Presumido - Decreto 52.586 de 28.12.2007
Static TS_MOTICMS   := 118    //Credito Presumido - Decreto 52.586 de 28.12.2007
Static TS_ALSENAR   := 119    //Aliquota para calcular o Senar
Static TS_DESPPIS   := 120    //Define se as Despesas entram na base de Calculo de PIS
Static TS_DESPCOF   := 121    //Define se as Despesas entram na base de Calculo de COFINS
Static TS_DUPLIST   := 122    //Gera Titulo so com o valor do ICMS-ST com GERA DUPLI = NAO
Static TS_CROUTSP   := 123    //Percentual do Credito Outorgado de SP - Decreto 56.018/2010
Static TS_ICMSTMT   := 124    //Deduzir o valor do ICMS proprio no valor ICMS ST 1-Sim, 2-Não
Static TS_PR35701   := 125    //Percentual de redução conforme decreto 35.701 - PE
Static TS_CPPRODE   := 126    //Percentual de Cred Pres do PRODEPE
Static TS_TPPRODE   := 127    //Tipo de Cred Pres entre os descritos no Inciso III do PRODEPE (Portaria 236 PE)
Static TS_VDASOFT   := 128    //Se a operacao for venda de software permite que o IPI seja dobrado na base do ICMS quando a base do ICMS for dobrada pelo F4_BASEICM = 200%
Static TS_CODBCC    := 129    //Codigo da base de calculo do credito
Static TS_INDNTFR   := 130    //Indicador da natureza do frete
Static TS_VENPRES   := 131    //Indica se a Venda ?Presencial ou não.
Static TS_REDBCCE   := 132    //Percentual de Redução para vendas destinadas ao Cear?
Static TS_ISEFERN   := 133    //Indica se operacao e isento do FECOP-RN
Static TS_VARATAC   := 134    //Indica se operacao e Atacadista ou Varejista
Static TS_NORESPE   := 135    //Indica se operacao est?sendo realizada sob uma norma específica
Static TS_SOMAIPI   := 136    //Indica se o valor do IPI ir?compor ou não a base de cálculo do ICMS-ST
Static TS_APSCFST   := 137    //Indica se o PIS/COFINS como Subst. Tributaria devera ser Agregado ao Valor Total do Item.
Static TS_CPRCATR   := 138    //Indica se deve calcular o cred presumido pelo percentual da carga tributária
Static TS_CREDPRE   := 139    //Percentual do Credito Presumido
Static TS_CONSIND   := 140    //Indica se Consignacao Industrial.
Static TS_RANTSPD   := 141    //Recolhimento Antecipado - Para atender necessidades do SPEDFISCAL de MG
Static TS_ISEFEMG   := 142    //Indica se operacao e isento do FECP-MG
Static TS_ALQCMAJ   := 143    //Aliquota da COFINS de Importacao Majorada.
Static TS_ISEFEMT   := 144    //Indica se operacao e isento do FECP-Mt
Static TS_IPIANTE   := 145    //Indica se IPI ir?compor a base de ICMS Complementar
Static TS_AGREGCP   := 146    //Agrega Credito Presumido
Static TS_NATOPER   := 147    //Codigo da Natureza da Operacao/Prestacao
Static TS_TPCPRES   := 148    //Indica o tipo de Crédito Presumido
Static TS_IDHIST    := 149    //ID Historico
Static TS_DEVPARC   := 150    //Devolução Parcial Proporcional (S-Sim; N-Não)
Static TS_PERCATM   := 151    //Informe o Percentual de Carga Media MT
Static TS_DICMFUN   := 152    //Indica se o ICMS deduzido ser?retirado da base de cálculdo do FUNRURAL
Static TS_ALQPMAJ   := 153    //Aliquota da COFINS de Importacao Majorada.
Static TS_IMPIND    := 154    //Importação Indireta/Conta e Ordem
Static TS_OPERGAR   := 155    //Indica operacao de garantia
Static TS_FRETISS   := 156    //Forma de Retencao do ISS. 1 - Considera Valor Minimo; 2 - Sempre Retem
Static TS_F4_STLIQ  := 157    //Indica se ir?realizar o cálculo de ICMS ST com carga líquida.
Static TS_CV139     := 158    //Identificação do convênio 139/06.
Static TS_RFETALG   := 159    //Indica se o Cliente ir?reter o valor do FETHAB
Static TS_PARTICM   := 160    //Indica se ?uma operação com partilha de ICMS. Operações com Concessionaria
Static TS_BSICMRE   := 161
Static TS_ALICRST   := 162    // Aliquota Alterativa para  dedução do ICMS do Solidario
Static TS_TRANFIL   := 163
Static TS_IPIVFCF   := 164
Static TS_RDBSICM   := 165    //Aplica a Redução de base quando o valor da pauta for menor que o valor do ITEM
Static TS_CFAMAD    := 166
Static TS_DESCISS   := 167    //Desconto Incondicional da base ISS antes de aplicar perc. reducao
Static TS_OUTPERC   := 168
Static TS_PISMIN    := 169
Static TS_COFMIN    := 170
Static TS_IPIMIN    := 171
Static TS_CUSENTR   := 172    //Define se irá buscar o Custo da Entrada da Mercadoria para compor a Base de Cálculo
Static TS_GRPCST    := 173   //Enquadramento IPI
Static TS_IPIPECR   := 174    //Define percentual de crédito de IPI em operações sem destaque de IPI.
Static TS_CALCCPB   := 175   //Define se calcula CPRB
Static TS_DIFAL     := 176   //Calcula Difal ec 87/2015
Static TS_BASCMP    := 177   // Reducao da Base de ICMS complementar
Static TS_DUPLIPI   := 178    //Gera Titulo somente com o valor do IPI para nota de remessa, quando estiver com o campo GERA DUPLICATAS = NAO
Static TS_TXAPIPI   := 179   //Txt Apur.IPI
Static TS_FTRICMS   := 180   //Fator de Redução Desc.ICMS
Static TS_AGRISS    := 181    //Informa se agrega o valor do ISS ao total da nota
Static TS_CFUNDES   := 182    //Informa se calcula o FUNDESA
Static TS_CIMAMT    := 183    //Informa se calcula o IMA-MT
Static TS_CFASE     := 184    //Informa se calcula o FASE-MT
Static TS_INDVF     := 185    //Informa se utiliza o indice da tabela F0R simples remessa de venda futura
Static TS_AGRPEDG   := 186    //Informa se o valor do pedágio será agregado a base do ICMS ou somente no valor total da NF
Static TS_CSOSN     := 187   //CSOSN
Static TS_ALIQPRO   := 188   //Aliquota PROTEGE-GO
Static TS_ALQFEEF   := 189   //Aliquota FEEF-RJ
Static TS_DEDDIF    := 190    // Indica se, quando utilizado F4_AGREG = D, o valor do DIFAL também deve ser deduzido do total do documento.
Static TS_FCALCPR   := 191    // Forma de cálculo do crédito presumido conforme legislação selecionada.
Static TS_DIFALPC   := 192    // Indica se o valor do Difal (EC/15) deverá ser excluído da base de cálculo de PIS e COFINS.
Static TS_COLVDIF   := 193    //Indica se o valor do diferimento deverá ser gravado em alguma coluna do livro, Outros ou Isento.
Static TS_STREDU    := 194    // Indica se a reducao na base do ICMS-ST deve ser aplicada antes ou depois da composicao da base.
Static TS_FEEF      := 195   //Define se irá calcular o FEEF.
Static TS_BICMCMP   := 196
Static TS_CSENAR    := 197    //Informa se calcula o SENAR
Static TS_CINSS     := 198    //Informa se calcula o INSS
Static TS_APLREPC   := 199    //Aplica Redução PIS/COFINS
Static TS_INDISEN   := 200   //Indica se o documento fiscal possui isenção da contribuição previdenciária  //BRUCE
Static TS_INFITEM   := 201    //COMPLEMENTO DE ITEM - OUTRAS INFORMAÇÕES
Static MAX_TS       := 201    //Tamanho do array de TES

Static SFC_SEQ        := 01    //Sequencia de calculo do Imposto
Static SFC_IMPOSTO    := 02    //Codigo do imposto
Static SFC_INCDUPL    := 03    //Indica se incide nas Duplicatas
Static SFC_INCNOTA    := 04    //Indica se incide no total da NF
Static SFC_CREDITA    := 05    //Indica de Credita o Imposto
Static SFC_INCIMP     := 06    //Indica se incide na Base de Calculo de Outro imposto
Static SFC_BASE       := 07    //%Reducao da base de calculo
Static SFB_DESCR      := 08    //Descricao do Imposto
Static SFB_CPOVREI    := 09    //Campo do Valor de Entrada Item
Static SFB_CPOBAEI    := 10    //Campo da Base de Entrada do Item
Static SFB_CPOVREC    := 11    //Campo do Valor de Entrada Cabecalho
Static SFB_CPOBAEC    := 12    //Campo da Base de Entrada Cabecalho
Static SFB_CPOVRSI    := 13    //Campo do Valor de Saida Item
Static SFB_CPOBASI    := 14    //Campo da Base de Saida Item
Static SFB_CPOVRSC    := 15    //Campo do Valor de Saida Cabecalho
Static SFB_CPOBASC    := 16    //Campo da Base de Saida Cabecalho
Static SFB_FORMENT    := 17    //Rotina para calculo do imposto na Entrada
Static SFB_FORMSAI    := 18    //Rotina para calculo do imposto na Saida
Static SFC_CALCULO    := 19    //Tipo de calculo
Static SFC_PROVENT    := 20    //Provincia de entrega
Static SFB_DESGR      := 21    //Provincia de entrega

Static IMP_COD         := 01    //Codigo do imposto no Array NF_IMPOSTOS
Static IMP_DESC        := 02    //Descricao do imposto no Array NF_IMPOSTOS
Static IMP_BASE        := 03    //Base de Calculo do Imposto no Array NF_IMPOSTOS
Static IMP_ALIQ        := 04    //Aliquota de calculo do imposto
Static IMP_VAL         := 05    //Valor do Imposto no Array NF_IMPOSTOS
Static IMP_NOME        := 06    //Nome de referencia aos Impostos do cabecalho

Static NMAXIV          := 36    // Numero maximo de Impostos Variaveis

Static SB_COD         := 01
Static SB_GRTRIB      := 02
Static SB_CODIF       := 03
Static SB_RSATIVO     := 04
Static SB_POSIPI      := 05
Static SB_UM          := 06
Static SB_SEGUM       := 07
Static SB_AFABOV      := 08
Static SB_AFACS       := 09
Static SB_AFETHAB     := 10
Static SB_TFETHAB     := 11
Static SB_PICM        := 12
Static SB_FECOP       := 13
Static SB_ALFECOP     := 14
Static SB_ALIQISS     := 15
Static SB_IMPZFRC     := 16
Static SB_INT_ICM     := 17
Static SB_PR43080     := 18
Static SB_PRINCMG     := 19
Static SB_ALFECST     := 20
Static SB_PICMENT     := 21
Static SB_PICMRET     := 22
Static SB_IVAAJU      := 23
Static SB_RASTRO      := 24
Static SB_VLR_ICM     := 25
Static SB_VLR_PIS     := 26
Static SB_VLR_COF     := 27
Static SB_ORIGEM      := 28
Static SB_CRDEST      := 29
Static SB_CODISS      := 30
Static SB_TNATREC     := 31
Static SB_CNATREC     := 32
Static SB_GRPNATR     := 33
Static SB_DTFIMNT     := 34
Static SB_IPI         := 35
Static SB_VLR_IPI     := 36
Static SB_CNAE        := 37
Static SB_REGRISS     := 38
Static SB_REDINSS     := 39
Static SB_INSS        := 40
Static SB_IRRF        := 41
Static SB_REDIRRF     := 42
Static SB_REDPIS      := 43
Static SB_PPIS        := 44
Static SB_PIS         := 45
Static SB_CHASSI      := 46
Static SB_RETOPER     := 47
Static SB_REDCOF      := 48
Static SB_PCOFINS     := 49
Static SB_COFINS      := 50
Static SB_PCSLL       := 51
Static SB_CONTSOC     := 52
Static SB_PRFDSUL     := 53
Static SB_FECP        := 54
Static SB_FECPBA      := 55
Static SB_ALFECRN     := 56
Static SB_ALFUMAC     := 57
Static SB_PRN944I     := 58
Static SB_REGESIM     := 59
Static SB_VLRISC      := 60
Static SB_CRDPRES     := 61
Static SB_VMINDET     := 62
Static SB_IMPORT      := 63
Static SB_TPDP        := 64
Static SB_ALQDFB1     := 65
Static SB_B1PTST      := 66
Static SB_PRDDIAT     := 67
Static SB_B1CALTR     := 68
Static SB_B1CATRI     := 69
Static SB_ICMPFAT     := 70
Static SB_IPIPFAT     := 71
Static SB_PUPCCST     := 72
Static SB_B1CPSST     := 73
Static SB_B1CCFST     := 74
Static SB_FECPMT      := 75
Static SB_ADIFECP     := 76
Static SB_ALFECMG     := 77
Static SB_CSLL        := 78
Static SB_IDHIST      := 79
Static SB_PRDFIS      := 80    // Produto Fiscal
Static SB_MEPLES      := 81
Static SB_UVLRC       := 82
Static SB_MV_PAUTFOB  := 83    // Campo personalizavel definido atraves do parametro MV_PAUTFOB
Static SB_AFAMAD      := 84
Static SB_CONV        := 85
Static SB_MVAFRP      := 86
Static SB_MVAFRC      := 87
Static SB_GRPCST      := 88
Static SB_CEST        := 89
Static SB_CODATIV     := 90
Static SB_CG1_ALIQ    := 91
Static SB_AFUNDES     := 92
Static SB_AIMAMT      := 93
Static SB_AFASEMT     := 94
Static SB_VLRCID      := 95
Static SB_TRIBMU      := 96
Static SB_B1PISST     := 97
Static SB_B1COFST     := 98
Static SB_B1GRUPO     := 99     // grupo de produto

Static  NMAXSB        := 99    // Numero maximo de Campos do Cadastro de Produtos SB1 / SBi / SBZ


// Referencias da Natureza - SED
Static NT_CODIGO       := 01  // Codigo da natureza
Static NT_CALCIRF      := 02  // Calcula IRRF
Static NT_PERCIRF      := 03  // Percentual % IRRF
Static NT_BASEIRF      := 04  // Base IRRF
Static NT_PERCINS      := 05  // Percentual % INSS
Static NT_BASEINS      := 06  // Base INSS
Static NT_CALCINS      := 07  // Calcula INSS
Static NT_CALCISS      := 08  // Calcula ISS
Static NT_CALCPIS      := 09  // Calcula PIS
Static NT_PERCPIS      := 10  // Percentual % PIS
Static NT_CALCCOF      := 11  // Calcula COFINS
Static NT_PERCCOF      := 12  // Percentual % COFINS
Static NT_CALCCSL      := 13  // Calcula CSLL
Static NT_PERCCSL      := 14  // Percentual % CSLL
Static NT_BASESES      := 15  // Base SEST
Static NT_PERCSES      := 16  // Percentual % SEST
Static NT_DEDINSS      := 18  // Percentual % SEST
Static NT_IRRFCAR      := 22  // IRRF Carreteiro
Static NT_BASEIRC      := 23  // Percentual % Carreteiro
Static NT_CALCFMP      := 24  // Calcula FUMIPEQ
Static NT_PERQFMP      := 25  // Aliq. FUMIPEQ
Static NT_CALCINP      := 26  // Calcula INSS Patronal
Static NT_PERCINP      := 27  // Percentual do INSS Patronal

// Referencia dos parametros
Static MV_1DUPNAT   :=   01   // Campo ou dado a ser gravado na natureza do titulo.
Static MV_2DUPNAT   :=   02   // Campo ou dado a ser gravado na natureza do titulo.
Static MV_ACMIRPF   :=   03   // Def. a cumulatividade dos valores de IR-PF levarão em conta a data de Emissão ou Vencimento
Static MV_ACMIRPJ   :=   04   // Def. a cumulatividade dos valores de IR-PJ levarão em conta a data de Emissão ou Vencimento
Static MV_ADIFECP   :=   05   //
Static MV_AGENTE    :=   06   // Uso exclusivo Agentina
Static MV_ALFECMG   :=   07   //
Static MV_ALINSB1   :=   08   // Indique o campo na tabela SB1 que ira conter a alíquota adicional do INSS
Static MV_ALIQFRE   :=   09   // Indica as alíquotas para o cálculo do ICMS incidennte no frete autônomo
Static MV_ALIQIRF   :=   10   // Aliquota de IRRF para titulos c/retencao na fonte.
Static MV_ALIQISS   :=   11   // Aliquota do ISS em casos de prestacao de servicos.
Static MV_ALQDFB1   :=   12   // Campo tabela SB1 se o produto utilizar?Exceção Fiscal mesmo que o Contr. Simples Nacional
Static MV_ALQIPM    :=   13   //
Static MV_ALRN944   :=   14   // Aliquota ICMS ST para o estado de Rio Grande do Norte de acordo com o Art. 944-I.
Static MV_ARQPROD   :=   15   // Configura se os dados de indicadores de produto serao considerados pela tabela "SB1" ou "SBZ"
Static MV_ARQPROP   :=   16   // Se .F.= Considera o parametro MV_ARQPROD, se .T.= Verifica o preenchimento dos campos
Static MV_ASRN944   :=  17   // Aliquota ICMS ST para o estado de Rio Grande do Norte de acordo com o Art. 944-I.
Static MV_AUTOISS   :=  18   // Preencher automaticamente os dados de cobrança do ISS e DIRF em notas fiscais de entrada.
Static MV_B1CALTR   :=  19   //
Static MV_B1CPSST   :=  20   //
Static MV_BASERET   :=  21   // Define se as Reducoes de Base de Calculo do ICMS normal aplicam-se tambem na Base Calc. ICMS Solidario (retido)
Static MV_BICMCMP   :=  22   // Informa se a base do icms complementar deve ser reduzida como o ICMS normal
Static MV_BX10925   :=  23   // Define momento do tratamento da retencäo dos impostos Pis Cofins e Csll
Static MV_CALCVEI   :=  24   // Tratamento para o calculo da base dos impostos PIS e COFINS para Veiculos Usados.
Static MV_CODREG    :=  25   // Código do regime tributário do emitente da Nf-e 1-Simples Nacional; 2-Simples Nacional- Excesso de sub-limite de receita bruta; 3- Regime Nacional
Static MV_COFBRU    :=  26   // Não considera o desconto do item na base de cálculo da COFINS
Static MV_COFPAUT   :=  27   // Informe se o valor do COFINS de pauta refere-se ao valor do COFINS ou ao preço máximo ao consumidor
Static MV_CONTSOC   :=  28   //
Static MV_CONVCFO   :=  29   //
Static MV_CPCATRI   :=  30   //
Static MV_CRDBCOF   :=  31   //
Static MV_CRDBPIS   :=  32   //
Static MV_CROUTSP   :=  33   //
Static MV_CRPRERJ   :=  34   //
Static MV_CSLLBRU   :=  35   //
Static MV_CTRAUTO   :=  36   //
Static MV_CTRLFOL   :=  37   //
Static MV_DBRDIF    :=  38   //
Static MV_DBSTCFR   :=  39
Static MV_DBSTCOF   :=  40
Static MV_DBSTPIS   :=  41
Static MV_DBSTPSR   :=  42
Static MV_DECALIQ   :=  43
Static MV_DEDBCOF   :=  44
Static MV_DEDBPIS   :=  45
Static MV_DEISSBS   :=  46
Static MV_DESCISS   :=  47
Static MV_DESCSAI   :=  48
Static MV_DESCZF    :=  49
Static MV_DESPICM   :=  50
Static MV_DESPSD1   :=  51
Static MV_DESZFPC   :=  52
Static MV_DEVRET    :=  53
Static MV_DEVTOT    :=  54
Static MV_DPAGREG   :=   55
Static MV_DSZFSOL   :=   56
Static MV_EASY      :=   57
Static MV_ESTADO    :=   58
Static MV_ESTICM    :=   59
Static MV_FECPMT    :=   60
Static MV_FRETAUT   :=   61
Static MV_FRETEST   :=   62
Static MV_FRTBASE   :=   63
Static MV_GERIMPV   :=  64
Static MV_ICMPAD    :=  65
Static MV_ICMPAUT   :=  66
Static MV_ICMPFAT   :=  67
Static MV_ICPAUTA   :=  68
Static MV_IMPCSS    :=  69
Static MV_INDUPF    :=  70
Static MV_INITES    :=  71
Static MV_INSIRF    :=  72
Static MV_INSSDES   :=  73
Static MV_IPIBRUT   :=  74
Static MV_IPINOBS   :=  75
Static MV_IPIPFAT   :=  76
Static MV_IPIZFM    :=  77
Static MV_IRMP232   :=  78
Static MV_IRSEMNT   :=  79
Static MV_ISSPRG    :=  80
Static MV_LFAGREG   :=  81
Static MV_LIMINSS   :=  82
Static MV_LJLVFIS   :=  83
Static MV_MINDETR   :=  84
Static MV_MKPICPT   :=  85
Static MV_NORTE     :=  86
Static MV_PCFATPC   :=  87
Static MV_PERCATM   :=  88
Static MV_PEREINT   :=  89
Static MV_PERFECP   :=  90
Static MV_PISBRU    :=  91
Static MV_PISPAUT   :=  92
Static MV_PRCDEC    :=  93
Static MV_PRODLEI   :=  94
Static MV_PUPCCST   :=  95
Static MV_RASTRO    :=  96
Static MV_RATDESP   :=  97
Static MV_RCSTIPI   :=  98
Static MV_REBICM    :=  99
Static MV_REGESIM   :=  100
Static MV_RNDANG    :=  101
Static MV_RNDCF2    :=  102
Static MV_RNDCF3    :=  103
Static MV_RNDCOF    :=  104
Static MV_RNDCSL    :=  105
Static MV_RNDDES    :=  106
Static MV_RNDFUN    :=  107
Static MV_RNDICM    :=  108
Static MV_RNDINS    :=  109
Static MV_RNDIPI    :=  110
Static MV_RNDIRF    :=  111
Static MV_RNDISS    :=  112
Static MV_RNDPIS    :=  113
Static MV_RNDPREC   :=  114
Static MV_RNDPS2    :=  115
Static MV_RNDPS3    :=  116
Static MV_RNDRNE    :=  117
Static MV_RNDSOBR   :=  118
Static MV_RSATIVO   :=  119
Static MV_SIMPLSC   :=  120
Static MV_SM0CONT   :=  121
Static MV_SOLBRUT   :=  122
Static MV_SOMAICM   :=  123
Static MV_SOMAIPI   :=  124
Static MV_STFRETE   :=  125
Static MV_STPTPER   :=  126
Static MV_STREDU    :=  127
Static MV_TESIB     :=  128
Static MV_TESVEND   :=  129
Static MV_TIPOB     :=  130
Static MV_TMSUFPG   :=  131
Static MV_TMSVDEP   :=  132
Static MV_TPABISS   :=  133
Static MV_TPALCOF   :=  134
Static MV_TPALCSL   :=  135
Static MV_TPALPIS   :=  136
Static MV_TPNFISS   :=  137
Static MV_TPSOLCF   :=  138
Static MV_TXAFRMM   :=  139
Static MV_TXCOFIN   :=  140
Static MV_TXCSLL    :=  141
Static MV_TXPIS     :=  142
Static MV_UFERMS    :=  143
Static MV_UFPST21   :=  144
Static MV_USACFPS   :=  145
Static MV_VALDESP   :=  146
Static MV_VALICM    :=  147
Static MV_VISDIRF   :=  148
Static MV_XFCOMP    :=  149
Static MV_B1CATRI   :=  150
Static MV_AERN944   :=  151
Static MV_B1CCFST   :=  152
Static MV_DESCDVI   :=  153   //
Static MV_ALITPDP   :=  154   //
Static MV_B1PTST    :=  155   //
Static MV_PRDDIAT   :=  156   // DIAT-SC -> Campo criado na SB1 pelo usuario que indica o tratamento do beneficio DIAT-SC
Static MV_ISSXMUN   :=  157   //Controle do ISS por Municipio.
Static MV_APURPIS   :=  158
Static MV_APURCOF   :=  159
Static MV_UFPAUTA   :=  160
Static MV_ALALIME   :=  161
Static MV_DIFALIQ   :=  162
Static MV_VRETISS   :=  163
Static MV_VEICICM   :=  164   //Exclusivo para calculo da base de ICMS para veiculos usados
Static MV_UFIRCE    :=  165
Static MV_ALTCFIS   :=  166   // Altera produto fiscal
Static MV_DC5602    :=  167   // Parâmetro para tratamento da redução da alíquota zero de PIS COFINS conforme decreto 5602
Static MV_FISAUCF   :=  168   // Classificacao Fiscal automatica
Static MV_DSPREIN   :=  169
Static MV_PISCOFP   :=  170 //Utiliza a segunda unidade para calculo do pis/cof com Pauta
Static MV_FISXMVA   :=  171 // Habilita a utilizacao a  utomatica da formula padrao do MVA
Static MV_C13906    :=  172
Static MV_139GNUF   :=  173
Static MV_RNDSEST   :=  174 //Habilita arredondamento no calculo de SEST
Static MV_RPCBIZF   :=  175
Static MV_PBIPITR   :=  176
Static MV_PAUTFOB   :=  177
Static MV_VL10925   :=  178
Static MV_REMVFUT   :=  179
Static MV_REDIMPO   :=  180 //Indica se o calculo da base de ICMS considerara reducao de base nas notas de importacao (.T. = considera e .F. = Nao Considera)
Static MV_SNEFCFO   :=  181
Static MV_RPCBIUF   :=  182
Static MV_IPI2UNI   :=  183
Static MV_AGRPERC   :=  184
Static MV_MVAFRP    :=  185
Static MV_MVAFRE    :=  186
Static MV_MVAFRU    :=  187
Static MV_MVAFRC    :=  188
Static MV_CSTORI    :=  189
Static MV_UFSTZF    :=  190
Static MV_OPTSIMP   :=  191
Static MV_ISSZERO   :=  192
Static MV_CPRBATV   :=  193 //Codigo de atividade utilizado na CPRB para identificar contribuinte desonerado por CNAE
Static MV_CPRBNF    :=  194 //Indica que CPRB sera apurada pelos documentos fiscais
Static MV_PPDIFAL   :=  195
Static MV_BASDUPL   :=  196
Static MV_ANTVISS   :=  197
Static MV_ZRSTNEG   :=  198
Static MV_BASDENT   :=  199 // Estados que terão notas de entrada com base dupla no difal
Static MV_LJINTUF   :=  200 // Estados que terão notas de entrada com base dupla no difal
Static MV_RATAGRE   :=  201
Static MV_INTTAF    :=  202 // Integracao Nativa cbanco a banco com SIGATAF
Static MV_UFBDST    :=  203 //Estados que usam Base Dupla ST
Static MV_M116FOR   :=  204
Static MV_CDIFBEN   :=  205 //Indica se notas tipo B - Beneficiamento e emissao propria deverao ser consideradas como credito na apuracao do DIFAL.
Static MV_BASDEGO   :=  206 // Estados que terão notas de entrada com base dupla no difal sem subtrair ICMS
Static MV_ANTICMS   :=  207
Static MV_EISSXM    :=  208 //Em conjunto com o parâmetro MV_ISSXMUN, define se nas entradas o município a ser considerado ?sempre o do tomador. 1 = Sim e 2 = Não.
Static MV_DBSTCLR   :=  209 //Indica o tratamento para retirada do valor do icms solidario na base do CSLL.
Static MV_TXPISST   :=  210
Static MV_TXCOFST   :=  211
Static MV_B1PISST   :=  212
Static MV_B1COFST   :=  213
Static MV_CFOTES    :=  214
Static MV_CMPALIQ   :=  215 //calcula ICMS Complementar calculado pela diferenças entre aliquotas.
Static MV_CRPRESC   :=  216 // parametrização das alíquotas do DIAT-SC
Static MV_UFBSTGO   :=  217 // Base dupla ICMS ST nas saidas para estado de Goais
Static MV_UFSTALQ   :=  218 // Utiliza diferença das aliq para calc Base dupla ICMS ST nas saidas para estado de Goais
Static MV_BASDSER   :=  219 // Diferencial de aliquota na entrada Portaria SEFAZ SE 367/2016; Art. 22 e 23 RICMS/SE
Static MV_BASDSSE   :=  220 // Diferencial de aliquota na Saída Portaria SEFAZ SE 367/2016; Art. 22 e 23 RICMS/SE
Static MV_EIC0064   :=  221 // Define que o valor aduaneiro informado em notas de importação esteja sem o Valor do II
Static MV_BASDANT   :=  222 // Define se aplica cálculo da base do ICMS Do destino em operações de entrada para Contribuinte nas operações de Antecipação
Static MV_BASDPUF   :=  223 // Define para quais UF será considerado a Base Dupla em notas do tipo CTR/CTE/CTA/CA/CTF
Static MV_IBGE886   :=  224 //Indica se o arredondamento de ISS respeitará a resoluc. 886/66 do IBGE: Sendo o numero 5 a ser arredondado se o antecessor for impar.
Static MV_BDSIMP    :=  225 //Define quais Estados optaram por expurgar o valor do ICMS do Simples Nacional ao invés do Interestadual na aquisição com Difal com BAse Dupla
Static MV_DEVMERC   :=  226 //Define emitente identificado como cliente para devolucao de mercadoria recusada pelo cliente.
Static MV_ALCPESP   :=  227 // Define a alíquota da Contribuição Previdenciária (INSS) especial para 15, 20 e 25 anos, respctivamente 2/3/4
Static MV_TPAPSB1   :=  228 // Indique o campo na tabela SB1 que ira conter o tipo de Contribuição Previdenciária (INSS) especial.
Static MV_DEDBCPR   :=  229
Static MV_UFBASDP   :=  230 //Ufs que possuam base dupla de Difal em operações interestaduais para não contribuintes.
Static MV_GIAEFD    :=  231 //Indica se Valores Declaratórios serão Apurados através da Apuração de ICMS.
Static MV_BSICMCM   :=  232 //Antec. de ICMS com base de cálculo composta
Static MV_ULTAQUI   :=  233 //Antec. de ICMS com base de cálculo composta
Static MV_UFALCMP   :=  234 //UFs que efetuam controle de cálculo do Difal por difeenciação de alíquota
Static MV_ORILOTE   :=  235 //Busca a origem do produto de lote nas notas fiscais de entrada, para utilizar na classificação fiscal - Squad CRM/FAT
Static MV_REDPT     :=  236 //Indica se aplica redução sobre base de cálculo com pauta .T. aplica redução .F. não aplica.
Static MV_DESONRJ   :=  237 //Estados que utilizam cálculo desoneração de ICMS seguindo modelo da Resolução SEFAZ RJ 13/2019.
Static MV_MTCLF3K   :=  238 //Forma de enquadramento do valor declaratório F3K. 0 - Enquadramento por produto; 1 - Enquadramento por grupos: cliente, produto e fornecedor.
Static MV_STMEDRD   :=  239 //Informar as 4 primeiras posições dos NCMs que deverão ter a redução de base de cálculo desconsiderada, quando o valor da operação for igual ou superior a 70% do PMC (Preço Máximo ao Consumidor). Utilizar a separação por ponto-e-vírgula.
Static MV_FUNRURA   :=  240 //1 - Novo cálculo para que a Base do INSS , GILRAT e SENAR sejam iguais com o uso do Campo F4_BSRURAL. 2 - Mantém o cálculo onde as BASE do INSS,e SENAR e GILRAT se faz necessário calcular as contribuições de forma  separadamente.
Static MV_ISPPUBL   :=  241 //Define se a empresa que utiliza o sistema é uma empresa pública.
Static MV_DICMISE   :=  242 //Define se haverá dedução do ICMS Isento da base do PIS/COFINS: S=Sim ou N=Não.
Static MV_BDSTREV   :=  243 //Indica se será calculada a base dupla

// Referencias dos PONTOS DE ENTRADA
Static PE_M520SF3       := 01
Static PE_M520SFT       := 02
Static PE_MAAFRMM       := 03
Static PE_MACALCCOF     := 04
Static PE_MACALCCSL     := 05
Static PE_MACALCICMS    := 06
Static PE_MACALCPIS     := 07
Static PE_MaCofDif      := 08
Static PE_MACOFVEIC     := 09
Static PE_MACSTPICO     := 10
Static PE_MAFISBIR      := 11
Static PE_MAFISOBS      := 12
Static PE_MAFISRASTRO   := 13
Static PE_MAFISRUR      := 14
Static PE_MAICMVEIC     := 15
Static PE_MAPISDIF      := 16
Static PE_MAPISVEIC     := 17
Static PE_MARATEIO      := 18
Static PE_MAVLDIMP      := 19
Static PE_MFISIMP       := 20
Static PE_MTA920L       := 21
Static PE_MXTOTIT       := 22
Static PE_PAUTICMS      := 23
Static PE_TM200ISS      := 24
Static PE_VISUIMP       := 25
Static PE_VLCODRET      := 26
Static PE_XFCD2SFT      := 27
Static PE_XFISLF        := 28
Static PE_MACALIRRF     := 29
Static PE_MFISEXCE      := 30
Static PE_MAZVSTDF      := 31
Static PE_MAEXCEFISC    := 32
Static PE_MACSOLICMS    := 33
Static PE_M410SOLI      := 34
Static PE_MAIPIVEIC     := 35
Static PE_MAVLDCQry     := 36

// Referencias FIELDPOS
#DEFINE FP_A1_CALCIRF      01
#DEFINE FP_A1_CONTRIB      02
#DEFINE FP_A1_PERCATM      03
#DEFINE FP_A1_PERFECP      04
#DEFINE FP_A1_REGESIM      05
#DEFINE FP_A1_SIMPLES      06
#DEFINE FP_A1_TPESSOA      07
#DEFINE FP_A2_CALCIRF      08
#DEFINE FP_A2_INCLTMG      09
#DEFINE FP_A2_IRPROG       10
#DEFINE FP_A2_NUMDEP       11
#DEFINE FP_A2_RECSEST      12
#DEFINE FP_A2_REGESIM      13
#DEFINE FP_A2_SIMPNAC      14
#DEFINE FP_A2_TPESSOA      15
#DEFINE FP_B1_ALFECOP      16
#DEFINE FP_B1_ALFECST      17
#DEFINE FP_B1_ALFUMAC      18
#DEFINE FP_B1_CHASSI       19
#DEFINE FP_B1_CNATREC      20
#DEFINE FP_B1_CRDPRES      21
#DEFINE FP_B1_DTFIMNT      22
#DEFINE FP_B1_FECOP        23
#DEFINE FP_B1_FECPBA       24
#DEFINE FP_B1_GRPNATR      25
#DEFINE FP_B1_IMPORT       26
#DEFINE FP_B1_PRN944I      27
#DEFINE FP_B1_REGESIM      28
#DEFINE FP_B1_REGRISS      29
#DEFINE FP_B1_TNATREC      30
#DEFINE FP_B1_VMINDET      31
#DEFINE FP_C6_CNATREC      32
#DEFINE FP_C6_DTFIMNT      33
#DEFINE FP_C6_GRPNATR      34
#DEFINE FP_C6_TNATREC      35
#DEFINE FP_CC7_CLANAP      36
#DEFINE FP_CC7_IFCOMP      37
#DEFINE FP_CC7_TPREG       38
#DEFINE FP_CD2_DESCZF      39
#DEFINE FP_CD2_FORMU       40
#DEFINE FP_CDA_IFCOMP      41
#DEFINE FP_CDA_TPLANC      42
#DEFINE FP_CDO_CODREF      43
#DEFINE FP_CE0_NFALIQ      44
#DEFINE FP_CE0_NFALVA      45
#DEFINE FP_CE0_NFBASE      46
#DEFINE FP_CE0_NFVALO      47
#DEFINE FP_D1_ALIQSOL      48
#DEFINE FP_D1_BASEFUN      49
#DEFINE FP_D1_ICMSDIF      50
#DEFINE FP_D1_ITEM         51
#DEFINE FP_D1_MARGEM       52
#DEFINE FP_D1_SLDDEP       53
#DEFINE FP_D2_ALIQSOL      54
#DEFINE FP_D2_BASEFUN      55
#DEFINE FP_D2_ICMSDIF      56
#DEFINE FP_D2_MARGEM       57
#DEFINE FP_DUY_ALQISS      58
#DEFINE FP_E2_BASEIRF      59
#DEFINE FP_E2_FORNISS      60
#DEFINE FP_E2_LOJAISS      61
#DEFINE FP_E2_PRETCOF      62
#DEFINE FP_E2_PRETCSL      63
#DEFINE FP_E2_PRETIRF      64
#DEFINE FP_E2_PRETPIS      65
#DEFINE FP_E2_SEQBX        66
#DEFINE FP_E2_VENCISS      67
#DEFINE FP_E2_VRETCOF      68
#DEFINE FP_E2_VRETCSL      69
#DEFINE FP_E2_VRETIRF      70
#DEFINE FP_E2_VRETPIS      71
#DEFINE FP_E5_BASEIRF      72
#DEFINE FP_E5_PRETCOF      73
#DEFINE FP_E5_PRETCSL      74
#DEFINE FP_E5_PRETIRF      75
#DEFINE FP_E5_PRETPIS      76
#DEFINE FP_E5_VRETCOF      77
#DEFINE FP_E5_VRETCSL      78
#DEFINE FP_E5_VRETIRF      79
#DEFINE FP_E5_VRETPIS      80
#DEFINE FP_ED_BASESES      81
#DEFINE FP_ED_PERCSES      82
#DEFINE FP_F1_CAE          83
#DEFINE FP_F1_CHVNFE       84
#DEFINE FP_F1_CODNFE       85
#DEFINE FP_F1_CREDNFE      86
#DEFINE FP_F1_DESNTRB      87
#DEFINE FP_F1_EMINFE       88
#DEFINE FP_F1_HORNFE       89
#DEFINE FP_F1_NFELETR      90
#DEFINE FP_F1_NUMRPS       91
#DEFINE FP_F1_TARA         92
#DEFINE FP_F1_TPVENT       93
#DEFINE FP_F1_VCTOCAE      94
#DEFINE FP_F2_CAE          95
#DEFINE FP_F2_CHVNFE       96
#DEFINE FP_F2_CODNFE       97
#DEFINE FP_F2_CREDNFE      98
#DEFINE FP_F2_DESNTRB      99
#DEFINE FP_F2_DTDIGIT     100
#DEFINE FP_F2_EMINFE      101
#DEFINE FP_F2_HORNFE      102
#DEFINE FP_F2_NFAGREG     103
#DEFINE FP_F2_NFELETR     104
#DEFINE FP_F2_RECISS      105
#DEFINE FP_F2_TARA        106
#DEFINE FP_F2_TPVENT      107
#DEFINE FP_F2_VCTOCAE     108
#DEFINE FP_F2_VLR_FRT     109
#DEFINE FP_F3_BSREIN      110
#DEFINE FP_F3_CAE         111
#DEFINE FP_F3_CODNFE      112
#DEFINE FP_F3_CRDEST      113
#DEFINE FP_F3_CREDNFE     114
#DEFINE FP_F3_CREDPRE     115
#DEFINE FP_F3_CRPREPE     116
#DEFINE FP_F3_DESCZFR     117
#DEFINE FP_F3_DS43080     118
#DEFINE FP_F3_ECF         119
#DEFINE FP_F3_EMINFE      120
#DEFINE FP_F3_HORNFE      121
#DEFINE FP_F3_MDCAT79     122
#DEFINE FP_F3_NFAGREG     123
#DEFINE FP_F3_NFELETR     124
#DEFINE FP_F3_NUMRPS      125
#DEFINE FP_F3_SIMPLES     126
#DEFINE FP_F3_TPVENT      127
#DEFINE FP_F3_VCTOCAE     128
#DEFINE FP_F3_VFECPMG     129
#DEFINE FP_F3_VFECPMT     130
#DEFINE FP_F3_VFECPRN     131
#DEFINE FP_F3_VFESTMG     132
#DEFINE FP_F3_VFESTMT     133
#DEFINE FP_F3_VFESTRN     134
#DEFINE FP_F3_VL43080     135
#DEFINE FP_F3_VLINCMG     136
#DEFINE FP_F3_VREINT      137
#DEFINE FP_F4_AFRMM       138
#DEFINE FP_F4_AGRCOF      139
#DEFINE FP_F4_AGRDRED     140
#DEFINE FP_F4_AGREGCP     141
#DEFINE FP_F4_AGRPIS      142
#DEFINE FP_F4_AGRRETC     143
#DEFINE FP_F4_ALSENAR     144
#DEFINE FP_F4_ANTICMS     145
#DEFINE FP_F4_APLIIVA     146
#DEFINE FP_F4_APLIRED     147
#DEFINE FP_F4_APLREDP     148
#DEFINE FP_F4_APSCFST     149
#DEFINE FP_F4_ATACVAR     150
#DEFINE FP_F4_BASECOF     151
#DEFINE FP_F4_BASEISS     152
#DEFINE FP_F4_BASEPIS     153
#DEFINE FP_F4_BCPCST      154
#DEFINE FP_F4_BSICMST     155
#DEFINE FP_F4_BSRDICM     156
#DEFINE FP_F4_BSRURAL     157
#DEFINE FP_F4_CALCFET     158
#DEFINE FP_F4_CFABOV      159
#DEFINE FP_F4_CFACS       160
#DEFINE FP_F4_CFPS        161
#DEFINE FP_F4_CLFDSUL     162
#DEFINE FP_F4_CNATREC     163
#DEFINE FP_F4_CODBCC      164
#DEFINE FP_F4_COFBRUT     165
#DEFINE FP_F4_COFDSZF     166
#DEFINE FP_F4_COMPRED     167
#DEFINE FP_F4_CONSIND     168
#DEFINE FP_F4_CONTSOC     169
#DEFINE FP_F4_CPPRODE     170
#DEFINE FP_F4_CPRECTR     171
#DEFINE FP_F4_CPRESPR     172
#DEFINE FP_F4_CRDEST      173
#DEFINE FP_F4_CRDPRES     174
#DEFINE FP_F4_CRDTRAN     175
#DEFINE FP_F4_CREDACU     176
#DEFINE FP_F4_CREDPRE     177
#DEFINE FP_F4_CREDST      178
#DEFINE FP_F4_CROUTGO     179
#DEFINE FP_F4_CROUTSP     180
#DEFINE FP_F4_CRPRELE     181
#DEFINE FP_F4_CRPREPE     182
#DEFINE FP_F4_CRPREPR     183
#DEFINE FP_F4_CRPRERO     184
#DEFINE FP_F4_CRPRESP     185
#DEFINE FP_F4_CRPRSIM     186
#DEFINE FP_F4_CRPRST      187
#DEFINE FP_F4_CSTCOF      188
#DEFINE FP_F4_CSTISS      189
#DEFINE FP_F4_CSTPIS      190
#DEFINE FP_F4_CTIPI       191
#DEFINE FP_F4_DBSTCSL     192
#DEFINE FP_F4_DBSTIRR     193
#DEFINE FP_F4_DESCOND     194
#DEFINE FP_F4_DESPCOF     195
#DEFINE FP_F4_DESPPIS     196
#DEFINE FP_F4_DSPRDIC     197
#DEFINE FP_F4_DTFIMNT     198
#DEFINE FP_F4_DUPLIST     199
#DEFINE FP_F4_ESTCRED     200
#DEFINE FP_F4_GRPNATR     201
#DEFINE FP_F4_ICMSST      202
#DEFINE FP_F4_ICMSTMT     203
#DEFINE FP_F4_INCSOL      204
#DEFINE FP_F4_INDNTFR     205
#DEFINE FP_F4_INTBSIC     206
#DEFINE FP_F4_IPIANT      207
#DEFINE FP_F4_IPIOBS      208
#DEFINE FP_F4_IPIPC       209
#DEFINE FP_F4_ISEFECP     210
#DEFINE FP_F4_ISEFEMG     211
#DEFINE FP_F4_ISEFEMT     212
#DEFINE FP_F4_ISEFERN     213
#DEFINE FP_F4_ISSST       214
#DEFINE FP_F4_LFICMST     215
#DEFINE FP_F4_LFISS       216
#DEFINE FP_F4_MALQCOF     217
#DEFINE FP_F4_MKPSOL      218
#DEFINE FP_F4_MOTICMS     219
#DEFINE FP_F4_NORESP      220
#DEFINE FP_F4_OBSICM      221
#DEFINE FP_F4_OBSSOL      222
#DEFINE FP_F4_OPERSUC     223
#DEFINE FP_F4_PAUTICM     224
#DEFINE FP_F4_PICMDIF     225
#DEFINE FP_F4_PISBRUT     226
#DEFINE FP_F4_PISCOF      227
#DEFINE FP_F4_PISCRED     228
#DEFINE FP_F4_PISDSZF     229
#DEFINE FP_F4_PR35701     230
#DEFINE FP_F4_PSCFST      231
#DEFINE FP_F4_REDANT      232
#DEFINE FP_F4_REDBCCE     233
#DEFINE FP_F4_RGESPST     234
#DEFINE FP_F4_SITTRIB     235
#DEFINE FP_F4_SOMAIPI     236
#DEFINE FP_F4_STCONF      237
#DEFINE FP_F4_TNATREC     238
#DEFINE FP_F4_TPPRODE     239
#DEFINE FP_F4_TRFICM      240
#DEFINE FP_F4_VARATAC     241
#DEFINE FP_F4_VDASOFT     242
#DEFINE FP_F4_VENPRES     243
#DEFINE FP_F7_BSICMST     244
#DEFINE FP_F7_CNATREC     245
#DEFINE FP_F7_DTFIMNT     246
#DEFINE FP_F7_GRUPONC     247
#DEFINE FP_F7_PRCUNIC     248
#DEFINE FP_F7_TNATREC     249
#DEFINE FP_F7_UFBUSCA     250
#DEFINE FP_FB_DESGR       251
#DEFINE FP_FC_PROV        252
#DEFINE FP_FP_QTDITEM     253
#DEFINE FP_FP_TIPOFOR     254
#DEFINE FP_FQ_SEQDES      255
#DEFINE FP_FT_AGREG       256
#DEFINE FP_FT_ALFECMG     257
#DEFINE FP_FT_ALFECMT     258
#DEFINE FP_FT_ALFECRN     259
#DEFINE FP_FT_ALIQSOL     260
#DEFINE FP_FT_ALIQTST     261
#DEFINE FP_FT_ALQFAB      262
#DEFINE FP_FT_ALQFAC      263
#DEFINE FP_FT_ALQFECP     264
#DEFINE FP_FT_ALQFET      265
#DEFINE FP_FT_ALQFUM      266
#DEFINE FP_FT_ALSENAR     267
#DEFINE FP_FT_ANTICMS     268
#DEFINE FP_FT_BASETST     269
#DEFINE FP_FT_BSEFAB      270
#DEFINE FP_FT_BSEFAC      271
#DEFINE FP_FT_BSEFET      272
#DEFINE FP_FT_BSREIN      273
#DEFINE FP_FT_BSSENAR     274
#DEFINE FP_FT_CHVNFE      275
#DEFINE FP_FT_CODBCC      276
#DEFINE FP_FT_CODIF       277
#DEFINE FP_FT_CODNFE      278
#DEFINE FP_FT_COECFST     279
#DEFINE FP_FT_COEPSST     280
#DEFINE FP_FT_CPPRODE     281
#DEFINE FP_FT_CPRESPR     282
#DEFINE FP_FT_CRDPRES     283
#DEFINE FP_FT_CREDNFE     284
#DEFINE FP_FT_CREDPRE     285
#DEFINE FP_FT_CROUTGO     286
#DEFINE FP_FT_CROUTSP     287
#DEFINE FP_FT_CRPREPE     288
#DEFINE FP_FT_CRPREPR     289
#DEFINE FP_FT_CRPRERO     290
#DEFINE FP_FT_CRPRESP     291
#DEFINE FP_FT_CRPRRON     292
#DEFINE FP_FT_CRPRSIM     293
#DEFINE FP_FT_CSTCOF      294
#DEFINE FP_FT_CSTISS      295
#DEFINE FP_FT_CSTPIS      296
#DEFINE FP_FT_DESCICM     297
#DEFINE FP_FT_DESCZFR     298
#DEFINE FP_FT_EMINFE      299
#DEFINE FP_FT_HORNFE      300
#DEFINE FP_FT_INDNTFR     301
#DEFINE FP_FT_MALQCOF     302
#DEFINE FP_FT_MARGEM      303
#DEFINE FP_FT_MVALCOF     304
#DEFINE FP_FT_NFELETR     305
#DEFINE FP_FT_NORESP      306
#DEFINE FP_FT_NUMRPS      307
#DEFINE FP_FT_PAUTCOF     308
#DEFINE FP_FT_PAUTIC      309
#DEFINE FP_FT_PAUTIPI     310
#DEFINE FP_FT_PAUTPIS     311
#DEFINE FP_FT_PAUTST      312
#DEFINE FP_FT_PR43080     313
#DEFINE FP_FT_PRCUNIC     314
#DEFINE FP_FT_PRFDSUL     315
#DEFINE FP_FT_PRINCMG     316
#DEFINE FP_FT_RGESPST     317
#DEFINE FP_FT_TPPRODE     318
#DEFINE FP_FT_UFERMS      319
#DEFINE FP_FT_VALANTI     320
#DEFINE FP_FT_VALFAB      321
#DEFINE FP_FT_VALFAC      322
#DEFINE FP_FT_VALFDS      323
#DEFINE FP_FT_VALFECP     324
#DEFINE FP_FT_VALFET      325
#DEFINE FP_FT_VALFUM      326
#DEFINE FP_FT_VALTST      327
#DEFINE FP_FT_VFECPMG     328
#DEFINE FP_FT_VFECPMT     329
#DEFINE FP_FT_VFECPRN     330
#DEFINE FP_FT_VFECPST     331
#DEFINE FP_FT_VFESTMG     332
#DEFINE FP_FT_VFESTMT     333
#DEFINE FP_FT_VFESTRN     334
#DEFINE FP_FT_VLINCMG     335
#DEFINE FP_FT_VLSENAR     336
#DEFINE FP_FT_VREINT      337
#DEFINE FP_N1_ALIQCOF     338
#DEFINE FP_N1_ALIQPIS     339
#DEFINE FP_N1_CODBCC      340
#DEFINE FP_N1_CSTCOFI     341
#DEFINE FP_N1_CSTPIS      342
#DEFINE FP_US_ALIQIR      343
#DEFINE FP_US_CALCSUF     344
#DEFINE FP_US_CONTRIB     345
#DEFINE FP_US_GRPTRIB     346
#DEFINE FP_US_INSCR       347
#DEFINE FP_US_NATUREZ     348
#DEFINE FP_US_RECCOFI     349
#DEFINE FP_US_RECCSLL     350
#DEFINE FP_US_RECINSS     351
#DEFINE FP_US_RECISS      352
#DEFINE FP_US_RECPIS      353
#DEFINE FP_US_SUFRAMA     354
#DEFINE FP_US_TPESSOA     355
#DEFINE FP_WN_ITEMNF      356
#DEFINE FP_WN_TES         357
#DEFINE FP_B1_AFABOV      358
#DEFINE FP_A2_RFABOV      359
#DEFINE FP_A1_RFABOV      360
#DEFINE FP_B1_AFACS       361
#DEFINE FP_A2_RFACS       362
#DEFINE FP_A1_RFACS       363
#DEFINE FP_B1_AFETHAB     364
#DEFINE FP_A2_RECFET      365
#DEFINE FP_A1_RECFET      366
#DEFINE FP_F3_VALTPDP     367
#DEFINE FP_F3_TIPANUL     368
#DEFINE FP_F3_NCF         369
#DEFINE FP_A1_TPDP        370
#DEFINE FP_B1_TPDP        371
#DEFINE FP_FT_B1DIAT      372
#DEFINE FP_MV_ALQDFB1     373 // Campo dinamico da SB1 -> Nome do campo esta contido no paramtro MV_ALQDFB1
#DEFINE FP_MV_B1PTST      374 // Campo dinamico da SB1 -> Nome do campo esta contido no paramtro MV_B1PTST
#DEFINE FP_A1_CRDMA       375 // Campo de Credito Estimulo de Manaus
#DEFINE FP_A1_CDRDES      376 // Campo de Regiao do Cliente
#DEFINE FP_CC2_PERMAT     377
#DEFINE FP_CC2_PERSER     378
#DEFINE FP_CC2_MDEDMA     379
#DEFINE FP_CC2_MDEDSR     380
#DEFINE FP_B1_ALFECRN     381
#DEFINE FP_D2_VALADI      382
#DEFINE FP_F4_NATOPER     383
#DEFINE FP_BI_COD         384
#DEFINE FP_BI_GRTRIB      385
#DEFINE FP_BI_CODIF       386
#DEFINE FP_BI_RSATIVO     387
#DEFINE FP_BI_POSIPI      388
#DEFINE FP_BI_UM          389
#DEFINE FP_BI_SEGUM       390
#DEFINE FP_BI_AFABOV      391
#DEFINE FP_BI_AFACS       392
#DEFINE FP_BI_AFETHAB     393
#DEFINE FP_BI_TFETHAB     394
#DEFINE FP_BI_PICM        395
#DEFINE FP_BI_FECOP       396
#DEFINE FP_BI_ALFECOP     397
#DEFINE FP_BI_ALIQISS     398
#DEFINE FP_BI_IMPZFRC     399
#DEFINE FP_BI_INT_ICM     400
#DEFINE FP_BI_PR43080     401
#DEFINE FP_BI_PRINCMG     402
#DEFINE FP_BI_ALFECST     403
#DEFINE FP_BI_PICMENT     404
#DEFINE FP_BI_PICMRET     405
#DEFINE FP_BI_IVAAJU      406
#DEFINE FP_BI_RASTRO      407
#DEFINE FP_BI_VLR_ICM     408
#DEFINE FP_BI_VLR_PIS     409
#DEFINE FP_BI_VLR_COF     410
#DEFINE FP_BI_ORIGEM      411
#DEFINE FP_BI_CRDEST      412
#DEFINE FP_BI_CODISS      413
#DEFINE FP_BI_TNATREC     414
#DEFINE FP_BI_CNATREC     415
#DEFINE FP_BI_GRPNATR     416
#DEFINE FP_BI_DTFIMNT     417
#DEFINE FP_BI_IPI         418
#DEFINE FP_BI_VLR_IPI     419
#DEFINE FP_BI_CNAE        420
#DEFINE FP_BI_REGRISS     421
#DEFINE FP_BI_REDINSS     422
#DEFINE FP_BI_INSS        423
#DEFINE FP_BI_IRRF        424
#DEFINE FP_BI_REDIRRF     425
#DEFINE FP_BI_REDPIS      426
#DEFINE FP_BI_PPIS        427
#DEFINE FP_BI_PIS         428
#DEFINE FP_BI_CHASSI      429
#DEFINE FP_BI_RETOPER     430
#DEFINE FP_BI_REDCOF      431
#DEFINE FP_BI_PCOFINS     432
#DEFINE FP_BI_COFINS      433
#DEFINE FP_BI_PCSLL       434
#DEFINE FP_BI_CONTSOC     435
#DEFINE FP_BI_PRFDSUL     436
#DEFINE FP_BI_FECP        437
#DEFINE FP_BI_FECPBA      438
#DEFINE FP_BI_ALFECRN     439
#DEFINE FP_BI_ALFUMAC     440
#DEFINE FP_BI_PRN944I     441
#DEFINE FP_BI_REGESIM     442
#DEFINE FP_BI_VLRISC      443
#DEFINE FP_BI_CRDPRES     444
#DEFINE FP_BI_VMINDET     445
#DEFINE FP_BI_IMPORT      446
#DEFINE FP_BI_TPDP        447
#DEFINE FP_BI_ALQDFB1     448
#DEFINE FP_BI_B1PTST      449
#DEFINE FP_BI_PRDDIAT     450
#DEFINE FP_BI_B1CALTR     451
#DEFINE FP_BI_B1CATRI     452
#DEFINE FP_BI_ICMPFAT     453
#DEFINE FP_BI_IPIPFAT     454
#DEFINE FP_BI_PUPCCST     455
#DEFINE FP_BI_B1CPSST     456
#DEFINE FP_BI_B1CCFST     457
#DEFINE FP_BI_FECPMT      458
#DEFINE FP_BI_ADIFECP     459
#DEFINE FP_BI_ALFECMG     460
#DEFINE FP_B1_COD         461
#DEFINE FP_B1_GRTRIB      462
#DEFINE FP_B1_CODIF       463
#DEFINE FP_B1_RSATIVO     464
#DEFINE FP_B1_POSIPI      465
#DEFINE FP_B1_UM          466
#DEFINE FP_B1_SEGUM       467
#DEFINE FP_B1_TFETHAB     468
#DEFINE FP_B1_PICM        469
#DEFINE FP_B1_ALIQISS     470
#DEFINE FP_B1_IMPZFRC     471
#DEFINE FP_B1_INT_ICM     472
#DEFINE FP_B1_PR43080     473
#DEFINE FP_B1_PRINCMG     474
#DEFINE FP_B1_PICMENT     475
#DEFINE FP_B1_PICMRET     476
#DEFINE FP_B1_IVAAJU      477
#DEFINE FP_B1_RASTRO      478
#DEFINE FP_B1_VLR_ICM     479
#DEFINE FP_B1_VLR_PIS     480
#DEFINE FP_B1_VLR_COF     481
#DEFINE FP_B1_ORIGEM      482
#DEFINE FP_B1_CRDEST      483
#DEFINE FP_B1_CODISS      484
#DEFINE FP_B1_IPI         485
#DEFINE FP_B1_VLR_IPI     486
#DEFINE FP_B1_CNAE        487
#DEFINE FP_B1_REDINSS     488
#DEFINE FP_B1_INSS        489
#DEFINE FP_B1_IRRF        490
#DEFINE FP_B1_REDIRRF     491
#DEFINE FP_B1_REDPIS      492
#DEFINE FP_B1_PPIS        493
#DEFINE FP_B1_PIS         494
#DEFINE FP_B1_RETOPER     495
#DEFINE FP_B1_REDCOF      496
#DEFINE FP_B1_PCOFINS     497
#DEFINE FP_B1_COFINS      498
#DEFINE FP_B1_PCSLL       499
#DEFINE FP_B1_CONTSOC     500
#DEFINE FP_B1_PRFDSUL     501
#DEFINE FP_B1_FECP        502
#DEFINE FP_B1_VLRISC      503
#DEFINE FP_B1_ALQDFB1     504
#DEFINE FP_B1_B1PTST      505
#DEFINE FP_B1_PRDDIAT     506
#DEFINE FP_B1_B1CALTR     507
#DEFINE FP_B1_B1CATRI     508
#DEFINE FP_B1_ICMPFAT     509
#DEFINE FP_B1_IPIPFAT     510
#DEFINE FP_B1_PUPCCST     511
#DEFINE FP_B1_B1CPSST     512
#DEFINE FP_B1_B1CCFST     513
#DEFINE FP_B1_FECPMT      514
#DEFINE FP_B1_ADIFECP     515
#DEFINE FP_B1_ALFECMG     516
#DEFINE FP_BZ_PICM        517
#DEFINE FP_BZ_VLR_ICM     518
#DEFINE FP_BZ_INT_ICM     519
#DEFINE FP_BZ_PICMRET     520
#DEFINE FP_BZ_PICMENT     521
#DEFINE FP_BZ_IPI         522
#DEFINE FP_BZ_VLR_IPI     523
#DEFINE FP_BZ_REDPIS      524
#DEFINE FP_BZ_REDCOF      525
#DEFINE FP_BZ_IRRF        526
#DEFINE FP_BZ_ORIGEM      527
#DEFINE FP_BZ_GRTRIB      528
#DEFINE FP_BZ_CODISS      529
#DEFINE FP_BZ_FECP        530
#DEFINE FP_BZ_ALIQISS     531
#DEFINE FP_BZ_PIS         532
#DEFINE FP_BZ_COFINS      533
#DEFINE FP_BZ_PCSLL       534
#DEFINE FP_BZ_ALFUMAC     535
#DEFINE FP_BZ_FECPBA      536
#DEFINE FP_BZ_ALFECRN     537
#DEFINE FP_BZ_CNAE        538
#DEFINE FP_BI_CSLL        539
#DEFINE FP_B1_CSLL        540
#DEFINE FP_BZ_CSLL        541
#DEFINE FP_F4_TPCPRES     542
#DEFINE FP_FT_IDSF4       543
#DEFINE FP_FT_IDSF7       544
#DEFINE FP_FT_IDSA1       545
#DEFINE FP_FT_IDSA2       546
#DEFINE FP_FT_IDSB1       547
#DEFINE FP_FT_IDSB5       548
#DEFINE FP_FT_IDSBZ       549
#DEFINE FP_FT_IDSED       550
#DEFINE FP_FT_IDSFB       551
#DEFINE FP_F4_IDHIST      552
#DEFINE FP_F7_IDHIST      553
#DEFINE FP_A1_IDHIST      554
#DEFINE FP_A2_IDHIST      555
#DEFINE FP_B1_IDHIST      556
#DEFINE FP_B5_IDHIST      557
#DEFINE FP_BZ_IDHIST      558
#DEFINE FP_ED_IDHIST      559
#DEFINE FP_FB_IDHIST      560
#DEFINE FP_FC_IDHIST      561
#DEFINE FP_F1_IDSA1       562
#DEFINE FP_F1_IDSA2       563
#DEFINE FP_F1_IDSED       564
#DEFINE FP_F2_IDSA1       565
#DEFINE FP_F2_IDSA2       566
#DEFINE FP_F2_IDSED       567
#DEFINE FP_D1_IDSF4       568
#DEFINE FP_D1_IDSF7       569
#DEFINE FP_D1_IDSB1       570
#DEFINE FP_D1_IDSBZ       571
#DEFINE FP_D1_IDSB5       572
#DEFINE FP_D2_IDSF4       573
#DEFINE FP_D2_IDSF7       574
#DEFINE FP_D2_IDSB1       575
#DEFINE FP_D2_IDSBZ       576
#DEFINE FP_D2_IDSB5       577
#DEFINE FP_FT_DS43080     578
#DEFINE FP_FT_DESCTOT     579
#DEFINE FP_FT_ACRESCI     580
#DEFINE FP_F4_DEVPARC     581
#DEFINE FP_B5_ALIMEN      582
#DEFINE FP_F4_ALIMEN      583
#DEFINE FP_F4_PERCATM     584
#DEFINE FP_F4_DICMFUN     585
#DEFINE FP_F4_MALQPIS     586
#DEFINE FP_D1_VALPMAJ     587
#DEFINE FP_FT_MALQPIS     588
#DEFINE FP_FT_MVALPIS     589
#DEFINE FP_F4_IMPIND      590
#DEFINE FP_F4_OPERGAR     591
#DEFINE FP_F4_FRETISS     592
#DEFINE FP_BI_MEPLES      593
#DEFINE FP_B1_MEPLES      594
#DEFINE FP_S4_CHASSI      595
#DEFINE FP_S4_VLRISC      596
#DEFINE FP_S4_VMINDET     597
#DEFINE FP_S4_CODIF       598
#DEFINE FP_CFC_MGLQST     599
#DEFINE FP_CFC_ALQSTL     600
#DEFINE FP_F4_STLIQ       601
#DEFINE FP_S9_MGLQST      602
#DEFINE FP_S9_ALQSTL      603
#DEFINE FP_ED_CALCCID     604
#DEFINE FP_ED_PERCCID     605
#DEFINE FP_ED_BASECID     606
#DEFINE FP_A2_RECCIDE     607
#DEFINE FP_F7_SITTRIB     608
#DEFINE FP_F7_ORIGEM      609
#DEFINE FP_S1_SITTRIB     610
#DEFINE FP_S1_ORIGEM      611
#DEFINE FP_CFC_MARGEM     612
#DEFINE FP_S9_MARGEM      613
#DEFINE FP_A1_FRETISS     614
#DEFINE FP_F4_CV139       615
#DEFINE FP_FT_CV139       616
#DEFINE FP_F4_RFETALG     617
#DEFINE FP_CFC_ALFCPO     618
#DEFINE FP_S9_ALFCPO      619
#DEFINE FP_CFC_FCPAUX     620
#DEFINE FP_S9_FCPAUX      621
#DEFINE FP_CFC_FCPXDA     622
#DEFINE FP_S9_FCPXDA      623
#DEFINE FP_CFC_FCPINT     624
#DEFINE FP_S9_FCPINT      625
#DEFINE FP_D1_BASNDES     626
#DEFINE FP_D1_ICMNDES     627
#DEFINE FP_CFC_CODPRD     628
#DEFINE FP_D2_IDCFC       629
#DEFINE FP_D1_IDCFC       630
#DEFINE FP_F4_PARTICM     631
#DEFINE FP_CD2_PARTIC     632
#DEFINE FP_CC7_CODREF     633
#DEFINE FP_CFC_RDCTIM     634
#DEFINE FP_F4_BSICMRE     635
#DEFINE FP_B1_UPRC        636
#DEFINE FP_F4_ALICRST     637
#DEFINE FP_F4_TRANFIL     638
#DEFINE FP_CC2_BASISS     639
#DEFINE FP_ED_IRRFCAR     640
#DEFINE FP_ED_BASEIRC     641
#DEFINE FP_F7_MSBLQD      642
#DEFINE FP_MV_PAUTFOB     643
#DEFINE FP_CC2_CPOM       644
#DEFINE FP_IPIVFCF        645
#DEFINE FP_BASECPM        646
#DEFINE FP_ALQCPM         647
#DEFINE FP_VALCPM         648
#DEFINE FP_F4_RDBSICM     649
#DEFINE FP_BASEFMP        650
#DEFINE FP_VALFMP         651
#DEFINE FP_ALQFMP         652
#DEFINE FP_CALCFMP        653
#DEFINE FP_PERQFMP        654
#DEFINE FP_VALFMD         655 //FIELDPOS DO CAMPO F3_VALFMD
#DEFINE FP_AFAMAD         656
#DEFINE FP_A2_RECFMD      657
#DEFINE FP_A1_RECFMD      658
#DEFINE FP_CFAMAD         659
#DEFINE FP_FT_BSEFMD      660
#DEFINE FP_FT_ALQFMD      661
#DEFINE FP_FT_VALFMD      662
#DEFINE FP_F4_DESCISS     663
#DEFINE FP_CE0_VL197      664
#DEFINE FP_CDA_VL197      665
#DEFINE FP_CC2_TPDIA      666
#DEFINE FP_F4_OUTPERC     667
#DEFINE FP_F4_PISMIN      668
#DEFINE FP_F4_COFMIN      669
#DEFINE FP_F4_IPIMIN      670
#DEFINE FP_B1_CONV        671
#DEFINE FP_BZ_PPIS        672
#DEFINE FP_BZ_PCOFINS     673
#DEFINE FP_F4_CUSENTR     674
#DEFINE FP_A1_INCLTMG     675
#DEFINE FP_BI_ALFECMG     676
#DEFINE FP_MV_MVAFBI      677
#DEFINE FP_MV_MVAFRP      678
#DEFINE FP_MV_MVAFRE      679
#DEFINE FP_MV_MVAFRU      680
#DEFINE FP_MV_MVAFS1      681
#DEFINE FP_MV_MVAFRU      682
#DEFINE FP_MV_MVAFRC      683
#DEFINE FP_MV_MVAFBC      684
#DEFINE FP_CFC_MVAES      685
#DEFINE FP_S9_MVAES       686
#DEFINE FP_FT_SERSAT      687
#DEFINE FP_F3_SERSAT      688
#DEFINE FP_CC7_CLANC      689
#DEFINE FP_CDA_CLANC      690
#DEFINE FP_FT_BASNDES     691
#DEFINE FP_FT_ICMNDES     692
#DEFINE FP_F3_BASNDES     693
#DEFINE FP_F3_ICMNDES     694
#DEFINE FP_B1_GRPCST      695
#DEFINE FP_F4_GRPCST      696
#DEFINE FP_FT_GRPCST      697
#DEFINE FP_CD2_GRPCST     698
#DEFINE FP_F4_IPIPECR     699
#DEFINE FP_F4_TXAPIPI     700
#DEFINE FP_B1_CEST        701
#DEFINE FP_FT_CEST        702
#DEFINE FP_CD2_CEST       703
#DEFINE FP_F4_CALCCPB     704
#DEFINE FP_D1_BASECPB     705
#DEFINE FP_D1_VALCPB      706
#DEFINE FP_D1_ALIQCPB     707
#DEFINE FP_D2_BASECPB     708
#DEFINE FP_D2_VALCPB      709
#DEFINE FP_D2_ALIQCPB     710
#DEFINE FP_F3_BASECPB     711
#DEFINE FP_F3_VALCPB      712
#DEFINE FP_F3_ALIQCPB     713
#DEFINE FP_FT_BASECPB     714
#DEFINE FP_FT_VALCPB      715
#DEFINE FP_FT_ALIQCPB     716
#DEFINE FP_B5_CODATIV     717
#DEFINE FP_FT_ATIVCPB     718
#DEFINE FP_CG1_ALIQ       719
#DEFINE FP_CD2_PICMDF     720
#DEFINE FP_F3_SERSAT      721
#DEFINE FP_FT_SERSAT      722
#DEFINE FP_FT_DIFAL       723
#DEFINE FP_F3_DIFAL       724
#DEFINE FP_F4_DIFAL       725
#DEFINE FP_CD2_PDDES      726
#DEFINE FP_CD2_PDORI      727
#DEFINE FP_CD2_VDDES      728
#DEFINE FP_CD2_ADIF       729
#DEFINE FP_CD2_PFCP       730
#DEFINE FP_CD2_VFCP       731
#DEFINE FP_FT_PDORI       732
#DEFINE FP_FT_PDDES       733
#DEFINE FP_FT_VFCPDIF     734
#DEFINE FP_F3_VFCPDIF     735
#DEFINE FP_FT_BASEDES     736
#DEFINE FP_F3_BASEDES     737
#DEFINE FP_BI_CEST        738
#DEFINE FP_CD2_DESONE     739
#DEFINE FP_F4_BASCMP      740
#DEFINE FP_CD2_PDEVOL     741
#DEFINE FP_A2_CONTRIB     742
#DEFINE FP_F4_DUPLIPI     743
#DEFINE FP_D1_ALIQCMP     744
#DEFINE FP_D2_ALIQCMP     745
#DEFINE FP_F4_TXAPIPI     746
#DEFINE FP_A1_SIMPNAC     747
#DEFINE FP_F4_FTRICMS     748
#DEFINE FP_D2_FTRICMS     749
#DEFINE FP_FT_FTRICMS     750
#DEFINE FP_D2_VRDICMS     751
#DEFINE FP_FT_VRDICMS     752
#DEFINE FP_D1_FTRICMS     753
#DEFINE FP_D1_VRDICMS     754
#DEFINE FP_F3_BSICMOR     755
#DEFINE FP_FT_BSICMOR     756
#DEFINE FP_F4_AGRISS      757
#DEFINE FP_F4_CFUNDES     758
#DEFINE FP_F4_CIMAMT      759
#DEFINE FP_F4_CFASE       760
#DEFINE FP_B1_AFUNDES     761
#DEFINE FP_B1_AIMAMT      762
#DEFINE FP_B1_AFASEMT     763
#DEFINE FP_A1_RFUNDES     764
#DEFINE FP_A1_RIMAMT      765
#DEFINE FP_A1_RFASEMT     766
#DEFINE FP_A2_RFUNDES     767
#DEFINE FP_A2_RIMAMT      768
#DEFINE FP_A2_RFASEMT     769
#DEFINE FP_F1_VALFUND     770
#DEFINE FP_F1_VALIMA      771
#DEFINE FP_F1_VALFASE     772
#DEFINE FP_F2_VALFUND     773
#DEFINE FP_F2_VALIMA      774
#DEFINE FP_F2_VALFASE     775
#DEFINE FP_D1_VALFUND     776
#DEFINE FP_D1_BASFUND     777
#DEFINE FP_D1_ALIFUND     778
#DEFINE FP_D1_VALIMA      779
#DEFINE FP_D1_BASIMA      780
#DEFINE FP_D1_ALIIMA      781
#DEFINE FP_D1_VALFASE     782
#DEFINE FP_D1_BASFASE     783
#DEFINE FP_D1_ALIFASE     784
#DEFINE FP_D2_VALFUND     785
#DEFINE FP_D2_BASFUND     786
#DEFINE FP_D2_ALIFUND     787
#DEFINE FP_D2_VALIMA      788
#DEFINE FP_D2_BASIMA      789
#DEFINE FP_D2_ALIIMA      790
#DEFINE FP_D2_VALFASE     791
#DEFINE FP_D2_BASFASE     792
#DEFINE FP_D2_ALIFASE     793
#DEFINE FP_FT_VALFUND     794
#DEFINE FP_FT_BASFUND     795
#DEFINE FP_FT_ALIFUND     796
#DEFINE FP_FT_VALIMA      797
#DEFINE FP_FT_BASIMA      798
#DEFINE FP_FT_ALIIMA      799
#DEFINE FP_FT_VALFASE     800
#DEFINE FP_FT_BASFASE     801
#DEFINE FP_FT_ALIFASE     802
#DEFINE FP_F3_VALFUND     803
#DEFINE FP_F3_VALIMA      804
#DEFINE FP_F3_VALFASE     805
#DEFINE FP_FT_PRCMEDP     806
#DEFINE FP_F3_PRCMEDP     807
#DEFINE FP_F0RIND         808
#DEFINE FP_F4_INDVF       809
#DEFINE FP_FTIND          810
#DEFINE FP_CFC_ADICST     811
#DEFINE FP_SS9_ADICST     812
#DEFINE FP_FT_TAFKEY      813
#DEFINE FP_F4_AGRPEDG     814
#DEFINE FP_FT_VALPEDG     815
#DEFINE FP_F3_VALPEDG     816
#DEFINE FP_CFC_PICM       817
#DEFINE FP_S9_PICM        818
#DEFINE FP_B5_VLRCID      819
#DEFINE FP_S5_VLRCID      820
#DEFINE FP_F4_CSOSN       821
#DEFINE FP_FT_CSOSN       822
#DEFINE FP_A2_CALCINP     823
#DEFINE FP_ED_CALCINP     824
#DEFINE FP_ED_PERCINP     825
#DEFINE FP_D1_BASEINP     826
#DEFINE FP_FT_BASEINP     827
#DEFINE FP_F3_BASEINP     828
#DEFINE FP_D1_PERCINP     829
#DEFINE FP_FT_PERCINP     830
#DEFINE FP_F3_PERCINP     831
#DEFINE FP_D1_VALINP      832
#DEFINE FP_FT_VALINP      833
#DEFINE FP_F3_VALINP      834
#DEFINE FP_FT_CNAE        835
#DEFINE FP_FT_TRIBMUN     836
#DEFINE FP_FT_CLIDEST     837
#DEFINE FP_FT_LOJDEST     838
#DEFINE FP_CE1_TRIBMU     839
#DEFINE FP_CE1_CNAE       840
#DEFINE FP_CE1_RMUISE     841
#DEFINE FP_BI_TRIBMUN     842
#DEFINE FP_B1_TRIBMUN     843
#DEFINE FP_S4_TRIBMUN     844
#DEFINE FP_F3_CNAE        845
#DEFINE FP_F3_TRIBMUN     846
#DEFINE FP_F1_ADIANT      847
#DEFINE FP_B1_B1PISST     848
#DEFINE FP_B1_B1COFST     849
#DEFINE FP_CFC_VLICMP     850
#DEFINE FP_CFC_VL_ICM     851
#DEFINE FP_S9_VLICMP      852
#DEFINE FP_S9_VL_ICM      853
#DEFINE FP_CDA_CODREF     854
#DEFINE FP_FT_VOPDIF      855
#DEFINE FP_D1_BASEPRO     856
#DEFINE FP_D2_BASEPRO     857
#DEFINE FP_FT_BASEPRO     858
#DEFINE FP_D1_ALIQPRO     859
#DEFINE FP_D2_ALIQPRO     860
#DEFINE FP_FT_ALIQPRO     861
#DEFINE FP_D1_VALPRO      862
#DEFINE FP_D2_VALPRO      863
#DEFINE FP_FT_VALPRO      864
#DEFINE FP_F4_ALIQPRO     865
#DEFINE FP_FT_ICMSDIF     866
#DEFINE FP_SM2_IND        867
#DEFINE FP_D1_BASFEEF     868
#DEFINE FP_D2_BASFEEF     869
#DEFINE FP_FT_BASFEEF     870
#DEFINE FP_D1_ALQFEEF     871
#DEFINE FP_D2_ALQFEEF     872
#DEFINE FP_FT_ALQFEEF     873
#DEFINE FP_D1_VALFEEF     874
#DEFINE FP_D2_VALFEEF     875
#DEFINE FP_FT_VALFEEF     876
#DEFINE FP_F4_ALQFEEF     877
#DEFINE FP_FT_NFISCAN     878
#DEFINE FP_F3_NFISCAN     879
#DEFINE FP_A2_DEDBSPC     880
#DEFINE FP_F4_DEDDIF      881
#DEFINE FP_F4_FCALCPR     882
#DEFINE FP_CFC_VL_ANT     883
#DEFINE FP_F4_DIFALPC     884
#DEFINE FP_D1_VOPDIF      885
#DEFINE FP_D2_VOPDIF      886
#DEFINE FP_FT_TES         887
#DEFINE FP_A2_TIPORUR     888
#DEFINE FP_CDA_GUIA       889
#DEFINE FP_CDA_UFGNRE     890
#DEFINE FP_CDA_GNRE       891
#DEFINE FP_CC7_GUIA       892
#DEFINE FP_A1_RECIRRF     893
#DEFINE FP_BZ_PAUTFOB     894 //Verifica se o campo informado no parãmetro MV_PAUTFOB existe na tabela SBZ
#DEFINE FP_F4_COLVDIF     895
#DEFINE FP_FT_COLVDIF     896
#DEFINE FP_F4_STREDU      897
#DEFINE FP_D1_ALFCPST     898
#DEFINE FP_D1_BFCPANT     899
#DEFINE FP_D1_AFCPANT     900
#DEFINE FP_D1_VFCPANT     901
#DEFINE FP_D1_ALQNDES     902
#DEFINE FP_D2_ALFCPST     903
#DEFINE FP_FT_ALFCPST     904
#DEFINE FP_FT_BFCPANT     905
#DEFINE FP_FT_AFCPANT     906
#DEFINE FP_FT_VFCPANT     907
#DEFINE FP_FT_ALQNDES     908
#DEFINE FP_FT_ALFCCMP     909
#DEFINE FP_CD2_BFCP       910
#DEFINE FP_D1_ALQFECP     911
#DEFINE FP_D2_ALQFECP     912
#DEFINE FP_D1_VALFECP     913
#DEFINE FP_D2_VALFECP     914
#DEFINE FP_D1_VFECPST     915
#DEFINE FP_D2_VFECPST     916
#DEFINE FP_D1_VFCPDIF     917
#DEFINE FP_D2_VFCPDIF     918
#DEFINE FP_CFC_BFCPPR     919
#DEFINE FP_CFC_BFCPST     920
#DEFINE FP_CFC_BFCPCM     921
#DEFINE FP_CFC_AFCPST     922
#DEFINE FP_D1_BASFECP     923
#DEFINE FP_D1_BSFCPST     924
#DEFINE FP_D1_BSFCCMP     925
#DEFINE FP_D2_BASFECP     926
#DEFINE FP_D2_BSFCPST     927
#DEFINE FP_D2_BSFCCMP     928
#DEFINE FP_FT_BASFECP     929
#DEFINE FP_FT_BSFCPST     930
#DEFINE FP_FT_BSFCCMP     931
#DEFINE FP_D1_FCPAUX      932
#DEFINE FP_D2_FCPAUX      933
#DEFINE FP_FT_FCPAUX      934
#DEFINE FP_F3_CLIDVMC     935
#DEFINE FP_F3_LOJDVMC     936
#DEFINE FP_FT_CLIDVMC     937
#DEFINE FP_FT_LOJDVMC     938
#DEFINE FP_F1_DEVMERC     939
#DEFINE FP_CDA_ORIGEM     940
#DEFINE FP_CC7_CODIPI     941
#DEFINE FP_CFC_ALFEEF     942
#DEFINE FP_F4_FEEF        943
#DEFINE FP_F7_PAUTFOB     944
#DEFINE FP_CFC_PAUTFB     945
#DEFINE FP_S9_PAUTFOB     946
#DEFINE FP_S1_PAUTFOB     947
#DEFINE FP_F4_BICMCMP     948
#DEFINE FP_BZ_AFUNDES     949
#DEFINE FP_F4_CSENAR      950
#DEFINE FP_F4_CINSS       951
#DEFINE FP_FT_SECP15      952
#DEFINE FP_FT_BSCP15      953
#DEFINE FP_FT_ALCP15      954
#DEFINE FP_FT_VLCP15      955
#DEFINE FP_FT_SECP20      956
#DEFINE FP_FT_BSCP20      957
#DEFINE FP_FT_ALCP20      958
#DEFINE FP_FT_VLCP20      959
#DEFINE FP_FT_SECP25      960
#DEFINE FP_FT_BSCP25      961
#DEFINE FP_FT_ALCP25      962
#DEFINE FP_FT_VLCP25      963
#DEFINE FP_B1_ALCPESP     964
#DEFINE FP_F7_BASCMP      965
#DEFINE FP_A2_GROSSIR     966
#DEFINE FP_F4_APLREPC     967
#DEFINE FP_S6_TRIBMUN     968
#DEFINE FP_BZ_TRIBMUN     969
#DEFINE FP_F3K_CODREF     970
#DEFINE FP_F3K_CST        971
#DEFINE FP_CDV_NUMITE     972
#DEFINE FP_CDV_SEQ        973
#DEFINE FP_CDV_TPMOVI     974
#DEFINE FP_CDV_ID         975
#DEFINE FP_CDV_ESPECI     976
#DEFINE FP_CDV_FORMUL     977
#DEFINE FP_F4_INDISEN     978
#DEFINE FP_FT_INDISEN     979
#DEFINE FP_FT_INFITEM     980
#DEFINE FP_F4_INFITEM     981
#DEFINE FP_FT_BSCPM       982
#DEFINE FP_FT_ALCPM       983
#DEFINE FP_FT_VLCPM       984
#DEFINE FP_D2_IDTRIB      985
#DEFINE FP_D1_IDTRIB      986
#DEFINE FP_FT_IDTRIB      987
#DEFINE FP_CE0_TRGEN      988
#DEFINE FP_D1_OPER        989
#DEFINE FP_FT_BASEFUN     990
#DEFINE FP_FT_VALFUN      991
#DEFINE FP_FT_ALIQFUN     992
#DEFINE FP_FT_BICEFET     993
#DEFINE FP_FT_ICEFET      994
#DEFINE FP_FT_VICEFET     995
#DEFINE FP_FT_RICEFET     996
#DEFINE FP_FT_BSTANT      997
#DEFINE FP_FT_PSTANT      998
#DEFINE FP_FT_VSTANT      999
#DEFINE FP_FT_VICPRST     1000
#DEFINE FP_FT_BFCANTS     1001
#DEFINE FP_FT_PFCANTS     1002
#DEFINE FP_FT_VFCANTS     1003
#DEFINE FP_B1_GRUPO       1004
#DEFINE FP_FT_BASECPR     1005
#DEFINE FP_CDV_NFE        1006
#DEFINE FP_CDV_ZERAVL     1007
#DEFINE FP_FT_DESCFIS     1008
#DEFINE FP_F3_DESCFIS     1009
#DEFINE FP_F7_ALQANT      1010
#DEFINE FP_CFC_ALQANT     1011
#DEFINE FP_S9_ALQANT      1012
#DEFINE FP_S1_ALQANT      1013
#DEFINE FP_F3K_GRCLAN     1014
#DEFINE FP_F3K_GRPLAN     1015
#DEFINE FP_F3K_GRFLAN     1016
#DEFINE FP_F3K_IFCOMP     1017
#DEFINE FP_F3K_CODLAN     1018
#DEFINE FP_CDY_DTINI      1019
#DEFINE FP_CDY_DTFIM      1020
#DEFINE FP_F2B_RND        1021
#DEFINE FP_F3K_PROD       1022
#DEFINE FP_F3K_CFOP       1023
#DEFINE FP_F7_GRTRIB      1024
#DEFINE FP_F7_GRPCLI      1025
#DEFINE FP_S1_GRTRIB      1026
#DEFINE FP_F3_CLIEFOR     1027
#DEFINE FP_F3_LOJA        1028
#DEFINE FP_F22_CLIFOR     1029
#DEFINE FP_F22_LOJA       1030
#DEFINE FP_F13_FIMVIG     1031
#DEFINE FP_E2_CODRET      1032
#DEFINE FP_D2_ITEM        1033
#DEFINE FP_F3_OBSERV      1034
#DEFINE FP_FT_OBSERV      1035
#DEFINE FP_A1_CGC         1036
#DEFINE FP_F3_NFISCAL     1037
#DEFINE FP_CD2_ITEM       1038
#DEFINE FP_CD2_IMP        1039
#DEFINE FP_CFC_CODPRD     1040
#DEFINE FP_CC8_CODIGO     1041
#DEFINE FP_CC7_CODLAN     1042
#DEFINE FP_CDA_NUMITE     1043



// Referencias dos ALIASINDIC
Static AI_CC6     := 01
Static AI_CC7     := 02
Static AI_CD2     := 03
Static AI_CD3     := 04
Static AI_CD4     := 05
Static AI_CD5     := 06
Static AI_CD6     := 07
Static AI_CD7     := 08
Static AI_CD8     := 09
Static AI_CD9     := 10
Static AI_CDA     := 11
Static AI_CDC     := 12
Static AI_CDD     := 13
Static AI_CDE     := 14
Static AI_CDF     := 15
Static AI_CDG     := 16
Static AI_CDO     := 17
Static AI_CE0     := 18
Static AI_MDL     := 19
Static AI_SFT     := 20
Static AI_SFU     := 21
Static AI_SFX     := 22
Static AI_CE1     := 23
Static AI_CC2     := 24
Static AI_CFC     := 25
Static AI_SS9     := 26
Static AI_CG1     := 27
Static AI_F0R     := 28
Static AI_F13     := 29
Static AI_F3K     := 30
Static AI_CDV     := 31
Static AI_CLI     := 32
Static AI_F20     := 33
Static AI_F21     := 34
Static AI_F22     := 35
Static AI_F23     := 36
Static AI_F24     := 37
Static AI_F25     := 38
Static AI_F26     := 39
Static AI_F27     := 40
Static AI_F28     := 41
Static AI_F29     := 42
Static AI_F2A     := 43
Static AI_F2B     := 44
Static AI_F2C     := 45
Static AI_F2D     := 46

// Referencias da amarracao UF x UF
Static UF_ALIQFECP     := 01  //Aliquota do Fecp - UF Destino
Static UF_MARGSTLIQ    := 02  //Margem Liquida ST
Static UF_ALIQSTLIQ    := 03  //Aliquota ST Liquida
Static UF_MARGEM       := 04  //Margem de Valor Agregado
Static UF_ALQFCPO      := 05  //Aliquota do Fecp - UF Origem
Static UF_FECPAUX      := 06  //Indice Auxiliar para calculo do Fecp
Static UF_FECPDIF      := 07  //Indica majoracao da aliquota do ICMS Diferencial de Aliquotas
Static UF_FECPINT      := 08  //Indica majoracao para operacoes internas (exceto Consumidor Final)
Static UF_RDCTIMP      := 09  //Redução de Carga Tribuária de ICMS-Importação DECRETO 34.560/2010
Static UF_MVAFRU       := 10  //MVA em operação de Frete
Static UF_MVAES        := 11  //Indica se o MVA deve ser utilizado apenas nas entradas, nas saídas, ou em ambos os casos
Static UF_ADICST       := 12  //Alíquita de ST líquida utilizado para entradas de merc. oriundas de fornecedor do simples nacional
Static UF_PICM         := 13  //Alíquita de ICMS
Static UF_VLICMP       := 14  //Valor ICMS Proprio de Pauta
Static UF_VL_ICM       := 15  //Valor ICMS de Pauta
Static UF_VL_ANT       := 16  //Valor de Pauta do ICMS Antecipacao
Static UF_BS_FCPPR     := 17  // Base de cálculo do FECP - Proprio.
Static UF_BS_FCPST     := 18  // Base de cálculo do FECP - ST.
Static UF_BS_FCPCM     := 19  // Base de cálculo do FECP - Complementar.
Static UF_AFCPST       := 20  // Origem da aliquota do FCP-ST.
Static UF_ALFEEF       := 21  // Alíquota FEEF
Static UF_PAUTFOB      := 22  //Valor Pauta FOB
Static UF_ALANTICMS    := 23  //Aliquota da antecipacao de ICMS - Proprio
Static NMAXUF          := 23  //Numero maximo da amarracao UF x UF

// Referencias da amarracao UF x UF x Produto
Static UFP_ALIQFECP    := 01  //Aliquota do Fecp - UF Destino
Static UFP_MARGSTLIQ   := 02  //Margem Liquida ST
Static UFP_ALIQSTLIQ   := 03  //Aliquota ST Liquida
Static UFP_MARGEM      := 04  //Margem de Valor Agregado
Static UFP_ALQFCPO     := 05  //Aliquota do Fecp - UF Origem
Static UFP_FECPAUX     := 06  //Indice Auxiliar para calculo do Fecp
Static UFP_FECPDIF     := 07  //Indica majoracao da aliquota do ICMS Diferencial de Aliquotas
Static UFP_FECPINT     := 08  //Indica majoracao para operacoes internas (exceto Consumidor Final)
Static UFP_RDCTIMP     := 09  ////Redução de Carga Tribuária de ICMS-Importação DECRETO 34.560/2010
Static UFP_MVAFRU      := 10  // Margem sobre operação com frete
Static UFP_MVAES       := 11  //Indica se o MVA deve ser utilizado apenas nas entradas, nas saídas, ou em ambos os casos
Static UFP_ADICST      := 12  //Alíquita de ST líquida utilizado para entradas de merc. oriundas de fornecedor do simples nacional
Static UFP_PICM        := 13  //Alíquita de ICMS
Static UFP_VLICMP      := 14  //Valor ICMS Proprio de Pauta
Static UFP_VL_ICM      := 15  //Valor ICMS de Pauta
Static UFP_VL_ANT      := 16  // Valor de pauta do ICMS antecipacao
Static UFP_BS_FCPPR    := 17  // Base de cálculo do FECP - Proprio.
Static UFP_BS_FCPST    := 18  // Base de cálculo do FECP - ST.
Static UFP_BS_FCPCM    := 19  // Base de cálculo do FECP - Complementar.
Static UFP_AFCPST      := 20  // Origem da aliquota do FCP-ST.
Static UFP_ALFEEF      := 21  // Alíquota FEEF
Static UFP_PAUTFOB     := 22  //Valor Pauta FOB
Static UFP_ALANTICMS   := 23  //Aliquota da antecipacao de ICMS - Proprio
Static NMAXUFP         := 23  //Numero maximo da amarracao UF x UF x Produto

// Referencias das alíquotas de ICMS/ISS do SIMPLES NACIONAL calculadas pela apuração

Static SN_CFOP       := 01
Static SN_CODISS     := 02
Static SN_GRUPO      := 03
Static SN_ALIQ       := 04

// Referências dos tributos do Array aTrbGen
Static TG_SIGLA      := 01
Static TG_REFERENCIA := 02

// Referencias dos tributos genéricos do cabeçalho (NF_TRIBGEN)

Static TG_NF_SIGLA     	:= 01
Static TG_NF_BASE      	:= 02
Static TG_NF_VALOR     	:= 03
Static TG_NF_REGRA_FIN 	:= 04
Static TG_NF_ID_REGRA  	:= 05
Static TG_NF_ALQ_CODURF := 06
Static TG_NF_ALQ_PERURF := 07

Static NMAX_NF_TG    := 07

// Referencias dos tributos genéricos do item (IT_TRIBGEN)

Static TG_IT_SIGLA      := 01
Static TG_IT_DESCRICAO  := 02
Static TG_IT_BASE       := 03
Static TG_IT_ALIQUOTA   := 04
Static TG_IT_VALOR      := 05
Static TG_IT_REGRA_BAS  := 06
Static TG_IT_REGRA_ALQ  := 07
Static TG_IT_REGRA_FIN  := 08
Static TG_IT_ID_REGRA   := 09
Static TG_IT_RND        := 10
Static TG_IT_ITEMDEC    := 11 //Array com valores equivalente ao aItemDec
Static TG_IT_IDTRIB     := 12

Static NMAX_IT_TG       := 12

// Referencias das regras de base de cálculo (TG_REGRA_BAS) - Tributos Genéricos

Static TG_BAS_COD     := 01
Static TG_BAS_VLORI   := 02
Static TG_BAS_DESCON  := 03
Static TG_BAS_FRETE   := 04
Static TG_BAS_SEGURO  := 05
Static TG_BAS_DESP    := 06
Static TG_BAS_ICMSDES := 07
Static TG_BAS_ICMSST  := 08
Static TG_BAS_REDUCAO := 09
Static TG_BAS_TPRED   := 10
Static TG_BAS_UM      := 11
Static TG_BAS_ID      := 12

Static NMAXTGBAS      := 12

// Referencias das regas de alíquota (TG_REGRA_ALQ) - Tributos Genéricos

Static TG_ALQ_COD    := 01
Static TG_ALQ_VLORI  := 02
Static TG_ALQ_TPALIQ := 03
Static TG_ALQ_ALIQ   := 04
Static TG_ALQ_CODURF := 05
Static TG_ALQ_PERURF := 06
Static TG_ALQ_VALURF := 07
Static TG_ALQ_ID     := 08

Static NMAXTGALQ     := 08

// Referencias das regras financeiras (TG_REGRA_FIN) - Tributos Genéricos

Static NMAXTGFIN     := 00

//Referências das informações de ressarcimento IT_RESSARC
Static RI_PRODUTO          	:= 01
Static RI_ICMS_ANT_UNIT    	:= 02
Static RI_BASE_ANT_UNIT    	:= 03
Static RI_PERC_ANT_UNIT    	:= 04
Static RI_ICMS_SUBST_UNIT  	:= 05
Static RI_BASE_FCP_ANT_UNIT := 06
Static RI_PERC_FCP_ANT_UNIT := 07
Static RI_FCP_ANT_UNIT      := 08

Static NMAXRC         		:= 08

//Referências das informações de para enquadramento codigo valor declaratorio e codigo de ajuste IT_CDDECL_AJU
Static CD_PRODUTO      := 01
Static CD_CFOP         := 02
Static CD_CST          := 03
Static CD_CODCLIFOR    := 04
Static CD_CLIFOR       := 05

Static NMAXCDDECL      := 05

//Referências com os Ids dos tributos legados disponíveis no configurador de tributos
Static TRIB_ID_AFRMM      := "000004"
Static TRIB_ID_FABOV      := "000005"
Static TRIB_ID_FACS       := "000006"
Static TRIB_ID_FAMAD      := "000007"
Static TRIB_ID_FASEMT     := "000008"
Static TRIB_ID_FETHAB     := "000009"
Static TRIB_ID_FUNDERSUL  := "000010"
Static TRIB_ID_FUNDESA    := "000011"
Static TRIB_ID_IMAMT      := "000012"
Static TRIB_ID_SEST       := "000013"
Static TRIB_ID_TPDP       := "000014"

//Posição dos tributos no mecanismo de verificação de prioridade entre Tributo Legado x Tributo Genérico.
Static AFRMM      := 1
Static FABOV      := 2
Static FACS       := 3
Static FAMAD      := 4
Static FASEMT     := 5
Static FETHAB     := 6
Static FUNDERSUL  := 7
Static FUNDESA    := 8
Static IMAMT      := 9
Static SEST       := 10
Static TPDP       := 11

// Referencias dos FindFunction
Static FF_FISXFABOV    := 1
Static FF_FISXFACS     := 2
Static FF_FISXFETHAB   := 3
Static FF_FISXFAMAD    := 4
Static FF_FISXIMA      := 5
Static FF_FISXFASE     := 6
Static FF_FISXFUNDESA  := 7
Static FF_FISXFNDSUL   := 8
Static FF_FISXTPDP     := 9
Static FF_FISXFUMIPQ   := 10
Static FF_FISXAFRMM    := 11
Static FF_FISXSEST     := 12
Static FF_FISXSENAR    := 13
Static FF_FISXCIDE     := 14
Static FF_FISXPROTEG   := 15
Static FF_FISXFUNRUR   := 16
Static FF_FISXBCFUN    := 17
Static FF_FISXINSS     := 18
Static FF_FISXIR       := 19
Static FF_FISIRFPF     := 20
Static FF_FISXCSLL     := 21
Static FF_FISXCPRB     := 22
Static FF_FISXFEEF     := 23
Static FF_FISXINSSPAT  := 24
Static FF_FISRECIR     := 25
Static FF_FISBASSOL    := 26
Static FF_FISALQSOL    := 27
Static FF_FISVALSOL    := 28
Static FF_FISVALDIFAL  := 29
Static FF_FISALQDIFAL  := 30
Static FF_FISCHKPDIF   := 31
Static FF_FISFECP      := 32
Static FF_xFisRtComp   := 33
Static FF_FISXAICMS    := 34
Static FF_FISXBICMS    := 35
Static FF_FISXVICMS    := 36
Static FF_FISXIPI      := 37
Static FF_FISXULTENT   := 38
Static FF_FISXMARGEM   := 39
Static FF_FISXRTCOMP   := 40
Static FF_FISXNAMEFCP  := 41
Static FF_FISXII       := 42
Static FF_FISXPIS      := 43
Static FF_FISXCOFINS   := 44
Static FF_FISXISS      := 45
Static FF_FISXSEEKCLI  := 46
Static FF_FISXISSBI    := 47
Static FF_FISXCRDPRE   := 48
Static FF_FISXDESCZF   := 49
Static FF_FISXDBST     := 50
Static FF_FISXDC5602   := 51
Static FF_FISXSITTRI   := 52

// Referencias de TamSx3
Static TAM_F3K_PROD   := 1
Static TAM_F3K_CFOP   := 2
Static TAM_F3K_CST    := 3
Static TAM_F7_GRTRIB  := 4
Static TAM_F7_GRPCLI  := 5
Static TAM_S1_GRTRIB  := 6
Static TAM_F3_CLIEFOR := 7  
Static TAM_F3_LOJA    := 8
Static TAM_F22_CLIFOR := 9
Static TAM_F22_LOJA   := 10
Static TAM_F13_FIMVIG := 11
Static TAM_D1_OPER    := 12
Static TAM_B1_TRIBMUN := 13
Static TAM_E2_FORNISS := 14
Static TAM_E2_LOJAISS := 15
Static TAM_E2_CODRET  := 16
Static TAM_B1_VLR_PIS := 17
Static TAM_B1_PPIS    := 18
Static TAM_D1_ITEM    := 19
Static TAM_CE1_TRIBMU := 20
Static TAM_CDA_NUMITE := 21
Static TAM_CDV_NUMITE := 22
Static TAM_D2_ITEM    := 23
Static TAM_F3_OBSERV  := 24
Static TAM_FT_OBSERV  := 25
Static TAM_A1_CGC     := 26
Static TAM_F3_NFISCAL := 27
Static TAM_CD2_ITEM   := 28
Static TAM_CD2_IMP    := 29
Static TAM_CFC_CODPRD := 30
Static TAM_CC8_CODIGO := 31
Static TAM_CC7_CODLAN := 32





