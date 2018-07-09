module Api exposing (pathForEndpoint)


type Endpoint = Todo


pathForEndpoint : Endpoint -> String
pathForEndpoint endpoint =
  case endpoint of
    Todo -> "todo"
