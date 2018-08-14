module View.Post exposing (postDetail, postListView)

import Bulma.Elements exposing (..)
import Bulma.Modifiers.Typography exposing (Color(GreyLight), textColor)
import Bulma.Modifiers exposing (Size(Standard))
import Date
import Html exposing (Html, a, div, h5, p, span, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Markdown

import Message exposing (Msg(..))
import Model exposing (Model)
import Model.Post exposing (Post)
import Router exposing (Route(..), toPath)


postListView : Model -> Html Msg
postListView model =
  div [] [
    title H4 [] [ text "Musings & Such" ],
    case List.length model.postList of
      0 ->  div [] [ text "No posts to display :(" ]
      _ -> div [] <| List.map postItemView model.postList
  ]


postDetail : Model -> Html Msg
postDetail model =
  case model.post of
    Just post ->
      div [] [
        title H4 [] [ text post.title ],
        p [ class "post-meta", textColor GreyLight ] [ text <| dateFormat post.created ],
        content Standard [] [ Markdown.toHtml [] post.body ]
      ]
    _ ->
      div [] []


-- PRIVATE


dateFormat : Date.Date -> String
dateFormat date =
  toString (Date.month date) ++ " " ++
  toString (Date.day date) ++ ", " ++
  toString (Date.year date)


postItemView : Post -> Html Msg
postItemView post =
  div [] [
    title H6 [] [
      a [ onClick <| NewUrl <| toPath <| PostDetail post.id ] [ text post.title ]],
    span [ textColor GreyLight ] [ text <| dateFormat post.created ]
  ]
