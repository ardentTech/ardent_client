module Update exposing (update)

import Navigation exposing (newUrl)
import UrlParser exposing (parsePath)

import Alert
import Command
import Command.ContactMessage exposing (createContactMessage)
import Message exposing (Msg(..))
import Model exposing (Model) 
import Model.ContactMessage
import Router exposing (route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  let
    noOp = model ! []
  in
    case msg of
      AlertMsg message -> { model | alert = Alert.update message model.alert } ! []
      ContactFormSubmit -> model ! [ createContactMessage model ]
      CreateContactMessage response -> noOp
      CurrentTime time -> { model | currentTime = Just time } ! []
      GetPostList response -> case response of
        Ok r -> { model | postList = r } ! []
        Err e -> { model | alert = Alert.fromError e } ! []
      GetProductList response -> case response of
        Ok r -> { model | productList = r } ! []
        Err e -> { model | alert = Alert.fromError e } ! []
      NewUrl url -> ( model, newUrl url )
      NoOp -> noOp
      SetBody body -> { model |
        contactMessage = Model.ContactMessage.setBody body model.contactMessage } ! []
      SetEmail email -> { model |
        contactMessage = Model.ContactMessage.setEmail email model.contactMessage } ! []
      SetName name -> { model |
        contactMessage = Model.ContactMessage.setName name model.contactMessage } ! []
      UrlChange location -> (
        { model | currentRoute = parsePath route location }, Command.forMsg msg )
