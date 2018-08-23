module Routing exposing (matchers, onLinkClick, parseLocation, viewOneRoute, viewTwoRoute)

import Html exposing (Attribute)
import Html.Events exposing (onWithOptions)
import Json.Decode as Decode
import Models exposing (Model, Route(..))
import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map ViewOneRoute top
        , map ViewTwoRoute (s "two")
        ]


parseLocation : Location -> Route
parseLocation location =
    case UrlParser.parsePath matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


viewOneRoute : String
viewOneRoute =
    "/"


viewTwoRoute : String
viewTwoRoute =
    "/two"


onLinkClick : msg -> Attribute msg
onLinkClick message =
    let
        options =
            { stopPropagation = False
            , preventDefault = True
            }
    in
    onWithOptions "click" options (Decode.succeed message)
