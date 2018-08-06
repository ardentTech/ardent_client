module Decoder.ContactMessage exposing (contactMessageDecoder)

import Json.Decode exposing (Decoder, int, string)
import Json.Decode.Pipeline exposing (decode, required)

import Model.ContactMessage exposing (ContactMessage)


contactMessageDecoder : Decoder ContactMessage
contactMessageDecoder =
  Json.Decode.at [ "data", "createContactMessage" ] <| ( decode ContactMessage
    |> required "body" string
    |> required "email" string
    |> required "name" string )
