module Command.Post exposing (getPost, getPostList)

import Http exposing (encodeUri)

import Api exposing (Endpoint(Graph), pathForEndpoint)
import Decoder.Post exposing (postDecoder, postListDecoder)
import Message exposing (Msg(GetPost, GetPostList))
import Model exposing (Model)
import Rest exposing (getItem, getList)


getPost : Model -> Int -> Cmd Msg
getPost { docRoot } id =
  let
    query = "{post(id:" ++ toString id ++ "){body,created,id,title}}"
    url = ( docRoot ++ ( pathForEndpoint Graph ) ++ "?query=" ++ ( encodeUri query ))
  in
    getItem url postDecoder GetPost


getPostList : Model -> Cmd Msg
getPostList { docRoot } =
  let
    query = "{posts{body,created,id,title}}"
    url = ( docRoot ++ ( pathForEndpoint Graph ) ++ "?query=" ++ ( encodeUri query ))
  in
    getList url postListDecoder GetPostList
