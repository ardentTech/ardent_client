module View.Product exposing (productListView)

import Bulma.Columns exposing (..)
import Bulma.Modifiers exposing (Width(..))
import Html exposing (Html, a, div, h3, img, text)
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
    mediaUrl = docRoot ++ "media/"
    image = case List.head product.images of
        Just i -> case product.etsyUrl of
          Just url -> 
            a [ href url ] [ img [ src <| mediaUrl ++ i.image ] []]
          _ ->
            img [ src <| mediaUrl ++ i.image ] []
        _ -> img [ src "@todo default img" ] []

  in
    column ( ardColumnModifiers Auto ( Just Width4 )) [] [ image ]


ardColumnModifiers : Width -> Maybe Width -> ColumnModifiers
ardColumnModifiers offset width =
  let
    widths = columnModifiers.widths
  in
    { columnModifiers | offset = offset, widths =
      { widths | tablet = width, desktop = width, widescreen = width, fullHD = width }}
