module View.Product exposing (productListView)

import Bulma.Columns exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Bulma.Modifiers exposing (Width(..))
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)

import Message exposing (Msg(..))
import Model exposing (Model)
import Model.Product exposing (Product)


productListView : Model -> Html Msg
productListView model =
  columns { columnsModifiers | multiline = True } [] <| List.map productItemView model.productList


-- PRIVATE


productItemView : Product -> Html Msg
productItemView product =
  column ( ardColumnModifiers Auto ( Just Width4 )) [] [ text product.serialNumber ]


ardColumnModifiers : Width -> Maybe Width -> ColumnModifiers
ardColumnModifiers offset width =
  let
    widths = columnModifiers.widths
  in
    { columnModifiers | offset = offset, widths =
      { widths | tablet = width, desktop = width }}
