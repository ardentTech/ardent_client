module Decoder.Post exposing (postDecoder, postListDecoder)

import Date exposing (Date)
import Date.Extra exposing (fromIsoString)
import Json.Decode exposing (Decoder, andThen, int, list, string)
import Json.Decode.Extra exposing (fromResult)
import Json.Decode.Pipeline exposing (decode, required)

import Model.Post exposing (Post)


postDecoder : Decoder Post
postDecoder =
  Json.Decode.at [ "data", "post" ] <| ( decode Post
    |> required "body" string
    |> required "created" date
    |> required "id" int
    |> required "title" string 
  )


postListDecoder : Decoder ( List Post )
postListDecoder =
  Json.Decode.at [ "data", "posts" ] <| list ( decode Post
    |> required "body" string
    |> required "created" date
    |> required "id" int
    |> required "title" string 
  )

-- PRIVATE


date : Decoder Date
date = string |> andThen (fromIsoString >> fromResult)
