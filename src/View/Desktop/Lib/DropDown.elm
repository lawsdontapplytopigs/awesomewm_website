module View.Desktop.Lib.DropDown exposing
    ( DropDown(..)
    , Option (..)
    , makeDropDown
    )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Events as EEvents
import Element.Font as EFont
import Element.Input as EInput

import Icons

import Msg

import Palette

type Option value
    = Option value

type OptionState
    = Idle
    | Focused

type DropDown
    = RolledDown
        -- { onChange : ( option -> msg )
        -- , selected : Option
        -- , options : List Option
        -- }
    | RolledUp
        -- {
        -- , selected : Option
        -- , options : List Option
        -- }

makeDropDown : 
    { selected : value
    , selectedToTxt: value -> String
    , options : List ( Option value )
    , onChange : value -> msg
    , rolledUpOrDown : DropDown
    , rollDownMsg : msg
    , rollUpMsg : msg
    } -> E.Element msg
makeDropDown { selected, selectedToTxt, options, onChange, rolledUpOrDown
    , rollDownMsg, rollUpMsg } =
    let
        fontSettings = 
            [ EFont.size 14
            , EFont.color <| E.rgb255 0 0 0
            , EFont.family
                [ EFont.typeface Palette.font1
                , EFont.sansSerif
                ]
            ]
        viewSelectedBox = 
            E.row
                [ (case rolledUpOrDown of
                        RolledDown ->
                            EEvents.onClick rollUpMsg
                        RolledUp ->
                            EEvents.onClick rollDownMsg)
                ]
                [ E.el
                    ([ E.width ( E.px 100)
                    , E.height ( E.px 28 )
                    , E.paddingEach { top = 0, right = 0, bottom = 0, left = 8 }
                    , EBackground.color <| E.rgb255 255 255 255
                    , EBorder.widthEach { top = 0, right = 1, bottom = 0, left = 0}
                    , EBorder.color <| E.rgb255 0 0 0
                    ] ++ fontSettings)
                    <| E.el 
                        [ E.centerY
                        ]
                        <| E.text <| selectedToTxt selected
                , E.el
                    [ E.width (E.px 28)
                    , E.height (E.px 28)
                    , EBackground.color <| E.rgb255 255 255 255
                    ]
                    <| E.html (Icons.triangleDown "0.5")
                ]

        viewOption (Option value) =
            E.el
                ([ E.width ( E.px 100)
                , E.height ( E.px 28 )
                , E.paddingEach { top = 0, right = 0, bottom = 0, left = 8 }
                , EBackground.color <| E.rgb255 255 255 255
                , EEvents.onClick (onChange value)
                , E.mouseOver
                    [ EBackground.color <| E.rgb255 20 170 240
                    ]
                ] ++ fontSettings)
                <| E.el
                    [ E.centerY
                    ] <| E.text <| selectedToTxt value

    in
    case rolledUpOrDown of
        RolledUp ->
            viewSelectedBox
        RolledDown ->
            E.column
                [ E.below <| E.column [] (List.map viewOption options)
                -- [ E.below <| E.el 
                --     [ EFont.color <| E.rgb255 255 255 255
                --     ] 
                    -- ( E.text "LOLOLOWLEUHLKRWJHERL")
                -- [
                ]
                <| [ viewSelectedBox ] 
                -- ++ (List.map viewOption options)


