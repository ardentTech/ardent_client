module Model exposing (..)

import Navigation exposing (Location)
import Time
import UrlParser exposing (parsePath)

import Alert exposing (Alert)
import Child.Model
import Flag exposing (Flags)
import Router exposing (Route, route)


type alias Model = {
  alert : Alert,
  child : Child.Model.Model,
  currentRoute : Maybe Route,
  currentTime : Maybe Time.Time,
  docRoot : String
}


init : Flags -> Location -> Model
init flags location = {
  alert = Alert.init,
  child = Child.Model.init,
  currentRoute = parsePath route location,
  currentTime = Nothing,
  docRoot = flags.docRoot }
