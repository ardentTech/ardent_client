module Model.Post exposing (Post)

import Date


type alias Post = {
  body : String,
  created : Date.Date, 
  title : String
}
