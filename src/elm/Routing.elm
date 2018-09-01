module Routing exposing (Route(..), fromString, fromUrl, homeRoute, parser, secondRoute)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser exposing ((</>), Parser, int, map, oneOf, parse, s, string, top)


type Route
    = Home
    | Second
    | NotFound


homeRoute : String
homeRoute =
    "/"


secondRoute : String
secondRoute =
    "/second"


parser : Parser (Route -> a) a
parser =
    oneOf
        [ map Home top
        , map Second (s "second")
        ]


fromString : String -> Route
fromString string =
    case Url.fromString string of
        Nothing ->
            NotFound

        Just url ->
            Maybe.withDefault NotFound (parse parser url)


fromUrl : Url -> Route
fromUrl url =
    Maybe.withDefault NotFound (parse parser url)
