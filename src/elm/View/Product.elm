module View.Product exposing (productListView)

import Bulma.Columns exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)

import Message exposing (Msg(..))
import Model exposing (Model)
import Model.Product exposing (Product)


productListView : Model -> Html Msg
productListView model =
  columns columnsModifiers [] [
    column columnModifiers [] [ text "First" ]
  ]
--  div [] <| List.map productItemView model.productList


-- PRIVATE


--productItemView : Product -> Html Msg
--productItemView product =
--  div [] [ text product.serialNumber ]
