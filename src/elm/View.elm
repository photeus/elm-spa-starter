module View exposing (notFoundView, page, view)

import Browser
import Html exposing (..)
import Models exposing (..)
import Msgs exposing (..)
import Routing exposing (..)
import Views.Header
import Views.One
import Views.Two


view : Model -> Browser.Document msg
view model =
    { title = "Title"
    , body =
        [ page model ]
    }


page : Model -> Html msg
page model =
    Debug.log (Debug.toString model)
        div
        []
        [ Views.Header.view
        , case model.route of
            Routing.Home ->
                Debug.log "first"
                    Views.One.view
                    model

            Routing.Second ->
                Debug.log "second"
                    Views.Two.view
                    model

            Routing.NotFound ->
                notFoundView
        ]


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]
