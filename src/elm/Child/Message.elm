module Child.Message exposing (..)


type ExternalMsg = NewUrl String


type InternalMsg = NoOp


type Msg = ForSelf InternalMsg | ForParent ExternalMsg


type alias Translator msg = Msg -> msg


type alias TranslationDictionary msg = {
  onInternalMessage : InternalMsg -> msg,
  onNewUrl : String -> msg
}


translator : TranslationDictionary msg -> Translator msg
translator { onInternalMessage, onNewUrl } msg =
  case msg of
    ForParent (NewUrl url) -> onNewUrl url
    ForSelf message -> onInternalMessage message
