module Main exposing (init, main, subscriptions)

import Browser exposing (application)
import Browser.Navigation as Nav
import Models exposing (..)
import Msgs exposing (..)
import Routing
import Update exposing (update)
import Url exposing (Url)
import View exposing (view)


init : flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init maybeViewer url navKey =
    ( Models.initialModel navKey url, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
