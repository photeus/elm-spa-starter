module Update exposing (update)

import Browser exposing (..)
import Browser.Navigation exposing (..)
import Models exposing (..)
import Msgs exposing (..)
import Routing exposing (..)
import Url exposing (Url)
import View exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Internal url ->
                    ( { model | url = url }, pushUrl model.key (Url.toString url) )

                External href ->
                    let
                        route =
                            Routing.fromString href
                    in
                    Debug.log ("route: " ++ Debug.toString route)
                        ( { model | route = Routing.fromString href }, load href )

        UrlChanged url ->
            Debug.log ("url changed: " ++ Url.toString url)
                ( { model | route = fromUrl url }, Cmd.none )
