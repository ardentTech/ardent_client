module View.Post exposing (postListView)

import Bulma.Elements exposing (..)
import Bulma.Modifiers.Typography exposing (Color(GreyLight), textColor)
import Date
import Html exposing (Html, div, h5, p, span, text)

import Message exposing (Msg(..))
import Model exposing (Model)
import Model.Post exposing (Post)


postListView : Model -> Html Msg
postListView model =
  div [] [
    title H4 [] [ text "Musings & Such" ],
    case List.length model.postList of
      0 ->  div [] [ text "No posts to display :(" ]
      _ -> div [] <| List.map postItemView model.postList
  ]


-- PRIVATE


dateFormat : Date.Date -> String
dateFormat date =
  toString (Date.month date) ++ " " ++
  toString (Date.day date) ++ ", " ++
  toString (Date.year date)


postItemView : Post -> Html Msg
postItemView post =
  div [] [
    title H6 [] [ text post.title ],
    span [ textColor GreyLight ] [ text <| dateFormat post.created ]
  ]
