module Update exposing (update)

import Navigation exposing (newUrl)
import UrlParser exposing (parsePath)

import Alert
import Command
import Message exposing (Msg(..))
import Model exposing (Model) 
import Router exposing (route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  let
    noOp = model ! []
  in
    case msg of
      AlertMsg message -> { model | alert = Alert.update message model.alert } ! []
      CurrentTime time -> { model | currentTime = Just time } ! []
      GetPostList response -> case response of
        Ok r -> { model | postList = r } ! []
        Err e -> { model | alert = Alert.fromError e } ! []
      GetProductList response -> case response of
        Ok r -> { model | productList = r } ! []
        Err e -> { model | alert = Alert.fromError e } ! []
      NewUrl url -> ( model, newUrl url )
      NoOp -> noOp
      UrlChange location -> (
        { model | currentRoute = parsePath route location }, Command.forMsg msg )
