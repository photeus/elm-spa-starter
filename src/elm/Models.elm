module Models exposing (Model, initialModel)

import Browser.Navigation exposing (Key)
import Routing exposing (Route, fromUrl)
import Url exposing (Url)


type alias Model =
    { phrase : String
    , key : Key
    , url : Url
    , route : Route
    }


initialModel : Key -> Url -> Model
initialModel key url =
    { phrase = "Hello"
    , key = key
    , url = url
    , route = fromUrl url
    }
