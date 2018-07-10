module Model.Product exposing (Product, ProductImage)


type alias Product = {
  etsyUrl : Maybe String,
  images : List ProductImage,
  serialNumber : String
}


type alias ProductImage = {
  image : String
}
