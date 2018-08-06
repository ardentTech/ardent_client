module View exposing (view)

import Bulma.CDN exposing (stylesheet)
import Bulma.Columns exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Bulma.Modifiers exposing (Width(..))
import Html exposing (Html, div, h3, main_, text)
import Html.Attributes exposing (href, rel)

import Message exposing (Msg(..))
import Model exposing (Model)
import Router exposing (Route(..))
import View.Alert exposing (alertView)
import View.ContactForm exposing (contactFormView)
import View.Footer
import View.Post exposing (postListView)
import View.Product exposing (productListView)
import View.Utils exposing (ardColumnModifiers)


view : Model -> Html Msg
view model =
  main_ [] [
    stylesheet,
    fontAwesomeCDN,
    ardStylesheet,
    section NotSpaced [] [ container [] [
      alertView { toMsg = DeleteRootAlert } model.rootAlert,
      title H2 [] [ text "Ardent Technicreative" ],
      forRoute model.currentRoute <| model,
      View.Footer.view model
    ]]
  ]


-- PRIVATE


ardStylesheet : Html Msg
ardStylesheet =
  Html.node "link" [ rel "stylesheet", href "/static/styles/main.css" ] []


fontAwesomeCDN : Html Msg
fontAwesomeCDN =
  Html.node "link" [
    rel "stylesheet",
    href "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" ] []


forRoute : Maybe Route -> (Model -> Html Msg)
forRoute route =
  case route of
    Just Index -> indexView
    _ -> notFoundView


indexView : Model -> Html Msg
indexView model =
  div [] [
    columns { columnsModifiers | multiline = True } [] [ productListView model ],
    columns columnsModifiers [] [
      column ( ardColumnModifiers Auto ( Just Width6 )) [] [ postListView model ],
      column ( ardColumnModifiers Auto ( Just Width6 )) [] [ contactFormView model ]
    ]
  ]


notFoundView : Model -> Html Msg
notFoundView model = title H1 [] [ text "404" ]
