port module Main exposing (main)

import Algorithm exposing (algorithm)
import Json.Decode as D
import Json.Encode as E
import Platform
import Types exposing (encodeOutput, inputDecoder)



-- PORTS


port receiveInput : (E.Value -> msg) -> Sub msg


port sendOutput : E.Value -> Cmd msg



-- MAIN


main : Program () Model Msg
main =
    Platform.worker
        { init = init
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    {}



-- UPDATE


type Msg
    = GotInput E.Value


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotInput value ->
            case D.decodeValue inputDecoder value of
                Ok input ->
                    ( model, sendOutput (encodeOutput (algorithm input)) )

                Err _ ->
                    ( model, sendOutput (E.string "Error: Invalid input format") )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    receiveInput GotInput
