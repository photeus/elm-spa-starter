module Msgs exposing (Msg(..))

import Browser exposing (UrlRequest)
import Routing exposing (Route)
import Url exposing (Url)


type Msg
    = LinkClicked UrlRequest
    | UrlChanged Url
