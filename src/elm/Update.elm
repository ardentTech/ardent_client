module Update exposing (update)

import Navigation exposing (newUrl)
import UrlParser exposing (parsePath)

import Alert
import Child.Update
import Command
import Message exposing (Msg(..), childTranslator)
import Model exposing (Model) 
import Router exposing (route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  let
    noOp = model ! []
  in
    case msg of
      AlertMsg message -> { model | alert = Alert.update message model.alert } ! []
      ChildMsg message ->
        let
          ( model_, cmd_ ) = Child.Update.update message model.child
        in
          { model | child = model_ } ! [ Cmd.map childTranslator cmd_ ]
      CurrentTime time -> { model | currentTime = Just time } ! []
      NewUrl url -> ( model, newUrl url )
      NoOp -> noOp
      UrlChange location -> (
        { model | currentRoute = parsePath route location }, Command.forMsg msg )
