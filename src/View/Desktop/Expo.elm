module View.Desktop.Expo exposing 
    ( view 
    , SortingTopic(..)
    , SortingDate(..)
    , postHeight
    , spacingUnit
    )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
-- import Element.Events as EEvents
import Element.Font as EFont
import Element.Input as EInput
import Html
import Html.Attributes
import Icons
import Msg
import Palette
import SampleData
import View.Desktop.Lib
import View.Desktop.Lib.DropDown

availableWidth = 1440
postWidth = 860 -- (max width)
postHeight = 580
spacingUnit = 50
totalSpacingWidth = spacingUnit * 4
-- postSectionWidth = postWidth + (2 * spacingUnit)
infoSectionRemainingWidth = 1440 - postWidth - totalSpacingWidth
infoSectionReservedSpace = infoSectionRemainingWidth + spacingUnit*3
sortingPreferencesSectionHeight = 64

view title model = 
    let backgroundColor = E.rgb255 255 255 255
    in
        { title = title
        , body =
            [ ( E.layout
                [ EBackground.color backgroundColor
                , View.Desktop.Lib.navbar
                ]
                <| mainDocumentColumn model
              )
            ]
        }

mainDocumentColumn model =
    E.column
        [ E.width E.fill
        , E.paddingEach 
            { top = 64 -- (the height of the navbar)
            , right = 0, bottom = 0, left = 0 }
        -- , EBackground.color <| E.rgb255 40 40 40
        ]
        [ E.row
            -- [ EBackground.color <| E.rgb255 60 60 60 -- for debuggning
            [ E.height (E.px 4200)
            , E.width (E.maximum availableWidth E.fill)
            , E.centerX
            , EBackground.color <| E.rgba255 230 210 210 0-- for debuggning
            ]
            [ space spacingUnit
            , postsSection model
            , space spacingUnit
            , space spacingUnit
            , infoSection model
            , space spacingUnit
            ]
        ]

sortingPreferencesSection model =
    let
        sortByTopicDropDown =
            E.row
                []
                [ E.el
                    [ E.paddingEach { top = 0, right = 10, bottom = 0, left = 20 }
                    , EFont.size 14
                    , EFont.color <| E.rgb255 255 255 255
                    , EFont.family
                        [ EFont.typeface Palette.font1
                        , EFont.sansSerif
                        ]
                    ]
                    <| E.text "Sort by:"
                , View.Desktop.Lib.DropDown.makeDropDown
                    { selected = model.topicDropDownSelected
                    , selectedToTxt = topicToTxt
                    , options =
                        [ (View.Desktop.Lib.DropDown.Option Top)
                        , (View.Desktop.Lib.DropDown.Option Hot)
                        , (View.Desktop.Lib.DropDown.Option New)
                        ]
                    , onChange = topicToMsg
                    , rolledUpOrDown = model.topicDropDownUpOrDown
                    , rollDownMsg = Msg.RollDownSortByTopicDropDown
                    , rollUpMsg = Msg.RollUpSortByTopicDropDown
                    }
                ]
        sortByDateDropDown =
            E.row
                []
                [ E.el
                    [ E.paddingEach { top = 0, right = 10, bottom = 0, left = 20 }
                    , EFont.size 14
                    , EFont.color <| E.rgb255 255 255 255
                    , EFont.family
                        [ EFont.typeface Palette.font1
                        , EFont.sansSerif
                        ]
                    ]
                    <| E.text "Since:"
                , View.Desktop.Lib.DropDown.makeDropDown
                    { selected = model.dateDropDownSelected
                    , selectedToTxt = dateToTxt
                    , options =
                        [ (View.Desktop.Lib.DropDown.Option Today)
                        , (View.Desktop.Lib.DropDown.Option PastWeek)
                        , (View.Desktop.Lib.DropDown.Option PastMonth)
                        , (View.Desktop.Lib.DropDown.Option PastYear)
                        , (View.Desktop.Lib.DropDown.Option AllTime)
                        ]
                    , onChange = dateToMsg
                    , rolledUpOrDown = model.dateDropDownUpOrDown
                    , rollDownMsg = Msg.RollDownSortByDateDropDown
                    , rollUpMsg = Msg.RollUpSortByDateDropDown
                    }
                ]
    in
    E.row
        [ E.height (E.px sortingPreferencesSectionHeight)
        , E.width (E.px postWidth)
        , EBackground.color <| E.rgb255 20 20 20
        ]
        [ sortByTopicDropDown
        , sortByDateDropDown
        ]

topicToTxt val = 
    case val of
        Top ->
            "Top"
        Hot ->
            "Hot"
        New ->
            "New"

topicToMsg value =
    case value of
        Top ->
            Msg.SortByTop
        Hot -> 
            Msg.SortByHot
        New ->
            Msg.SortByNew

type SortingTopic
    = Top
    | Hot
    | New

type SortingDate
    = Today
    | PastWeek
    | PastMonth
    | PastYear
    | AllTime

dateToTxt date =
    case date of
        Today ->
            "Today"
        PastWeek ->
            "Past Week"
        PastMonth ->
            "Past Month"
        PastYear ->
            "Past Year"
        AllTime ->
            "All Time"

dateToMsg date =
    case date of
        Today ->
            Msg.SortFromToday
        PastWeek ->
            Msg.SortFromPastWeek
        PastMonth ->
            Msg.SortFromPastMonth
        PastYear ->
            Msg.SortFromPastYear
        AllTime ->
            Msg.SortFromAllTime

infoSection model = 
    E.column
        [ E.width ( E.px infoSectionRemainingWidth )
        , E.height E.fill
        -- , EBackground.color <| E.rgb255 40 80 230
        , E.alignTop
        , E.paddingEach 
            { top = 50 -- (the height of the navbar)
            , right = 0, bottom = 0, left = 0 }
        ]
        [ infoCard1
        ]

postsSection model = 
    let
        width = postWidth
    in
    E.column
        [ E.width (E.fill |> E.maximum width)
        , E.alignTop
        , E.spacing spacingUnit
        -- , E.paddingXY 38 0
        , E.paddingEach { top = spacingUnit, right = 0, bottom = 0, left = 0 }
        , E.htmlAttribute <| Html.Attributes.id "postsNode"
        ]
        [ sortingPreferencesSection model
        , makeBigPost
            SampleData.data1
            -- { author = "ses"
            -- , title = "Title"
            -- , likes = 10
            -- , postPic = "url"
            -- , profilePic = "url"
            -- , datePosted = "10.09.2019"
            -- }
        , makeBigPost
            SampleData.data2
            -- { author = "ses"
            -- , title = "Title"
            -- , likes = 10
            -- , postPic = "url"
            -- , profilePic = "url"
            -- , datePosted = "10.09.2019"
            -- }
        , makeBigPost
            SampleData.data3
        ]

-- fromOption : EInput.Option -> Msg.Msg
-- fromOption ( Option value msg )=

-- postsColumn model =
--     let
--         width = postWidth
--     in

space width =
    E.el
        [ E.width <| E.maximum width E.fill
        ]
        <| E.text ""

separator = 
    E.el -- separator
        [ E.width (E.px 1)
        , E.height (E.px (500 + 100))
        , EBackground.color <| E.rgb255 200 200 200
        , E.alignTop
        ]
        <| E.text ""

makeBigPost { author, title, likes, postPic, profilePic, datePosted } =
    let
        -- height = 9/16 * width
        width = postWidth
        height = postHeight
        imageHeight = round <| (9/16) * width
    in
        E.column
            [ E.width E.fill
            , E.height (E.px (round height))
            -- , EBorder.width 1
            -- , EBorder.rounded 4
            , E.htmlAttribute <| Html.Attributes.style "overflow" "hidden"
            ]
            [ E.html
                <| Html.div
                    [ Html.Attributes.style "width" ((String.fromInt width) ++ "px")
                    , Html.Attributes.style "height" ((String.fromInt imageHeight) ++ "px")
                    , Html.Attributes.style "background-image" ("url(" ++ postPic ++ ")")
                    , Html.Attributes.style "background-size" "cover"
                    ]
                    [ 
                    ]
            , E.row -- Likes and Comments row
                [ E.width E.fill
                , E.paddingEach { top = 14, right = 14, bottom = 14 , left = 14 }
                , E.spacing 12
                , EFont.size 14
                , EFont.family
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                [ E.text ((String.fromInt likes) ++ " Likes")
                , E.text "16 Comments"
                , E.el
                    [ E.alignRight
                    ]
                    <| E.text datePosted
                ]
            , E.row
                [ E.width E.fill
                -- , EBackground.color <| E.rgb255 80 203 200
                ]
                [ E.el -- TITLE
                    [ E.paddingEach { top = 0, right = 0, bottom = 0 , left = 14 }
                    , EFont.color (E.rgb255 10 10 10)
                    , EFont.size 19
                    , EFont.extraBold
                    , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
                    , E.htmlAttribute <| Html.Attributes.style "transform" "skew(-8deg)"
                    , EFont.family
                        [ EFont.typeface Palette.font2
                        , EFont.sansSerif
                        ]
                    ]
                    <| E.text title
                , E.row -- author info
                    [ E.spacing 6
                    , E.paddingEach { top = 0, right = 14, bottom = 0 , left = 0}
                    -- , E.width E.fill
                    -- , EBackground.color <| E.rgb255 230 210 20
                    , E.alignRight
                    ]
                    [ E.el
                        [ EFont.size 14
                        , EFont.medium
                        , EFont.family
                            [ EFont.typeface Palette.font1
                            , EFont.sansSerif
                            ]
                        ]
                        <| E.text author
                    , E.image
                        [ E.width (E.px 18)
                        , E.height (E.px 18)
                        , E.htmlAttribute <| Html.Attributes.style "border-radius" "50%"
                        , E.htmlAttribute <| Html.Attributes.style "overflow" "hidden"
                        ]
                        { src = profilePic, description = "Profile Image" }
                    ]
                ]
            ]

--infoSection model = 
--    in
--    E.row
--        [ E.width (E.px availableWidth)
--        , E.height (E.px 520 )
--        -------------------------------------------------------------------TODO
--        -- try to use the css `position : fixed` property
--        , EBackground.color <| E.rgba255 200 200 180 0
--        , E.paddingEach 
--            { top = 64 + spacingUnit-- (the height of the navbar)
--            , right = 0, bottom = 0, left = 0 }
--        ]
--        [ infoColumn
--        ]

infoCard1 =
    E.row
        [ E.width <| Debug.log "" <| E.px infoSectionRemainingWidth
        , E.height (E.px 180)
        , EBackground.gradient
            { angle = 1.9
            , steps = 
                -- [ (E.rgb255 160 200 225)
                -- , (E.rgb255 170 240 215)
                -- ]
                -- [ (E.rgb255 160 190 235)
                -- , (E.rgb255 150 220 220)
                -- ]
                [ (E.rgb255 20 60 95)
                , (E.rgb255 40 100 120)
                ]
            }
        -- , EBorder.width 1
        , EBorder.color <| E.rgb255 140 200 255
        , EBorder.rounded 7
        -- , E.htmlAttribute <| Html.Attributes.style "position" "fixed"
        ]
        [ E.el
            [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 24 }
            -- , EBackground.color <| E.rgb255 80 80 80
            ]
            <| E.el
                [ E.width <|E.px 42
                , E.height <| E.px 42
                ]
                <| E.html (Icons.info "1" "#ffffff")
        , E.column
            [ E.width E.fill
            , E.paddingEach { top = 0, right = 24 , bottom = 0, left = 24 }
            , E.spacing 12
            ]
            [ E.paragraph
                [ EFont.size 14
                , EFont.medium
                , EFont.color <| E.rgb255 255 255 255
                , EFont.family
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                [ E.text "Would you like to have your post featured?"
                ]
            , E.paragraph
                -- [ E.paddingEach {
                [ EFont.size 12
                , EFont.color <| E.rgb255 255 255 255
                , EFont.family
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                [ E.text """Simply post your work on the 'r/awesomewm' subreddit, 
                    tag your post with `[Screenshot]` in the title, and it'll be
                    automatically displayed on our site!"""
                ]
            ]
        ]

-- spacing unit:
    -- 38
