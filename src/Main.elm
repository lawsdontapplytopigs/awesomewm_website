port module Main exposing (..)

import Browser
import Browser.Navigation as Nav

import Http

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
    , topicDropDownSelected : View.Desktop.Expo.SortingTopic
    , topicDropDownUpOrDown : View.Desktop.Lib.DropDown.DropDown
    , dateDropDownSelected : View.Desktop.Expo.SortingDate
    , dateDropDownUpOrDown : View.Desktop.Lib.DropDown.DropDown
    -- , documentYOffset : Int
    -- , documentHeight : Int
    -- , viewportHeight : Int
    , postsToLoadOnEachIteration : Int

    , expoPosts : List Post
    , postBuffer : List Post
    , next : Maybe String
    , redditJson : String
    , belowThresholdAlready : Bool
    }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg.Msg)
init flags url key =
    let
        numPostsToLoad = 5
        requestCmd =
            Http.get
                -- { url = Debug.log "url " <| ("https://api.reddit.com/r/unixporn/top/?t=all&limit=" ++ (String.fromInt initNumPosts))
                { url = "https://api.reddit.com/r/unixporn/top/?t=all&limit=" ++ (String.fromInt (numPostsToLoad * 3))
                , expect = Http.expectString Msg.GotRedditData
                }
    in
    (
        { key = key
        , url = url
        , topicDropDownSelected = View.Desktop.Expo.Hot
        , topicDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp
        , dateDropDownSelected = View.Desktop.Expo.Today
        , dateDropDownUpOrDown = View.Desktop.Lib.DropDown.RolledUp
        -- , documentYOffset = 0
        -- , documentHeight = 0
        -- , viewportHeight = 0
        -- we could calculate this, but fuck it
        -- also for some reason I can't. when i try to get document size info 
        -- and viewport info from javascript through flags, I just get "0"
        , postsToLoadOnEachIteration = numPostsToLoad
        , expoPosts = []
        -- The reason we have this is because we have to first filter posts
        -- before they end up in `expoPosts` that are going to be displayed
        , postBuffer = []
        -- not sure if I should hardcode this or not.
        -- this is the `id` we get from reddit to know what's the next post.
        -- then you do a `https://api.reddit.com/r/{subreddit}/?limit={int}&after={id}`
        -- and BOOM you're gonna be getting json left and right
        , next = Nothing 
        , redditJson = "" -- TODO: For debugging only - remove later
        , belowThresholdAlready = False
        }
        , case url.path of
            "/" -> 
                requestCmd
            "/expo" ->
                requestCmd
            _ ->
                Cmd.none
    )

subscriptions : Model -> Sub Msg.Msg
subscriptions model =
    if model.url.path == "/expo" then
        -- let
        --     _ = Debug.log "Subscribing to window data" ""
        -- in
        Sub.batch
            [ getWindowAndDocumentData Msg.GotWindowAndDocumentData
            , initialWindowAndDocumentData Msg.InitialWindowAndDocumentData
            ]
    else
        Sub.none

update : Msg.Msg -> Model -> ( Model, Cmd Msg.Msg )
update msg model =
    -- let
        -- _ = Debug.log "url" model.url
    -- in
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

        ----------------
        -- Window Data
        ----------------

        -- in this case `json` is the json data we got from javascript 
        -- (in the form of a string)
        Msg.GotWindowAndDocumentData json ->
            let
                -- this basically says "decode `json` using the `sizeData` 
                -- decoder
                resultDecoded = JDecode.decodeString sizeData json
                -- _ = Debug.log "expoPosts length" (List.length model.expoPosts)
            in
            case resultDecoded of
                Ok data ->
                    let
                        shouldWeLoad = shouldWeLoadMorePosts 
                            (View.Desktop.Expo.postHeight 
                                + View.Desktop.Expo.spacingUnit)
                            data
                        cmd = 
                            -- This might seem confising. We're below the 
                            -- threshold. Shouldn't we send out http requests 
                            -- for posts??

                            -- We shouldn't. Look very carefully at what msg
                            -- we're at. We're getting window and document size
                            -- information. If we're below the threshold and
                            -- we fire away an http request for each and every
                            -- scroll, we'll make like 30 requests, and this
                            -- will only stop requesting when at LEAST one comes
                            -- back, and makes the page taller. 
                            -- Then, the 29 other requests will also come, and
                            -- we'll have the same post 30 times.
                            -- so what we do, is we just 
                            if model.belowThresholdAlready then
                                Cmd.none 
                            else
                                case model.next of
                                    Just after_ ->
                                        case shouldWeLoad of
                                            True ->
                                                Http.get
                                                    -- TODO: use the elm url encoder for the url here
                                                    { url = ("https://api.reddit.com/r/unixporn/top/?t=all&limit=" ++ (String.fromInt model.postsToLoadOnEachIteration) ++ "&after=" ++ after_)
                                                    , expect = Http.expectString Msg.GotRedditData
                                                    }
                                            False ->
                                                Cmd.none
                                    Nothing ->
                                        Debug.log "window and document data, but AFTER IS NOTHING" Cmd.none
                                        -- Cmd.none
                    in
                        ( { model
                            | belowThresholdAlready = shouldWeLoad
                          }
                        , cmd
                        )
                -- TODO: I'll have to implement something more sensible for this
                -- (Even though this can't really fail..)
                Err _ ->
                    ( model, Cmd.none )

        Msg.InitialWindowAndDocumentData json ->
            let
                decodedJson = JDecode.decodeString sizeData json
            in
            case decodedJson of
                Ok data ->
                    let
                        shouldWeLoad = Debug.log "initial 'should we load'" <| shouldWeLoadMorePosts 
                            (View.Desktop.Expo.postHeight 
                                + View.Desktop.Expo.spacingUnit)
                            data
                        -- numberOfPostsToLoadInitially = 
                        --         (minNumberOfPostsToLoadInitially 
                        --             ( View.Desktop.Expo.postHeight 
                        --             + View.Desktop.Expo.spacingUnit)
                        --             data.viewportHeight
                        --         )
                        --         + model.postsToLoadOnEachIteration
                    in
                    ( { model
                        | belowThresholdAlready = shouldWeLoad
                      }
                    , Cmd.none
                    )
                -- TODO: I'll have to implement something more sensible for this
                Err _ ->
                    ( model, Cmd.none )


        ------------------------------
        -- Reddit JSON data handling
        ------------------------------

        Msg.GotRedditData result ->
            let
                okData = case result of
                    Ok string ->
                        string
                    Err _ ->
                        ""
                decodedAfter = JDecode.decodeString decodeAfter okData
                decodedPosts = JDecode.decodeString decodeChildren okData
            in
            case (decodedAfter, decodedPosts) of
                (Ok after, Ok posts) ->
                    let
                        filteredPosts = List.filter validatePost posts
                        currentPostBuffer = Debug.log "currentPostBuffer" <|
                            model.postBuffer ++ filteredPosts
                        weShouldFlushBuffer = 
                            if (List.length currentPostBuffer) >= model.postsToLoadOnEachIteration then
                                True
                            else
                                False
                        -- _ = Debug.log "ok posts, ok after" "uhh"
                    in
                    if weShouldFlushBuffer then
                        ( 
                            { model
                            | redditJson = okData
                            , next = Just after -- FIXME: this can be null
                            , expoPosts = model.expoPosts ++ currentPostBuffer
                            , postBuffer = []
                            , belowThresholdAlready = False
                            }
                        , Cmd.none
                        )
                    else
                        (
                            { model
                            | next = Just after
                            , expoPosts = model.expoPosts
                            , postBuffer = currentPostBuffer
                            , belowThresholdAlready = True
                            }
                        ,
                            let
                                _ = Debug.log "making request with after::::::" after
                            in
                            Http.get
                                -- TODO: use the elm url encoder for the url here
                                { url = ("https://api.reddit.com/r/unixporn/top/?t=all&limit=" ++ (String.fromInt model.postsToLoadOnEachIteration) ++ "&after=" ++ after)
                                , expect = Http.expectString Msg.GotRedditData
                                }
                        )

                -- TODO
                -- handle this properly
                -- NOTES:
                    -- When there's and error with decoding posts, make sure you
                        -- 1. dont ask for more posts
                        -- 2. clear the `expoPosts` array
                        -- 3. probably log it in the console
                (Ok after, Err posts) ->
                    Debug.log "Ok after, Err decoding posts " ( model, Cmd.none )
                (Err after, Ok posts) ->
                    Debug.log "EROR decoding AFTER" ( model, Cmd.none )
                (Err after, Err posts)->
                    Debug.log "ok, EROR decoding both things wtf" ( model, Cmd.none )
                    -- ( {model | redditJson = Debug.log "" <|JDecode.errorToString after}
                    -- , Cmd.none )
                    -- ( model, Cmd.none )

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


        -- FIXME:
        -- I didn't know that ordering by time only works if you first order 
        -- them by `top`. I should make it work that way, since reddit works 
        -- that way

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
minNumberOfPostsToLoadInitially : Int -> Int -> Int
minNumberOfPostsToLoadInitially totalPostHeight viewportHeight =
    (viewportHeight // totalPostHeight)


-- FIXME:
    -- here we're calculating this based on the hardcoded post height in
    -- `src/View/Desktop/Expo` assuming that's how tall each post is going 
    -- to be, but what if we get json data from reddit and we don't have an
    -- image? That might break our assumption.
    -- it actually doesn't. The post turns out to be the same height, we just
    -- dont have an image. (I know this because imgur decided to only hand
    -- out pictures if you first register an app and you have a `client_id`)
shouldWeLoadMorePosts : Int -> WindowAndDocumentData -> Bool
shouldWeLoadMorePosts totalpostHeight { documentYOffset, documentHeight, viewportHeight } =
    if documentHeight - totalpostHeight < documentYOffset + viewportHeight then
        True
    else
        False




-- type alias RedditUrl =
--     { protocol : String
--     , host : String
--     , port_ : Maybe Int
--     , path : String
--     , query : Maybe String
--     , fragment : Maybe String
--     }





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

decodeAfter : JDecode.Decoder String
decodeAfter =
    -- TODO: This can be `null`
    JDecode.at ["data", "after"] JDecode.string

type alias Post =
    { author : String
    , title : String
    , likes : Int
    , domain : String
    , postPic : String
    , datePosted : Int
    }

decodePost : JDecode.Decoder Post
decodePost =
    let
        postDataDecoder =
            JDecode.map6 Post
                ( JDecode.field "author" JDecode.string )
                ( JDecode.field "title" JDecode.string )
                ( JDecode.field "ups" JDecode.int )
                ( JDecode.field "domain" JDecode.string )
                ( JDecode.field "url" JDecode.string )
                ( JDecode.field "created_utc" JDecode.int)
    in
        JDecode.field "data" postDataDecoder

decodeChildren : JDecode.Decoder (List Post)
decodeChildren =
    JDecode.at ["data", "children"] (JDecode.list decodePost)

validatePost post =
    let
        isAwesome = 
            let
                lowTitle = String.toLower post.title
            in
            if (String.startsWith "[awesome]" lowTitle)
            || (String.startsWith "[ awesome ]" lowTitle)
            || (String.startsWith "[ awesome]" lowTitle)
            || (String.startsWith "[awesome ]" lowTitle)
            || (String.startsWith "[awesomewm]" lowTitle)
            || (String.startsWith "[ awesomewm ]" lowTitle)
            || (String.startsWith "[ awesomewm]" lowTitle) then
                True
            else
                False
    in
    -- TODO: make imgur work
    if isAwesome && (String.startsWith "i.redd" post.domain) then
        True
    else
        False

