module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Msg

import Url
import Url.Parser
import View.Desktop.Home
import View.Desktop.Expo


main : Program () Model Msg.Msg
main = Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlRequest = Msg.LinkClicked
    , onUrlChange = Msg.UrlChanged
    }

type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg.Msg)
init flags url key =
    (
        { key = key
        , url = url
        }
        , Cmd.none
    )


subscriptions : Model -> Sub Msg.Msg
subscriptions model =
    Sub.none

update : Msg.Msg -> Model -> ( Model, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Debug.log "" (Url.toString url) ))
                Browser.External href ->
                    ( model, Nav.load href )
        Msg.UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )

view model =
    case toRoute model.url of
        Home ->
            View.Desktop.Home.view "AwesomeWM" model
        Expo ->
            View.Desktop.Expo.view "Exposition" model


type Route
    = Home
    | Expo

routeParser : Url.Parser.Parser (Route -> a) a
routeParser = 
    Url.Parser.oneOf
        [ Url.Parser.map Home (Url.Parser.s "home")
        , Url.Parser.map Expo (Url.Parser.s "expo")
        ]

toRoute url =
    Maybe.withDefault Home (Url.Parser.parse routeParser url)
