module Decoder.Product exposing (productListDecoder)

import Json.Decode exposing (Decoder, list, nullable, string)
import Json.Decode.Pipeline exposing (decode, required, requiredAt)

import Model.Product exposing (Product, ProductImage)


productListDecoder : Decoder ( List Product )
productListDecoder =
  Json.Decode.at [ "data", "products" ] <| list ( decode Product
    |> required "etsyUrl" ( nullable string )
    |> requiredAt ["images"] productImageListDecoder
    |> required "name" string
    |> required "serialNumber" string
  )


productImageListDecoder : Decoder ( List ProductImage )
productImageListDecoder = list ( decode ProductImage
    |> required "image" string
  )
