module Message exposing (Msg(..))

import Http
import Navigation exposing (Location)
import Time

import Alert
import Model.Post exposing (Post)
import Model.Product exposing (Product)


type Msg =
  AlertMsg Alert.Msg |
  CurrentTime Time.Time |
  GetPostList ( Result Http.Error ( List Post )) |
  GetProductList ( Result Http.Error ( List Product )) |
  NewUrl String |
  NoOp |
  UrlChange Location
