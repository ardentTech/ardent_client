module View.Footer exposing (view)

import Bulma.Elements exposing (..)
import Bulma.Modifiers exposing (..)
import Bulma.Modifiers.Typography exposing (Color(GreyLight), textCentered, textColor)
import Date
import Html exposing (Html, a, hr, p, text)
import Html.Attributes exposing (href)

import Message exposing (Msg)
import Model exposing (Model)


view : Model -> Html Msg
view model =
  let
    year = case model.currentTime of
      Just t -> (toString <| Date.year <| Date.fromTime t) ++ " "
      _ -> ""
    copyright = text <| "© " ++ year ++ "Ardent Technicreative"
    instagram = a [ href "https://www.instagram.com/ardent.tech/" ] [ text "Instagram" ]
    github = a [ href "https://github.com/ardentTech" ] [ text "Github" ]
  in
    Html.footer [] [
      hr [] [],
      content Standard [ textCentered ] [
        p [ textColor GreyLight ] [ Html.small [] [
          instagram,
          text " | ",
          github,
          text " | ",
          copyright ]]
      ]
    ]
