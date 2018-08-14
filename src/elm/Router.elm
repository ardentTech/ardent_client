module Router exposing (Route(..), route, toPath)

import UrlParser exposing (..)


type Route = Index | NotFound | PostDetail Int


route : Parser (Route -> a) a
route = oneOf [
  map Index top,
  map NotFound (s "not-found"),
  map PostDetail (s "posts" </> int)]


toPath : Route -> String
toPath r =
  case r of
    Index -> "/"
    NotFound -> "/not-found"
    PostDetail id -> "/posts/" ++ toString id
