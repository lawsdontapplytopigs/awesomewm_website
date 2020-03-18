module View.Desktop.Lib exposing
    ( makeLink 
    , button1
    , navbar
    )

import Element as E
import Element.Background as EBackground
import Element.Events as EEvents
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
            ]
        ]
        { url = url
        , label = E.text label
        }

button1 msg text =
    E.el
        [ E.width E.fill
        , E.height E.fill
        , EEvents.onClick msg
        , EBackground.color (E.rgb255 30 30 30)
        , E.mouseOver 
            [ EBackground.color (E.rgb255 20 20 20)
            ]
        , E.pointer
        ]
        <| E.el
            [ E.centerX
            , E.centerY
            , EFont.color (E.rgb255 10 10 10)
            , EFont.size 19
            , EFont.color (E.rgb255 255 255 255)
            , EFont.extraBold
            , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
            , EFont.family
                [ EFont.typeface "Roboto Condensed"
                ]
            ] <| E.text text

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
                    , makeLink "/comunnity" "Comunnity"
                    ]
                , E.row
                    [ E.alignRight
                    , E.spacing 22
                    ]
                    [ E.el
                        [ E.width (E.px 22)
                        , E.height (E.px 22)
                        ]
                        <| E.html Icons.bell
                    , E.image 
                        [ E.width (E.px 36)
                        , E.height (E.px 36)
                        , E.htmlAttribute <| Html.Attributes.style "border-radius" "50%"
                        , E.htmlAttribute <| Html.Attributes.style "overflow" "hidden"
                        ] 
                        { src = "../../../resources/default_profile_pic.jpg", description="Your profile picture"}
                    ]
                ]
