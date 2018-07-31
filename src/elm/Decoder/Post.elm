module Decoder.Post exposing (postListDecoder)

import Date exposing (Date)
import Date.Extra exposing (fromIsoString)
import Json.Decode exposing (Decoder, andThen, list, string)
import Json.Decode.Extra exposing (fromResult)
import Json.Decode.Pipeline exposing (decode, required)

import Model.Post exposing (Post)


postListDecoder : Decoder ( List Post )
postListDecoder =
  Json.Decode.at [ "data", "posts" ] <| list ( decode Post
    |> required "body" string
    |> required "created" date
    |> required "title" string
  )


-- PRIVATE


date : Decoder Date
date = string |> andThen (fromIsoString >> fromResult)
