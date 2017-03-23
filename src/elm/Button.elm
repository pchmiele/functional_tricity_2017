import Html exposing (Html, Attribute, button, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)

main : Program Never Model Msg
main =  Html.beginnerProgram 
  { model = model
  , view = view
  , update = update
  }

-- MODEL

type alias Model = Int

model : Model
model =
  0

-- UPDATE

type Msg
  = Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

countStyle : Attribute msg
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]