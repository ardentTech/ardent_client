module View.Post exposing (postListView)

import Bulma.Columns exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Modifiers exposing (Width(..))
import Bulma.Modifiers.Typography exposing (Color(GreyLight), Size(Medium), textColor, textSize)
import Html exposing (Html, div, h5, text)
import Html.Attributes exposing (class)

import Message exposing (Msg(..))
import Model exposing (Model)
import Model.Post exposing (Post)
import View.Utils exposing (ardColumnModifiers)


postListView : Model -> Html Msg
postListView model =
  case List.length model.postList of
    0 ->  div [] [ text "No posts to display :(" ]
--    _ ->  div [] <| List.map postItemView model.postList
    _ -> columns { columnsModifiers | multiline = True } [] <|
      List.map postItemView model.postList


-- PRIVATE


postItemView : Post -> Html Msg
postItemView post =
  column ( ardColumnModifiers Auto ( Just Width4 )) [] [
    title H6 [] [ text post.title ]
  ]
