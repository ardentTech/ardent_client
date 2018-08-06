module Model.ContactMessage exposing (..)


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


isValid : ContactMessage -> Bool
isValid { body, email, name } = if
  String.length body > 3 &&
  String.length email > 3 &&
  String.length name > 0 then
    True
  else
    False

