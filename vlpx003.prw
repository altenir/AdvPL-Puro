#include 'protheus.ch'

/*
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
*/

********************************************************
User Function VLPX003(nLimite)
********************************************************
Local nX		:= 0
Local nSoma		:= 0
Local nSegundos	:= 0
Local nRet		:= 0
Local aTermos	:= {}

Default nLimite	:= 4000000

nSegundos	:= SECONDS()

AlimentaVt(aTermos, nLimite)
For nX := 1 To Len(aTermos)
	If Empty(aTermos[nX] % 2)
		nSoma	+= aTermos[nX]
	EndIf
Next nX

nRet	:= nSoma

MsgInfo("O resultado processado em "+AllTrim(Str(SECONDS() - nSegundos))+" segundos e " + AllTrim(Str(nRet)))

Return nRet


********************************************************
User Function VLPX003T()
********************************************************
Local lOk		:= .T.
Local aTermos	:= {}

//Validar se, para o valor máximo 89, temos 10 termos
AlimentaVt(aTermos, 90)
If Len(aTermos) <> 10
	lOk	:= .F.
	MsgStop("O teste unitario 001 falhou!")
EndIf

//Validar se a soma do valor máximo 89 é 44
If U_VLPX003(90) <> 44
	lOk	:= .F.
	MsgStop("O teste unitario 002 falhou!")
EndIf

If lOk
	MsgInfo("Os testes unitarios foram bem sucedidos")
EndIf

Return lOk


********************************************************
Static Function AlimentaVt(aTermos, nValLimite)
********************************************************
Local nElemento	:= 0
Local nPosUlt	:= 0
If Empty(aTermos)
	aTermos	:= {1,2}
Else
	nPosUlt		:= Len(aTermos)
	nElemento	:= aTermos[nPosUlt] + aTermos[nPosUlt - 1]
	If nElemento >= nValLimite
		Return Nil
	EndIf
	aAdd(aTermos, nElemento)
EndIf

AlimentaVt(aTermos, nValLimite)

Return Nil

