module View.Product exposing (productListView)

import Bulma.Columns exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Modifiers exposing (Width(..))
import Bulma.Modifiers.Typography exposing (Color(GreyLight), Size(Medium), textColor, textSize)
import Html exposing (Html, a, div, img, p, span, strong, text)
import Html.Attributes exposing (href, src)

import Message exposing (Msg(..))
import Model exposing (Model)
import Model.Product exposing (Product)
import View.Utils exposing (ardColumnModifiers)


productListView : Model -> Html Msg
productListView model =
  column ( ardColumnModifiers Auto ( Just Auto )) [] [
    case List.length model.productList of
      0 -> span [] [ text "No products to display :(" ]
      _ -> columns { columnsModifiers | multiline = True } [] <| List.map (
        \p ->  productItemView model.docRoot p ) model.productList
  ]


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
      Just url -> a [ href url ] [ text "For Sale" ]
      _ -> span [ textColor GreyLight ] [ text "Coming Soon" ]

  in
    column ( ardColumnModifiers Auto ( Just Width4 )) [] [
      image_,
      title H6 [] [ text product.name ],
      p [] [ status ]
    ]
