module View exposing (notFoundView, page, view)

import Html exposing (..)
import Models exposing (..)
import Msgs exposing (..)
import Views.Header
import Views.One
import Views.Two


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    div []
        [ Views.Header.view
        , case model.route of
            ViewOneRoute ->
                Views.One.view model

            ViewTwoRoute ->
                Views.Two.view model

            NotFoundRoute ->
                notFoundView
        ]


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]
