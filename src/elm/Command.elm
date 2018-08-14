module Command exposing (forRoute, init)

import Task
import Time

import Command.Post exposing (getPost, getPostList)
import Command.Product exposing (getProductList)
import Message exposing (Msg(..))
import Model exposing (Model)
import Router exposing (Route(..))


forRoute : Route -> Model -> List ( Cmd Msg )
forRoute route model =
  case route of
    Index -> [ getPostList model, getProductList model ]
    PostDetail id -> [ getPost model id ]
    _ -> [ Cmd.none ]


getCurrentTime : Cmd Msg
getCurrentTime = Task.perform CurrentTime Time.now


init : Model -> Cmd Msg
init model = Cmd.batch <| [ getCurrentTime ] ++ case model.currentRoute of
  Just route -> forRoute route model
  _ -> []
