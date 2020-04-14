module View.Desktop.Lib exposing
    ( makeLink 
    , button1
    , myNewTabLink
    , navbar
    )

import Element as E
import Element.Background as EBackground
import Element.Events as EEvents
import Element.Input as EInput
import Element.Font as EFont
import Html
import Html.Attributes
import Icons
import Logo
import Palette

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

-- button1 msg text =
--     E.el
--         [ E.width E.fill
--         , E.height E.fill
--         , EEvents.onClick msg
--         , EBackground.color (E.rgb255 30 30 30)
--         , E.mouseOver 
--             [ EBackground.color (E.rgb255 20 20 20)
--             ]
--         , E.pointer
--         ]
--         <| E.el
--             [ E.centerX
--             , E.centerY
--             , EFont.color (E.rgb255 10 10 10)
--             , EFont.size 19
--             , EFont.color (E.rgb255 255 255 255)
--             , EFont.extraBold
--             , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
--             , EFont.family
--                 [ EFont.typeface "Roboto Condensed"
--                 , EFont.sansSerif
--                 ]
--             ] <| E.text text

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
                [ EFont.typeface "Roboto Condensed"
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
