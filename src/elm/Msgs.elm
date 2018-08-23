module Msgs exposing (Msg(..))

import Navigation exposing (Location)


type Msg
    = OnLocationChange Location
    | ChangeLocation String
