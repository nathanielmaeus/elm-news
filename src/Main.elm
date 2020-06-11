module Main exposing (..)


import Browser
import Html exposing (Html, button, div, text, input)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Array exposing (push)


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = { current: String, names: List String }


init : Model
init =
  { 
    current = "",
    names = ["kiss", "opium"]
  }



-- UPDATE
removeFromList i xs =
  (List.take i xs) ++ (List.drop (i+1) xs) 

removeFromArray i =
  Array.toList >> removeFromList i >> Array.fromList 

type Msg
  = AddTask
  | RemoveTask
  | Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change value -> 
      { model | current = value }
    AddTask ->
      { model | names = model.current :: model.names}

    RemoveTask ->
      { model | names = removeFromList 0 model.names}

render : String -> Html Msg
render item = div [] [ text (item) ]
-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "task", onInput Change ] []
    , button [ onClick AddTask ] [ text "-" ]
    , button [ onClick RemoveTask ] [ text "+" ]
    , div [] (List.map render model.names)
    ]