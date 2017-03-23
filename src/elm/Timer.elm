import Html exposing (Html, Attribute, div, text, p)
import Html.Attributes exposing (style)
import Time exposing (Time, second)
import Date exposing (Date, fromTime)
import Date.Extra.Config.Config_pl_pl exposing (config)
import Date.Extra.Format as Format exposing (isoFormat, format)

main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = Time

init : (Model, Cmd Msg)
init =
  (0, Cmd.none)

-- UPDATE

type Msg
  = Tick Time


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      (newTime, Cmd.none)

-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Tick

-- VIEW

view : Model -> Html Msg
view model =
  let
    currentTimeAsDate = fromTime model
    formattedDateTime = format config isoFormat currentTimeAsDate
  in
    div [ divStyle ]
    [ p [ pStyle ] [ text formattedDateTime ] 
    ]

divStyle : Attribute msg
divStyle = 
  style
  [("border-style", "solid")
  ,("border-width", "5px")
  ]

pStyle : Attribute msg
pStyle = 
  style
  [("text-align","center")
  ]
