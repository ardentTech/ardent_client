module Model.ContactMessage exposing (..)

import Validate exposing (Validator, ifBlank, ifInvalidEmail, validate)


type alias ContactMessage = {
  body : String,
  email : String,
  name : String
}


init : ContactMessage
init = { body = "", email = "", name = "" }


setBody : String -> ContactMessage -> ContactMessage
setBody body contactMessage = { contactMessage | body = body }


setEmail : String -> ContactMessage -> ContactMessage
setEmail email contactMessage = { contactMessage | email = email }


setName : String -> ContactMessage -> ContactMessage
setName name contactMessage = { contactMessage | name = name }


type Field = Body | Email | Name


validator : Validator ( Field, String ) ContactMessage
validator =
  Validate.all [
    ifBlank .body ( Body, "Please enter a message." ),
    ifBlank .email ( Email, "Please enter an email." ),
    ifBlank .name ( Name, "Please enter a name." ),
    ifInvalidEmail .email (\a -> ( Email, a ++ " is not a valid email." ))
  ]
