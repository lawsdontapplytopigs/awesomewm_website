module View.Desktop.Lib exposing
    ( utcSecondsToDateString
    , makeLink 
    , button1
    , myNewTabLink
    , navbar
    , footer
    )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Events as EEvents
import Element.Input as EInput
import Element.Font as EFont
import Html
import Html.Attributes
import Icons
import Logo
import Palette
import Time

utcSecondsToDateString utcSeconds =
    let
        month = 
            case (Time.toMonth Time.utc utcSeconds) of
                Time.Jan ->
                    "1"
                Time.Feb ->
                    "2"
                Time.Mar ->
                    "3"
                Time.Apr ->
                    "4"
                Time.May ->
                    "5"
                Time.Jun ->
                    "6"
                Time.Jul ->
                    "7"
                Time.Aug ->
                    "8"
                Time.Sep ->
                    "9"
                Time.Oct ->
                    "10"
                Time.Nov ->
                    "11"
                Time.Dec ->
                    "12"
    in
    
    String.fromInt (Time.toDay Time.utc utcSeconds)
    ++ "." ++
    month
    ++ "." ++
    String.fromInt (Time.toYear Time.utc utcSeconds)
    

makeLink url label =
    E.link
        [ EFont.color <| E.rgb255 0 0 0
        , EFont.regular
        , EFont.size 14
        , EFont.family
            [ EFont.typeface Palette.font1
            , EFont.sansSerif
            ]
        ]
        { url = url
        , label = E.text label
        }

button1 msg text =
    EInput.button
        [ E.width E.fill
        , E.height E.fill
        , EBackground.color (E.rgb255 30 30 30)
        , E.mouseOver 
            [ EBackground.color (E.rgb255 20 20 20)
            ]
        ]
        { onPress = msg
        , label = E.el 
            [ E.centerX
            , E.centerY
            , EFont.size 19
            , EFont.color (E.rgb255 255 255 255)
            , EFont.extraBold
            , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
            , EFont.family
                [ EFont.typeface Palette.font2
                , EFont.sansSerif
                ]
            ]
            <| E.text text
        }

myNewTabLink url label =
    E.newTabLink
        [ EFont.color <| E.rgb255 40 40 40
        , E.htmlAttribute <| Html.Attributes.style "text-decoration" "underline"
        , EFont.regular
        , EFont.size 15
        , EFont.family
            [ EFont.typeface Palette.font1
            , EFont.sansSerif
            ]
        ]
        { url = url
        , label = E.text label
        }

-- navbar
navbar = 
    E.inFront <|
        E.el
            [ E.width E.fill
            , E.height (E.px 64)
            , EBackground.color (E.rgb255 255 255 255)
            ]
            <| E.row
                [ E.width (E.fill |> E.maximum 1440)
                , E.height (E.px 70)
                , E.centerX
                ]
                [ E.el 
                    [ E.alignLeft 
                    , E.width (E.px 90)
                    , E.height (E.px 60)
                    ]
                    ( E.html ( Logo.logo "90" "60" ))
                , E.row
                    [ E.spacing 18
                    , E.paddingEach { top = 0, right = 0, bottom = 0, left = 24 }
                    ]
                    [ makeLink "/" "Home"
                    , makeLink "/expo" "Expo"
                    , makeLink "/download" "Download"
                    , makeLink "/community" "Comunnity"
                    , makeLink "/docs" "Docs"
                    ]
                ]

footer =
    E.el
        [ E.width E.fill
        , E.height (E.px 64)
        -- , EBorder.widthEach { top = 1, right = 0, bottom = 0, left = 0 }
        , EBackground.color (E.rgb255 0 0 0)
        , EFont.color <| E.rgb255 255 255 255
        , EFont.light
        , EFont.size 14
        , EFont.family
            [ EFont.typeface Palette.font1
            ]
        ]
        <| E.row
            [ E.width <| E.maximum 1080 E.fill
            , E.height E.fill
            , E.centerX
            , E.centerY
            ]
            [ E.el 
                [ E.height <| E.px 16
                , E.width <| E.px 16
                ] <|E.html <| Icons.copyright "#ffffff"
            , E.row
                [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 7}
                ] 
                [ E.text "Copyright 2007 - 2020, The Awesome Project"
                ]
            , E.el
                [ E.alignRight
                ] <| E.text "Last edited on Tuesday, 14.04.2020"
            ]
