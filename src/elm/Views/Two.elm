module Views.Two exposing (view)

import Html exposing (Html, div, h1, text)
import Models exposing (Model)
import Msgs exposing (..)


view : Model -> Html msg
view model =
    div []
        [ h1 []
            [ text (model.phrase ++ " Again!") ]
        ]
