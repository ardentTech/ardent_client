module Command.Post exposing (getPostList)

import Http exposing (encodeUri)

import Api exposing (Endpoint(Graph), pathForEndpoint)
import Decoder.Post exposing (postListDecoder)
import Message exposing (Msg(GetPostList))
import Model exposing (Model)
import Rest exposing (getList)


getPostList : Model -> Cmd Msg
getPostList { docRoot } =
  let
    query = "{posts{body,title}}"
    url = ( docRoot ++ ( pathForEndpoint Graph ) ++ "?query=" ++ ( encodeUri query ))
  in
    getList url postListDecoder GetPostList
