module Rest exposing (errorString, getItem, getList, getListPaginate, post)

import Http exposing (Error(..))
import Json.Decode exposing (Decoder)
import Result exposing (Result)

import Decode exposing (Pagination, paginationDecoder)


errorString : Error -> String
errorString error =
  case error of
    BadUrl url -> "Bad Url: " ++ url
    Timeout -> "Http Timeout"
    NetworkError -> "Network Error"
    BadStatus response -> "Bad HTTP Status: " ++ toString response.status.code
    BadPayload msg response -> "Bad HTTP Payload: " ++ toString msg ++ " (" ++
      toString response.status.code ++ ")"


getItem : String -> Decoder a -> (Result Error a -> b) -> Cmd b
getItem url decoder resultToMsg =
  Http.send resultToMsg <| Http.get url decoder


getList : String -> Decoder (List a) -> (Result Error (List a) -> b) -> Cmd b
getList url listDecoder resultToMsg =
  Http.send resultToMsg <| Http.get url listDecoder


getListPaginate : String -> Decoder (List a) -> (Result Error (Pagination a) -> b) -> Cmd b
getListPaginate url listDecoder resultToMsg =
  Http.send resultToMsg <| Http.get url (paginationDecoder listDecoder)


post : String -> Decoder a -> (Result Error a -> b) -> Cmd b
post url decoder resultToMsg =
  Http.send resultToMsg <| Http.post url Http.emptyBody decoder
