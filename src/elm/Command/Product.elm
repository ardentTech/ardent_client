module Command.Product exposing (getProductList)

import Http exposing (encodeUri)

import Api exposing (Endpoint(Graph), pathForEndpoint)
import Decoder.Product exposing (productListDecoder)
import Message exposing (Msg(GetProductList))
import Model exposing (Model)
import Rest exposing (getList)


getProductList : Model -> Cmd Msg
getProductList { docRoot } =
  let
    query = "{products{serialNumber}}"
    url = ( docRoot ++ ( pathForEndpoint Graph ) ++ "?query=" ++ ( encodeUri query ))
  in
    getList url productListDecoder GetProductList
