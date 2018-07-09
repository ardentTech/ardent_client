module Decoder.Product exposing (productListDecoder)

import Json.Decode exposing (Decoder, list, string)
import Json.Decode.Pipeline exposing (decode, required)

import Model.Product exposing (Product)


productListDecoder : Decoder ( List Product )
productListDecoder =
  Json.Decode.at [ "data", "products" ] <| list ( decode Product
    |> required "serialNumber" string
  )
