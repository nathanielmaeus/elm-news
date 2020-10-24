module Routes exposing (..)

import Url
import Browser.Navigation as Nav
import Browser
import Html exposing (..)
import Html.Attributes exposing (href, class, classList)
import Model exposing (..)
import Views.List exposing (listView)


type Route = HomeRoute | ListRoute

extractUrl : String -> Route
extractUrl route =
  case route of
    "/" ->
      HomeRoute
    "/list" ->
      ListRoute
    _ ->
      HomeRoute

-- VIEW

viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]

bodyView : Model -> Html MainMsg
bodyView model =
  div []
    [ b [] [ text (Url.toString model.url) ]
      , ul []
      [ viewLink "/list" 
        , viewLink "/" 
      ]
      , div [class "content"]
      [ case extractUrl (Url.toString model.url) of
            ListRoute ->
               listView model
            HomeRoute ->
                div [] [text "sdsd"]
        ]
    ]

mainView : Model -> Browser.Document MainMsg
mainView model =
    { title = "Navigation TODOs"
    , body = [ bodyView model ]
    }
