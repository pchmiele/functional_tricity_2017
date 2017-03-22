port module Spelling exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

-- MODEL

type alias Model =
    { word : String
    , currentTime : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "" "", Cmd.none )


-- UPDATE

type Msg
    = Change String
    | Send
    | Time String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newWord ->
            ( {model | word = newWord}, Cmd.none )

        Send ->
            ( model, send model.word )

        Time currentTime ->
            ( { model | currentTime = currentTime }, Cmd.none )

-- Ports

port send : String -> Cmd msg

port updateTime : (String -> msg) -> Sub msg

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    updateTime Time

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ input [ onInput Change ] []
        , button [ onClick Send ] [ text "Send" ]
        , div [] [ text model.currentTime ]
        ]