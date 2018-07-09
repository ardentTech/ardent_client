module Message exposing (Msg(..), childTranslator)

import Navigation exposing (Location)
import Time

import Alert
import Child.Message


type Msg =
  AlertMsg Alert.Msg |
  ChildMsg Child.Message.InternalMsg |
  CurrentTime Time.Time |
  NewUrl String |
  NoOp |
  UrlChange Location


childTranslator : Child.Message.Translator Msg
childTranslator =
  Child.Message.translator {
    onInternalMessage = ChildMsg,
    onNewUrl = NewUrl
  }
