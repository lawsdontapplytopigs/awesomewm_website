port module Main exposing (..)

import Browser
import Browser.Navigation as Nav

import Json.Decode as JDecode

import Msg

import Url
import Url.Parser

import View.Desktop.Community
import View.Desktop.Download
import View.Desktop.Expo
import View.Desktop.Home
import View.Desktop.Lib.DropDown

-- JavaScript usage: app.ports.websocketIn.send(response);
-- port websocketIn : (String -> msg) -> Sub msg
-- JavaScript usage: app.ports.websocketOut.subscribe(handler);
-- port websocketOut : String -> Cmd msg

port getWindowAndDocumentData : (String -> msg) -> Sub msg

port initialWindowAndDocumentData : (String -> msg) -> Sub msg

-- port getSizeInfoOnLoad : (String -> msg) -> Sub msg

-- main : Program () Model Msg.Msg
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
    -- , dropDownState : View.Desktop.Lib.DropDown.DropDown
    , topicDropDownSelected : View.Desktop.Expo.SortingTopic
    , topicDropDownUpOrDown : View.Desktop.Lib.DropDown.DropDown
    , dateDropDownSelected : View.Desktop.Expo.SortingDate
    , dateDropDownUpOrDown : View.Desktop.Lib.DropDown.DropDown
    , viewportHeight : Int
    , documentHeight : Int
    , documentYOffset : Int
    , expoPosts : List Post
    , initNumberOfPosts : Int
    , shouldWeLoadMorePosts : Bool
    -- , sortByTopic : View.Desktop.Expo.SortingTopic
    -- , sortSinceDate : View.Desktop.Expo.SortingDate
    }

type alias Post =
    { author : String
    , title : String
    , likes : Int
    , postPicUrl : String
    , profilePicUrl : String
    , datePosted : String
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg.Msg)
init flags url key =
    (
        { key = key
        , url = url
        , topicDropDownSelected = View.Desktop.Expo.Hot
        , topicDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp
        , dateDropDownSelected = View.Desktop.Expo.Today
        , dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp
        , documentYOffset = 0
        , documentHeight = 0
        , viewportHeight = 0
        , expoPosts = []
        -- we could calculate this, but fuck it
        -- also for some reason I can't. when i try to get document size info 
        -- and viewport info from javascript, I just get "0"
        , initNumberOfPosts = 0
        , shouldWeLoadMorePosts = False
        }
        , Cmd.none
    )


subscriptions : Model -> Sub Msg.Msg
subscriptions model =
    Sub.batch
        [ getWindowAndDocumentData Msg.GotWindowAndDocumentData
        , initialWindowAndDocumentData Msg.InitialWindowAndDocumentData
        ]

