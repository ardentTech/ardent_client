module Api exposing (Endpoint(..), pathForEndpoint)


type Endpoint = Graph


pathForEndpoint : Endpoint -> String
pathForEndpoint endpoint =
  case endpoint of
    Graph -> "graph"
