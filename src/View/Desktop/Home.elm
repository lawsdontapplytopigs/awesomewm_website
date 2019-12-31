module View.Desktop.Home exposing (view)

import Html
import Element as E
import Element.Background as EBackground
import Logo

view title model =
    let 
        backgroundColor = E.rgb255 247 247 245
    in
        { title = title
        , body =
            [ (E.layout
                [ EBackground.color backgroundColor
                ]
                (mainDocumentColumn model))
            ]
        }

mainDocumentColumn model =
    E.column
        [ E.width E.fill
        , block0
        ]
        -- [ block0
        [
        -- , block1
        ]

-- navbar
block0 = 
    E.inFront <|
        E.el
            [ E.width E.fill
            , E.height (E.px 70)
            , EBackground.color (E.rgb255 200 200 200)
            ]
            <| E.row
                [ E.width (E.fill |> E.maximum 1440)
                , E.height (E.px 70)
                , E.centerX
                ]
                [ E.el 
                    []
                    ( E.html (Logo.logo "0.5"))
                ]

block1 = 

-- block1 =
--     E.text  "Awesomewm is a highly configurable window manager framework for X. 
--                 It is very fast, extensible and licensed under the
--                 "http://www.gnu.org/licenses/old-licenses/gpl-2.0.html" GNU GPLv2 license.
--                 It is primarily targeted at power users, developers and any people dealing with
--                 every day computing tasks and who want to have fine-grained control on their
--                 graphical environment.
--         "

