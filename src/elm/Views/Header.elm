module Views.Header exposing (..)

import Html exposing (Html, a, button, div, li, nav, span, text, ul)
import Html.Attributes exposing (attribute, class, href, id, type_)
import Msgs exposing (..)
import Routing exposing (onLinkClick, viewOneRoute, viewTwoRoute)


view : Html Msg
view =
    nav [ class "navbar navbar-expand-lg navbar-dark bg-dark" ]
        [ button [ class "navbar-toggler", type_ "button", attribute "data-toggle" "collapse", attribute "data-target" "#navbarTogglerDemo01", attribute "aria-controls" "navbarTogglerDemo01", attribute "aria-expanded" "false", attribute "aria-label" "Toggle navigation" ]
            [ span
                [ class "navbar-toggler-icon" ]
                []
            ]
        , pages
        ]


pages : Html Msg
pages =
    div [ class "collapse navbar-collapse", id "navbarTogglerDemo01" ]
        [ a [ class "navbar-brand", href "/" ]
            [ text "Starter App" ]
        , ul
            [ class "navbar-nav mr-auto mt-2 mt-lg-0" ]
            [ li [ class "nav-item" ]
                [ a
                    [ class "nav-link"
                    , href viewOneRoute
                    , onLinkClick (ChangeLocation viewOneRoute)
                    ]
                    [ text "One", span [ class "sr-only" ] [] ]
                ]
            , li [ class "nav-item" ]
                [ a
                    [ class "nav-link"
                    , href viewTwoRoute
                    , onLinkClick (ChangeLocation viewTwoRoute)
                    ]
                    [ text "Two", span [ class "sr-only" ] [] ]
                ]
            ]
        ]
