module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Msg

import Url
import View.Desktop.Home


main : Program () Model Msg.Msg
main = Browser.application
    { init = init
    , view = View.Desktop.Home.view "AwesomeWM"
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
            , Nav.load (Url.toString url)
            )

