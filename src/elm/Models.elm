module Models exposing (..)


type alias Model =
    { phrase : String
    , route : Route
    }


type Route
    = ViewOneRoute
    | ViewTwoRoute
    | NotFoundRoute


initialModel : Route -> Model
initialModel route =
    { phrase = "Hello"
    , route = route
    }
