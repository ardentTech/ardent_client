module Update exposing (update)

import Navigation exposing (newUrl)
import UrlParser exposing (parsePath)

import Command
import Command.ContactMessage exposing (createContactMessage)
import Message exposing (Msg(..))
import Model exposing (Model) 
import Model.Alert
import Model.ContactMessage
import Router exposing (route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  let
    noOp = model ! []
  in
    case msg of
      ContactFormSubmit -> model ! [ createContactMessage model ]
      CreateContactMessage response -> case response of
        Ok r -> { model | alert =
          Just <| Model.Alert.success "Success!" "Your message has been received and will be processed in a timely fashion." } ! []
        Err e -> { model | alert = Just <| Model.Alert.fromHttpError e } ! []
      CurrentTime time -> { model | currentTime = Just time } ! []
      DeleteAlert -> { model | alert = Nothing } ! []
      GetPostList response -> case response of
        Ok r -> { model | postList = r } ! []
        Err e -> { model | alert = Just <| Model.Alert.fromHttpError e } ! []
      GetProductList response -> case response of
        Ok r -> { model | productList = r } ! []
        Err e -> { model | alert = Just <| Model.Alert.fromHttpError e } ! []
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
