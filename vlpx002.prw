#include 'protheus.ch'

/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

********************************************************
User Function VLPX002(nLimite)
********************************************************
Local nSegundos	:= 0
Local nNumAtual	:= 3
Local nRaiz		:= 0
Local nMembro	:= 0
Local aPrimos	:= {}

Default nLimite	:= 10001

nSegundos	:= SECONDS()

aAdd(aPrimos, 2)

While Len(aPrimos) < nLimite
	nRaiz	:= sqrt(nNumAtual)
	If Empty(AScan(aPrimos, {|nPrimo| nPrimo <= nRaiz .And. Empty(nNumAtual % nPrimo)}))
		aAdd(aPrimos, nNumAtual)
	EndIf

	nNumAtual++
EndDo

nMembro	:= aPrimos[Len(aPrimos)]

MsgInfo("O resultado processado em "+AllTrim(Str(SECONDS() - nSegundos))+" segundos e " + AllTrim(Str(nMembro)))

Return nMembro


********************************************************
User Function VLPX002T()
********************************************************
Local lOk	:= .T.

If U_VLPX002(6) <> 13
	lOk	:= .F.
	MsgStop("O teste unitario 001 falhou!")
EndIf

If lOk
	MsgInfo("Os testes unitarios foram bem sucedidos")
EndIf

Return lOk


