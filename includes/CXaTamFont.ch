//Array aTamFontes
Static nFS_FONTE	:= 01	AS Integer
Static nFS_WIDTH	:= 02	AS Integer
Static nFS_HEIGHT	:= 03	AS Integer
Static nFS_BOLD		:= 04	AS Integer
Static nFS_ITALIC 	:= 05	AS Integer
Static nFS_LFONTS	:= 06	AS Integer
Static nFS_TPFONT	:= 07	AS Integer
Static nFS_ATAMFON	:= 08	AS Integer

Static nFS_TAMTOT	:= 08	AS Integer

//Contante para determinar a altura da fonte na classe FWFontCst
Static nFS_FWFTHGT	:= -1	AS Integer

//Modos de calcular o tamanho da fonte
Static nTM_TMSPRINTER	:= 01	AS Integer
Static nTM_FWMSPRINTER	:= 02	AS Integer
Static nTM_FWFONTSIZE	:= 03	AS Integer


Static nTamNome		:= 30		AS Integer
Static nTamWidth	:= 5		AS Integer
Static nTamChar		:= 3		AS Integer
//                       Nome  +|+ Largura +|+  Altura +|+N+|+I+|+U+|+T+|+character
Static nTamChv		:= nTamNome+1+nTamWidth+1+nTamWidth+1+1+1+1+1+1+1+1+1+nTamChar		AS Integer

//Otimização!
#xTranslate _GetChave(<oFonte>,<nTpFonte>) => ;
		PadR(Upper(AllTrim(<oFonte>:Name)),nTamNome)+'|'+;
		StrZero(<oFonte>:nWidth,nTamWidth)+'|'+;
		StrZero(<oFonte>:nHeight,nTamWidth)+'|'+;
		Iif(<oFonte>:Bold	,'T','F')+'|'+;
		Iif(<oFonte>:Italic,'T','F')+'|'+;
		Iif(<oFonte>:Underline,'T','F')+'|'+;
		StrZero(<nTpFonte>,1)+'|'

//Otimização!
//#xTranslate _BuscaChave(<cChave>) => ;
//	IIF(jFontCache:hasProperty(<cChave>),jFontCache[<cChave>],0)
//O PRÉ-PROCESSADOR NÃO CONSEGUE PROCESSAR O COUCHETE!
