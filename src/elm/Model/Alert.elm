module Model.Alert exposing (..)

import Http exposing (Error(..))


type Category = Error | Info | Success | Warning


type alias Alert = {
  body : String,
  category : Category,
  header : String
}


error : String -> String -> Alert
error header body = init Error header body


fromHttpError : Error -> Alert
fromHttpError error =
  let
    body = case error of
      BadUrl url -> "Bad Url: " ++ url
      Timeout -> "Http Timeout"
      NetworkError -> "Network Error"
      BadStatus response -> "Bad HTTP Status: " ++ toString response.status.code
      BadPayload msg response -> "Bad HTTP Payload: " ++ toString msg ++ " (" ++
        toString response.status.code ++ ")"
  in
    { body = body, category = Error, header = "The application encountered an error :(" }


info : String -> String -> Alert
info header body = init Info header body


init : Category -> String -> String -> Alert
init category header body = { body = body, category = category, header = header }


success : String -> String -> Alert
success header body = init Success header body


warning : String -> String -> Alert
warning header body = init Warning header body
