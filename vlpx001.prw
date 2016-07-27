#include 'protheus.ch'

/*
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*/

*****************************************************
User Function VLPX001(nLimite)
*****************************************************
Local nSoma	:= 0
Local nX	:= 0

Default nLimite	:= 1000

For nX := 1 To nLimite - 1
	If Empty(nX % 3) .Or. Empty(nX % 5)
		nSoma	+= nX
	EndIf
Next nX

MsgInfo("O resultado e " + AllTrim(Str(nSoma)))

Return nSoma


*****************************************************
User Function VLPX001T()
*****************************************************
Local lOk	:= .T.

If U_VLPX001(10) <> 23
	lOk	:= .F.
	MsgStop("O teste unitario 001 falhou!")
EndIf

If lOk
	MsgInfo("Os testes unitarios foram bem sucedidos.")
EndIf

Return lOk


