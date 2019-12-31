module Main exposing (..)

import Browser
import Browser.Navigation as Nav

import View.Desktop.Home

import Url

main : Program () Model Msg
main = Browser.application
    { init = init
    , view = View.Desktop.Home.view "AwesomeWM"
    , update = update
    , subscriptions = subscriptions
    , onUrlRequest = LinkClicked
    , onUrlChange = UrlChanged
    }

type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key =
    (
        { key = key
        , url = url
        }
        , Cmd.none
    )

type UrlRequest
    = Internal Url.Url
    | External String

type Msg 
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    -- | CardClicked

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )
                Browser.External href ->
                    ( model, Nav.load href )
        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )

