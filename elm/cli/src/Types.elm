module Types exposing (Input, Output, encodeOutput, inputDecoder)

import Json.Decode as D
import Json.Encode as E



-- Define your input and output types here


type alias Input =
    List Int


type alias Output =
    List Int



-- Define your JSON decoders and encoders here


inputDecoder : D.Decoder Input
inputDecoder =
    D.list D.int


encodeOutput : Output -> E.Value
encodeOutput output =
    E.list E.int output
