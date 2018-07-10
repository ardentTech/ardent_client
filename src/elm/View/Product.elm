module View.Product exposing (productListView)

import Bulma.Columns exposing (..)
import Bulma.Modifiers exposing (Width(..))
import Html exposing (Html, div, h3, img, text)
import Html.Attributes exposing (src)

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
    imageSrc = case List.head product.images of
      Just i -> docRoot ++ "media/" ++ i.image
      _ -> "@todo default img"
  in
    column ( ardColumnModifiers Auto ( Just Width4 )) [] [
      img [ src imageSrc ] [],
      text product.serialNumber
    ]


ardColumnModifiers : Width -> Maybe Width -> ColumnModifiers
ardColumnModifiers offset width =
  let
    widths = columnModifiers.widths
  in
    { columnModifiers | offset = offset, widths =
      { widths | tablet = width, desktop = width, widescreen = width, fullHD = width }}
