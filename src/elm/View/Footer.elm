module View.Footer exposing (view)

import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Bulma.Modifiers exposing (..)
import Bulma.Modifiers.Typography exposing (Color(GreyLight), textCentered, textColor)
import Date
import Html exposing (Html, p, text)

import Message exposing (Msg)
import Model exposing (Model)


view : Model -> Html Msg
view model =
  let
    year = case model.currentTime of
      Just t -> (toString <| Date.year <| Date.fromTime t) ++ " "
      _ -> ""
  in
    Html.footer [] [
      container [] [
        content Standard [ textCentered ] [
          p [ textColor GreyLight ] [ Html.small [] [ text <| "© " ++ year ++ "Ardent Technicreative" ]]
        ]
      ]
    ]
