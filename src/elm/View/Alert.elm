module View.Alert exposing (..)

import Bulma.Components exposing (..)
import Bulma.Modifiers
import Html exposing (Html, div, text)

import Model exposing (Model)
import Model.Alert exposing (Alert)


type alias Config msg = {
  toMsg : msg
}


alertView : Config msg -> Maybe Alert -> Html msg
alertView { toMsg } alert_ =
  case alert_ of
    Just alert ->
      let
        modifiers = { messageModifiers | color = case alert.category of
          Model.Alert.Error -> Bulma.Modifiers.Danger
          Model.Alert.Info -> Bulma.Modifiers.Info
          Model.Alert.Success -> Bulma.Modifiers.Primary
          Model.Alert.Warning -> Bulma.Modifiers.Warning
        }
      in
        message modifiers [] [
          messageHeaderWithDelete [] toMsg [ text alert.header ],
          messageBody [] [ text alert.body ]
        ]
    _ -> div [] []
