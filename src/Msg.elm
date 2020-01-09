module Msg exposing (Msg(..))

import Browser
import Url


type UrlRequest
    = Internal Url.Url
    | External String

type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
