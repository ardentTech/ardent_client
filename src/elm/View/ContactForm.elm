module View.ContactForm exposing (contactFormView)

import Bulma.Form exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Modifiers exposing (Color(Primary))
import Html exposing (Html, div, span, text)
import Html.Attributes exposing (disabled, placeholder)
import Html.Events exposing (onInput, onClick)

import Message exposing (Msg(..))
import Model exposing (Model)
import View.Alert exposing (alertView)


contactFormView : Model -> Html Msg
contactFormView model =
  div [] [
    title H4 [] [ text "Speak Your Mind" ],
    alertView { toMsg = DeleteContactMessageAlert } model.contactMessageAlert,
    field [] [
      controlText controlInputModifiers [] [ onInput SetName, placeholder "Name" ] []
    ],
    field [] [
      controlEmail controlInputModifiers [] [ onInput SetEmail, placeholder "Email" ] []
    ],
    field [] [
      controlTextArea controlTextAreaModifiers [] [ onInput SetBody, placeholder "Message" ] []
    ],
    field [] [
      controlButton { buttonModifiers | color = Primary } [] [ onClick ContactFormSubmit ] [
        span [] [ text "Submit" ]]
    ]
  ]
