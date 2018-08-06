module Model exposing (..)

import Navigation exposing (Location)
import Time
import UrlParser exposing (parsePath)

import Flag exposing (Flags)
import Model.Alert exposing (Alert)
import Model.ContactMessage exposing (ContactMessage)
import Model.Post exposing (Post)
import Model.Product exposing (Product)
import Router exposing (Route, route)


type alias Model = {
  rootAlert : Maybe Alert,
  contactMessage : ContactMessage,
  contactMessageAlert : Maybe Alert,
  currentRoute : Maybe Route,
  currentTime : Maybe Time.Time,
  docRoot : String,
  postList : List Post,
  productList : List Product
}


init : Flags -> Location -> Model
init flags location = {
  rootAlert = Nothing,
  contactMessage = Model.ContactMessage.init,
  contactMessageAlert = Nothing,
  currentRoute = parsePath route location,
  currentTime = Nothing,
  docRoot = flags.docRoot,
  postList = [],
  productList = []}
