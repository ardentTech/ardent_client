module View.Alert exposing (alertView)

import Bulma.Components exposing (..)
import Bulma.Modifiers
import Html exposing (Html, div, text)

import Message exposing (Msg(DeleteAlert))
import Model exposing (Model)
import Model.Alert


alertView : Model -> Html Msg
alertView model =
  case model.alert of
    Just alert ->
      let
        modifiers = { messageModifiers | color = case alert.category of
          Model.Alert.Error -> Bulma.Modifiers.Danger
          Model.Alert.Info -> Bulma.Modifiers.Primary
          Model.Alert.Success -> Bulma.Modifiers.Success
          Model.Alert.Warning -> Bulma.Modifiers.Warning
        }
      in
        message modifiers [] [
          messageHeaderWithDelete [] DeleteAlert [ text alert.header ],
          messageBody [] [ text alert.body ]
        ]
    _ -> div [] []
