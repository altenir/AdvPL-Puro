#include 'protheus.ch'

*******************************************************
User Function VLPX004()
*******************************************************
Local cUrl			:= "http://numbersapi.com/random/trivia"
Local cGetParams	:= ""
Local nTimeOut		:= 200
Local aHeadStr		:= {"Content-Type: application/json"}
Local cheaderGet	:= ""
Local cRetorno		:= ""
Local oObjJson		:= Nil

cRetorno	:= HttpGet(cUrl, cGetParams, nTimeOut, aHeadStr, @cHeaderGet)
If !FWJsonDeserialize(cRetorno, @oObjJson)
	MsgStop("Ocorreu erro no processamento do Json")
	Return Nil
EndIf

MsgInfo("O valor "+oObjJson:type+" para o numero "+AllTrim(Str(oObjJson:number))+" equivale: " + oObjJson:text)

Return Nil


