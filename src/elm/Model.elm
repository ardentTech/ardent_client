module Model exposing (..)

import Navigation exposing (Location)
import Time
import UrlParser exposing (parsePath)

import Alert exposing (Alert)
import Flag exposing (Flags)
import Model.ContactMessage exposing (ContactMessage)
import Model.Post exposing (Post)
import Model.Product exposing (Product)
import Router exposing (Route, route)


type alias Model = {
  alert : Alert,
  contactMessage : ContactMessage,
  currentRoute : Maybe Route,
  currentTime : Maybe Time.Time,
  docRoot : String,
  postList : List Post,
  productList : List Product
}


init : Flags -> Location -> Model
init flags location = {
  alert = Alert.init,
  contactMessage = Model.ContactMessage.init,
  currentRoute = parsePath route location,
  currentTime = Nothing,
  docRoot = flags.docRoot,
  postList = [],
  productList = []}
