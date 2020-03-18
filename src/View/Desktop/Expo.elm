module View.Desktop.Expo exposing ( view )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont
import Element.Events as EEvents
import View.Desktop.Lib

view title model = 
    let backgroundColor = E.rgb255 255 255 255
    in
        { title = title
        , body =
            [ (E.layout
                [ EBackground.color backgroundColor
                , View.Desktop.Lib.navbar
                ]
                <| E.none
              )
            ]
        }

mainDocumentColumn model =
    E.column
        [ E.width E.fill
        ]
        [ 
        ]



-- makeBigPost { author, title, likes, postPic, profilePic, datePosted } =
--     let
--         width =

