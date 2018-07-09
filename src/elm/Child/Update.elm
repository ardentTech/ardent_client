module Child.Update exposing (update)

import Child.Message exposing (InternalMsg(..), Msg)
import Child.Model exposing (Model)


update : InternalMsg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp -> model ! []