update : Msg.Msg -> Model -> ( Model, Cmd Msg.Msg )
update msg model =
    case msg of
        Msg.LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, (Nav.pushUrl model.key (Url.toString url) ))
                Browser.External href ->
                    ( model, Nav.load href )
        Msg.UrlChanged url ->
            ( { model | url = url }
            , Nav.load <| Url.toString url
            )

        -- in this case `json` is the json data we got from javascript
        Msg.GotWindowAndDocumentData json ->
            let
                -- this basically says "decode `data` using the `sizeData` thing
                resultDecoded = JDecode.decodeString sizeData json
            in
            case resultDecoded of
                Ok data ->
                    ( { model
                        | documentYOffset = data.documentYOffset
                        , documentHeight = data.documentHeight
                        , viewportHeight = data.viewportHeight
                        , shouldWeLoadMorePosts = Debug.log "" <|
                            shouldWeLoadMorePosts 
                                (View.Desktop.Expo.postHeight + View.Desktop.Expo.spacingUnit)
                                data
                                
                      }
                    , Cmd.none
                    )
                -- TODO: I'll have to implement something more sensible for this
                Err _ ->
                    ( model, Cmd.none )

        Msg.InitialWindowAndDocumentData json ->
            let
                decodedJson = JDecode.decodeString sizeData json
            in
            case decodedJson of
                Ok data ->
                    ( { model
                        | initNumberOfPosts = Debug.log "" <|
                            numberOfPostsToLoadInitially 
                                (View.Desktop.Expo.postHeight + View.Desktop.Expo.spacingUnit)
                                data.viewportHeight
                      }
                    , Cmd.none
                    )
                -- TODO: I'll have to implement something more sensible for this
                Err _ ->
                    ( model, Cmd.none )
        ---------------
        -- Expo page
        ---------------

        -- sort by topic drop down
        Msg.SortByTop ->
            ( { model 
                | topicDropDownSelected = View.Desktop.Expo.Top
                , topicDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none )
        Msg.SortByHot ->
            ( { model 
                | topicDropDownSelected = View.Desktop.Expo.Hot
                , topicDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none )
        Msg.SortByNew ->
            ( { model 
                | topicDropDownSelected = View.Desktop.Expo.New
                , topicDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none )
        Msg.RollDownSortByTopicDropDown ->
            ( { model | topicDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledDown }
            , Cmd.none
            )
        Msg.RollUpSortByTopicDropDown ->
            ( { model | topicDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none
            )

        -- sort by date drop down
        Msg.SortFromToday ->
            ( { model 
                | dateDropDownSelected = View.Desktop.Expo.Today
                , dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none )
        Msg.SortFromPastWeek ->
            ( { model 
                | dateDropDownSelected = View.Desktop.Expo.PastWeek
                , dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none )
        Msg.SortFromPastMonth ->
            ( { model 
                | dateDropDownSelected = View.Desktop.Expo.PastMonth
                , dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none )
        Msg.SortFromPastYear ->
            ( { model 
                | dateDropDownSelected = View.Desktop.Expo.PastYear
                , dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none )
        Msg.SortFromAllTime ->
            ( { model 
                | dateDropDownSelected = View.Desktop.Expo.PastYear
                , dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none )
        Msg.RollDownSortByDateDropDown ->
            ( { model | dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledDown }
            , Cmd.none
            )
        Msg.RollUpSortByDateDropDown ->
            ( { model | dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp }
            , Cmd.none
            )

view model =
    case toRoute model.url of
        Home ->
            View.Desktop.Home.view "AwesomeWM" model
        Expo ->
            View.Desktop.Expo.view "Exposition" model
        Download ->
            View.Desktop.Download.view "Download" model
        Community ->
            View.Desktop.Community.view "Community" model


type Route
    = Home
    | Expo
    | Download
    | Community

routeParser : Url.Parser.Parser (Route -> a) a
routeParser = 
    Url.Parser.oneOf
        [ Url.Parser.map Home (Url.Parser.s "home")
        , Url.Parser.map Expo (Url.Parser.s "expo")
        , Url.Parser.map Download (Url.Parser.s "download")
        , Url.Parser.map Community (Url.Parser.s "community")
        ]

toRoute url =
    Maybe.withDefault Home (Url.Parser.parse routeParser url)

-- helpers
numberOfPostsToLoadInitially : Int -> Int -> Int
numberOfPostsToLoadInitially totalPostHeight viewportHeight =
    (viewportHeight // totalPostHeight) + 3


shouldWeLoadMorePosts : Int -> WindowAndDocumentData -> Bool
shouldWeLoadMorePosts totalpostHeight { documentYOffset, documentHeight, viewportHeight } =
    if (documentHeight - totalpostHeight * 3) < documentYOffset + viewportHeight then
        True
    else
        False

-- whatPostsShouldWeLoad : 
    

type alias WindowAndDocumentData =
    { documentYOffset : Int
    , documentHeight : Int
    , viewportHeight : Int
    }

sizeData : JDecode.Decoder WindowAndDocumentData
sizeData =
    JDecode.map3 WindowAndDocumentData
        (JDecode.field "documentYOffset" JDecode.int)
        (JDecode.field "documentHeight" JDecode.int)
        (JDecode.field "viewportHeight" JDecode.int)

