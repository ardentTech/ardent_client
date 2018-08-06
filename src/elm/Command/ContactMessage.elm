module Command.ContactMessage exposing (createContactMessage)

import Http exposing (encodeUri)

import Decoder.ContactMessage exposing (contactMessageDecoder)
import Message exposing (Msg(CreateContactMessage))
import Model exposing (Model)
import Model.ContactMessage exposing (ContactMessage)
import Rest exposing (post)


createContactMessage : Model -> Cmd Msg
createContactMessage { docRoot, contactMessage } =
  let
    encoded = encodeUri <| "mutation{createContactMessage(input:" ++ payload contactMessage ++ "){body email name}}"
  in
    post ( docRoot ++ "graph?query=" ++ encoded ) contactMessageDecoder CreateContactMessage


-- PRIVATE


payload : ContactMessage -> String
payload cm = "{body: \"" ++ cm.body ++ "\", email: \"" ++ cm.email ++ "\", name: \"" ++ cm.name ++ "\"}"
