module View.Product exposing (productListView)

import Html exposing (Html, div, h3, text)
import Html.Attributes exposing (class)

import Message exposing (Msg(..))
import Model exposing (Model)
import Model.Product exposing (Product)


productListView : Model -> Html Msg
productListView model =
  div [] <| List.map productItemView model.productList


-- PRIVATE


productItemView : Product -> Html Msg
productItemView product =
  div [] [ text product.serialNumber ]
