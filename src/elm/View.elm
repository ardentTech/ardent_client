module View exposing (view)

import Bulma.CDN exposing (stylesheet)
import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Html exposing (Html, div, h3, main_, text)

import Message exposing (Msg(..))
import Model exposing (Model)
import Router exposing (Route(..))
import View.Footer
import View.Product exposing (productListView)


view : Model -> Html Msg
view model =
  let
    childView = forRoute model.currentRoute <| model
  in
    main_ [] [
      stylesheet,
      section NotSpaced [] [
        container [] [ title H1 [] [ text "Ardent Technicreative" ] ]
      ],
      section NotSpaced [] [ container [] [ childView ]],
      section NotSpaced [] [ View.Footer.view model ]
    ]


-- PRIVATE


forRoute : Maybe Route -> (Model -> Html Msg)
forRoute route =
  case route of
    Just Index -> indexView
    _ -> notFoundView


indexView : Model -> Html Msg
indexView model =
  productListView model


notFoundView : Model -> Html Msg
notFoundView model = title H1 [] [ text "404" ]
