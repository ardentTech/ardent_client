module Message exposing (Msg(..))

import Http
import Navigation exposing (Location)
import Time

import Model.ContactMessage exposing (ContactMessage)
import Model.Post exposing (Post)
import Model.Product exposing (Product)


type Msg =
  ContactFormSubmit |
  CreateContactMessage ( Result Http.Error ( ContactMessage )) |
  CurrentTime Time.Time |
  DeleteRootAlert |
  GetPostList ( Result Http.Error ( List Post )) |
  GetProductList ( Result Http.Error ( List Product )) |
  NewUrl String |
  NoOp |
  SetBody String |
  SetEmail String |
  SetName String |
  UrlChange Location
