module View.Desktop.Lib exposing
    ( makeLink )

import Element as E
import Element.Font as EFont
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


