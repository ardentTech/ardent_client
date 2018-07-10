module Model.Product exposing (Product, ProductImage)


type alias Product = {
  images : List ProductImage,
  serialNumber : String
}


type alias ProductImage = {
  image : String
}
