module View.Desktop.Lib exposing
    ( makeLink 
    , button1
    )

import Element as E
import Element.Background as EBackground
import Element.Events as EEvents
import Element.Font as EFont
import Html
import Html.Attributes
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
