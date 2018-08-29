module Model.Product exposing (Product, ProductImage)


type alias Product = {
  etsyUrl : Maybe String,
  images : List ProductImage,
  name : String,
  serialNumber : String,
  status : String
}


type alias ProductImage = {
  image : String
}
