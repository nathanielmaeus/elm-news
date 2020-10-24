module Views.List exposing (listView)


import Browser
import Html exposing (Html, button, div, text, input)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Model exposing (..)

-- VIEW

renderItem : String -> Html MainMsg
renderItem item = div [] [ text (item) ]

listView : Model -> Html MainMsg
listView model =
  div []
    [ input [ type_ "text", placeholder "task", onInput Change, value model.current ] []
    , button [ onClick AddTask ] [ text "+" ]
    , button [ onClick RemoveTask ] [ text "-" ]
    , div [] (List.map renderItem model.names)
    ]