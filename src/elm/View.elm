module View exposing (view)

import Bulma.CDN exposing (stylesheet)
import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Html exposing (Html, div, h3, main_, text)
import Html.Attributes exposing (href, rel)

import Message exposing (Msg(..))
import Model exposing (Model)
import Router exposing (Route(..))
import View.Footer
import View.Post exposing (postListView)
import View.Product exposing (productListView)


view : Model -> Html Msg
view model =
  main_ [] [
    stylesheet,
    fontAwesomeCDN,
    section NotSpaced [] [ container [] [
      title H2 [] [ text "Ardent Technicreative" ],
      forRoute model.currentRoute <| model ]],
    section NotSpaced [] [ View.Footer.view model ]
  ]


-- PRIVATE


fontAwesomeCDN : Html Msg
fontAwesomeCDN =
  Html.node "link" [
    rel "stylesheet", href "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" ] []


forRoute : Maybe Route -> (Model -> Html Msg)
forRoute route =
  case route of
    Just Index -> indexView
    _ -> notFoundView


indexView : Model -> Html Msg
indexView model =
  div [] [
    productListView model,
    postListView model
  ]


notFoundView : Model -> Html Msg
notFoundView model = title H1 [] [ text "404" ]
