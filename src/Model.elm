module Model exposing (..)

import Array exposing (push)
import Url
import Browser exposing (..)
import Browser.Navigation as Nav
import Browser.Navigation exposing (Key)

type alias Model = { 
    current: String
    , names: List String
    , navigationKey : Nav.Key
    , url : Url.Url
    }

type MainMsg
  = AddTask
  | RemoveTask
  | Change String
  | LinkClicked UrlRequest
  | ChangeUrl Url.Url

subscriptions : Model -> Sub MainMsg
subscriptions model =
    Sub.none

init : () -> Url.Url -> Nav.Key -> ( Model, Cmd MainMsg )
init flags url navigationKey =
    ( { current = ""
      , names = ["kiss", "opium"]
      , navigationKey = navigationKey
      , url = url
      }
     , Cmd.none
    )

  -- UPDATE
removeFromList : Int -> List a -> List a
removeFromList i xs =
  (List.take i xs) ++ (List.drop (i+1) xs) 

removeFromArray : Int -> Array.Array a -> Array.Array a 
removeFromArray i =
  Array.toList >> removeFromList i >> Array.fromList 


update : MainMsg -> Model -> ( Model, Cmd MainMsg )
update msg model =
  case msg of
    Change value -> 
      ({ model | current = value }, Cmd.none)
    AddTask ->
      ({ model | current = "", names = model.current :: model.names}, Cmd.none)
    RemoveTask ->
      ({ model | names = removeFromList 0 model.names}, Cmd.none)
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl model.navigationKey (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )

    ChangeUrl _ ->
            ( model, Cmd.none )



      

