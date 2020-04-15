module View.Desktop.Community exposing
    ( view )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont
import Html
import Html.Attributes
import Palette
import View.Desktop.Lib

view title model =
    { title = title
    , body = 
        [ E.layout
            [ View.Desktop.Lib.navbar
            , E.width E.fill
            ]
            <| mainDocumentColumn model
        ]
    }

defaultFontSize = 15


unit0 = 14
unit1 = 28
unit2 = 56
unit3 = 112

mainDocumentColumn model =
    let
        width = 1080
        -- height = 1000
    in
    E.column
        [ E.width E.fill
        ]
        [ E.column
            [ E.paddingEach { top = 64 -- the height of the navbar
                , right = 0, bottom = 0, left = 0 }
            , E.width <| E.maximum width E.fill
            -- , E.height <| E.px height
            -- , EBackground.color <| E.rgb255 220 220 220
            , E.centerX
            , EFont.family
                [ EFont.typeface Palette.font1
                , EFont.sansSerif
                ]
            , EFont.color <| E.rgb255 40 40 40
            , EFont.size defaultFontSize
            ]
            [ E.el
                [ E.paddingEach { top = unit3, right = 0, bottom = unit3, left = 0 }
                , EFont.size 80
                , EFont.bold
                ]
                <| E.text "Community"



            , E.column
                [
                ]
                [ E.el
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    , EFont.size 22
                    , EFont.bold
                    ]
                    <| E.text "IRC"
                , E.paragraph
                    [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                    ]
                    [ E.text "You can join us in the "
                    , E.html <| Html.code [Html.Attributes.style "font-family" "RobotoMono Nerd Font" ] [ Html.text "#awesome" ]
                    , E.text " channel on the "
                    , View.Desktop.Lib.myNewTabLink "https://www.oftc.net" "OFTC"
                    , E.text " IRC network."
                    ]
                ]



            , E.column
                [
                ]
                [ E.el
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    , EFont.size 22
                    , EFont.bold
                    ]
                    <| E.text "Stack Overflow"
                , E.paragraph
                    [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                    ]
                    [ E.text "You can ask questions on "
                    , View.Desktop.Lib.myNewTabLink "https://www.stackoverflow.com/questions/tagged/awesome-wm" "Stack Overflow"
                    , E.text ". Just make sure you tag them with `awesome-wm`."
                    ]
                ]



            
            , E.column
                [
                ]
                [ E.el
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    , EFont.size 22
                    , EFont.bold
                    ]
                    <| E.text "Reddit"
                , E.column
                    [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                    , E.spacing unit0
                    ]
                    [ E.paragraph
                        -- [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                        [
                        ]
                        [ E.text "We also have an "
                        , View.Desktop.Lib.myNewTabLink "https://www.reddit.com/r/awesomewm/" "awesome subreddit"
                        , E.text "! Feel free to start general conversations about AwesomeWM with the community there."
                        ]
                    , E.paragraph
                        -- [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                        [
                        ]
                        [ E.text "Bummed out? Heads up king, your naruto headband is falling off. "
                        , E.text "Post your config on the "
                        , View.Desktop.Lib.myNewTabLink "https://www.reddit.com/r/awesomewm/" "awesome subreddit"
                        , E.text ", tag it with "
                        , E.html <| Html.code [Html.Attributes.style "font-family" "RobotoMono Nerd Font" ] [ Html.text "[Screenshot]" ]
                        , E.text " in the title and be ready to see it on the "
                        , E.el [ EFont.medium, EFont.color <| E.rgb255 0 0 0 ] <| E.text "AwesomeWM "
                        , View.Desktop.Lib.myNewTabLink "https://www.awesomewm.org/expo" "site's expo section."
                        , E.text " Temporarily ever-lasting glory awaits you."
                        ]
                    ]
                ]



            , E.column
                [
                ]
                [ E.el
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    , EFont.size 22
                    , EFont.bold
                    ]
                    <| E.text "Github"
                , E.column
                    [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                    , E.spacing unit0
                    ]
                    [ E.paragraph
                        -- [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                        [
                        ]
                        [ E.text "AwesomeWM is "
                        , View.Desktop.Lib.myNewTabLink "https://www.github.com/awesomeWM/awesome/" "developed on Github"
                        , E.text ". You can follow (watch) us there, contribute to our decision making and help triage issues. Pull requests and issues are welcome there."
                        ]
                    , E.paragraph
                        -- [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                        [
                        ]
                        [ E.text "You can also browse Github repositories tagged with "
                        , View.Desktop.Lib.myNewTabLink "https://github.com/search?q=topic%3awesomewm" "awesomewm"
                        , E.text ". To find inspiration or snippets of code. Feel welcome to tag your own config so other users can discover it."
                        -- I had an idea with this. probably not gonna do it, but who knows
                        -- , E.text "Ever thought to yourself \" damn this life's just got too few genetically engineered cat girls in it. It's not worth it...\" Heads up, king. Your naruto headband is falling off."
                        -- , E.text """Ok kiddo listen up. Sick of where you're at? Ever thought about fame? Champagne limousines and marble waterfalls. Trunk thick belts and golden palace halls. Now's your time to shine.
                        ]
                    ]
                ]



            , E.column
                [
                ]
                [ E.el
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    , EFont.size 22
                    , EFont.bold
                    ]
                    <| E.text "Old mailing list (now closed)"
                , E.column
                    [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                    , E.spacing unit0
                    ]
                    [ View.Desktop.Lib.myNewTabLink "https://www.mail-archive.com/awesome@naquadah.org/" "The Mail Archive"
                    , View.Desktop.Lib.myNewTabLink "http://dir.gmane.org/gmane.comp.window-managers.awesome" "Gmane archive"
                    , View.Desktop.Lib.myNewTabLink "http://dir.gmane.org/gmane.comp.window-managers.awesome.devel" "Gmane developers list archive"
                    , View.Desktop.Lib.myNewTabLink "https://www.mail-archive.com/awesome-devel@naquadah.org/" "The Mail Archive developers list"
                    ]
                ]



            , E.column
                [
                ]
                [ E.el
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    , EFont.size 22
                    , EFont.bold
                    ]
                    <| E.text "Old wiki"
                , E.column
                    [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                    , E.spacing unit0
                    ]
                    [ E.paragraph
                        []
                        [ E.text "The old wiki has been shut down, but can still be viewed at "
                        , View.Desktop.Lib.myNewTabLink "https://web.archive.org/web/20160701200046/https://awesome.naquadah.org/wiki/Main_Page" "archive.org"
                        , E.text "."
                        ]
                    ]
                ]



            , E.column
                [
                ]
                [ E.el
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    , EFont.size 22
                    , EFont.bold
                    ]
                    <| E.text "Authors"
                , E.column
                    [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                    , E.spacing unit0
                    ]
                    [ E.paragraph
                        []
                        [ View.Desktop.Lib.myNewTabLink "https://github.com/awesomeWM/awesome/graphs/contributors" "See our Github page"
                        , E.text "."
                        ]
                    ]
                ]
            ]



        , View.Desktop.Lib.footer
        ]

