module View.Product exposing (productListView)

import Bulma.Columns exposing (..)
import Bulma.Elements exposing (ImageShape(..), ImageSize(..), image)
import Bulma.Modifiers exposing (Width(..))
import Html exposing (Html, a, div, h3, img, p, small, strong, text)
import Html.Attributes exposing (href, src)

import Message exposing (Msg(..))
import Model exposing (Model)
import Model.Product exposing (Product)


productListView : Model -> Html Msg
productListView model =
  columns { columnsModifiers | multiline = True } [] <|
    List.map (\p ->  productItemView model.docRoot p ) model.productList


-- PRIVATE


productItemView : String -> Product -> Html Msg
productItemView docRoot product =
  let
    image_ = case List.head product.images of
      Just i ->
        image ( OneByOne Unbounded ) [] [
          img [ src <| docRoot ++ "media/" ++ i.image ] []]
      _ -> text ""
    status = case product.etsyUrl of
      Just url -> a [ href url ] [ text "Purchase" ]
      _ -> text "Currently Unavailable"

  in
    column ( ardColumnModifiers Auto ( Just Width4 )) [] [
      image_,
      p [] [ strong [] [ text product.serialNumber ]],
      p [] [ status ]
    ]


ardColumnModifiers : Width -> Maybe Width -> ColumnModifiers
ardColumnModifiers offset width =
  let
    widths = columnModifiers.widths
  in
    { columnModifiers | offset = offset, widths =
      { widths | tablet = width, desktop = width, widescreen = width, fullHD = width }}
