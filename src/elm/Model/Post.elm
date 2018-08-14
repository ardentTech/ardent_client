module Model.Post exposing (Post)

import Date


type alias Post = {
  body : String,
  created : Date.Date, 
  id : Int,
  title : String
}
