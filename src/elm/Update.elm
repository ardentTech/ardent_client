module Update exposing (update)

import Http
import Navigation exposing (newUrl)
import UrlParser exposing (parsePath)
import Validate exposing (validate)

import Command
import Command.ContactMessage exposing (createContactMessage)
import Message exposing (Msg(..))
import Model exposing (Model) 
import Model.Alert
import Model.ContactMessage exposing (ContactMessage)
import Model.Post exposing (Post)
import Model.Product exposing (Product)
import Router exposing (route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  let
    noOp = model ! []
  in
    case msg of
      ContactFormSubmit -> onContactFormSubmit model
      CreateContactMessage response -> onCreateContactMessage response model
      CurrentTime time -> { model | currentTime = Just time } ! []
      DeleteContactMessageAlert -> { model | contactMessageAlert = Nothing } ! []
      DeleteRootAlert -> { model | rootAlert = Nothing } ! []
      GetPostList response -> onGetPostList response model
      GetProductList response -> onGetProductList response model
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


-- PRIVATE


onContactFormSubmit : Model -> ( Model, Cmd Msg )
onContactFormSubmit model =
  let
    errors = validate Model.ContactMessage.validator model.contactMessage
  in
    case List.length errors of
      0 -> model ! [ createContactMessage model ]
      _ -> { model | contactMessageAlert =
        Just <| Model.Alert.error "Invalid Submission!" "Please remedy the errors below." } ! []


onCreateContactMessage : Result Http.Error ( ContactMessage ) -> Model -> ( Model, Cmd Msg )
onCreateContactMessage response model =
  case response of
    Ok r -> { model |
      contactMessage = Model.ContactMessage.init,
      contactMessageAlert = Just <| Model.Alert.success "Success!" "Your message has been received and will be processed in a timely fashion."
    } ! []
    Err e -> { model | contactMessageAlert = Just <| Model.Alert.fromHttpError e } ! []


onGetPostList : Result Http.Error ( List Post ) -> Model -> ( Model, Cmd Msg )
onGetPostList response model =
  case response of
    Ok r -> { model | postList = r } ! []
    Err e -> { model | rootAlert = Just <| Model.Alert.fromHttpError e } ! []


onGetProductList : Result Http.Error ( List Product ) -> Model -> ( Model, Cmd Msg )
onGetProductList response model =
  case response of
    Ok r -> { model | productList = r } ! []
    Err e -> { model | rootAlert = Just <| Model.Alert.fromHttpError e } ! []
