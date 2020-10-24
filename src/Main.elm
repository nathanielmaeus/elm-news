module Main exposing (..)
import Url
import Browser.Navigation as Nav
import Browser
import Model exposing (..)
import Routes exposing (..)

main : Program () Model MainMsg
main = Browser.application
        { init = init
        , view = mainView
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = ChangeUrl
        }