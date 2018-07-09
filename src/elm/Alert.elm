module Alert exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_)
import Html.Events exposing (onClick)
import Http exposing (Error)
import Rest


type Category =
  Danger | Dark | Info | List | Primary | Secondary | Success | Warning


type alias Alert = {
  body : Html Msg,
  category : Category,
  visible : Bool
}


type Msg = Hide | Show


fromError : Error -> Alert
fromError err = {
  body = strong [] [ text <| Rest.errorString err ],
  category = Danger,
  visible = True }


init : Alert
init = { body = text "", category = Info, visible = False }


update : Msg -> Alert -> Alert
update msg alert =
  case msg of
    Hide -> { alert | visible = False }
    Show -> { alert | visible = True }


view : Alert -> Html Msg 
view alert =
  if alert.visible then
    let
      cls = "alert alert-" ++ ( String.toLower <| toString alert.category )
    in
      div [ class cls] [
        div [] [ alert.body ],
        button [ class "close", onClick Hide, type_ "button" ] [ span [] [ text "×" ]]
      ]
  else
    div [] []
