module View.ContactForm exposing (contactFormView)

import Bulma.Form exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Modifiers exposing (Color(Primary))
import Html exposing (Html, div, span, text)
import Html.Attributes exposing (placeholder)

import Message exposing (Msg(..))
import Model exposing (Model)


contactFormView : Model -> Html Msg
contactFormView model =
  div [] [
    field [] [
      controlInput controlInputModifiers [] [ placeholder "Name" ] []
    ],
    field [] [
      controlInput controlInputModifiers [] [ placeholder "Email" ] []
    ],
    field [] [
      controlTextArea controlTextAreaModifiers [] [ placeholder "Message" ] []
    ],
    field [] [
      controlButton { buttonModifiers | color = Primary } [] [] [ span [] [ text "Submit" ]]
    ]
  ]
