module Routing exposing (..)

import UrlParser exposing (..)
import Navigation exposing (Location)

import Types exposing (..)


extractRoute : Location -> Route
extractRoute location =
  case (parsePath matchRoute location) of
    Just route ->
      route
    Nothing ->
      NotFoundRoute


extractUrl : Route -> String
extractUrl route =
  case route of
    HomeRoute ->
      "/"
    ListRoute ->
      "/sign-up"
    

matchRoute : Parser (Route -> a) a
matchRoute =
  oneOf
    [ map HomeRoute top
    , map ListRoute (s "sign-up")
    ]
