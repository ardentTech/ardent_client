module Decoder.Post exposing (postListDecoder)

import Json.Decode exposing (Decoder, list, string)
import Json.Decode.Pipeline exposing (decode, required)

import Model.Post exposing (Post)


postListDecoder : Decoder ( List Post )
postListDecoder =
  Json.Decode.at [ "data", "posts" ] <| list ( decode Post
    |> required "body" string
    |> required "title" string
  )
