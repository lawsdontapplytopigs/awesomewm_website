module View.Desktop.Home exposing (view)

import Html
import Html.Attributes
import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont
import Icons
import Logo
import Markdown
import Palette
import View.Desktop.Lib

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
        [ block1
        , block2
        ]

-- navbar
block0 = 
    E.inFront <|
        E.el
            [ E.width E.fill
            , E.height (E.px 70)
            , EBackground.color (E.rgb255 255 255 255)
            ]
            <| E.row
                [ E.width (E.fill |> E.maximum 1440)
                , E.height (E.px 70)
                , E.centerX
                ]
                [ E.el 
                    [ E.alignLeft ]
                    ( E.html ( Logo.logo "0.5" ))
                , E.el
                    [ E.alignRight 
                    ]
                    <| E.row
                        [ E.spacing 18
                        ]
                        -- [ View.Desktop.Lib.makeLink "/" "HOME"
                        -- , View.Desktop.Lib.makeLink "/expo" "EXPO"
                        -- , View.Desktop.Lib.makeLink "/download" "DOWNLOAD"
                        -- , View.Desktop.Lib.makeLink "/comunnity" "COMUNNITY"
                        -- ]
                        [ View.Desktop.Lib.makeLink "/" "Home"
                        , View.Desktop.Lib.makeLink "/expo" "Expo"
                        , View.Desktop.Lib.makeLink "/download" "Download"
                        , View.Desktop.Lib.makeLink "/comunnity" "Comunnity"
                        ]
                ]

-- block1 = 

-- block1 =
--     E.text  "Awesomewm is a highly configurable window manager framework for X. 
--                 It is very fast, extensible and licensed under the
--                 "http://www.gnu.org/licenses/old-licenses/gpl-2.0.html" GNU GPLv2 license.
--                 It is primarily targeted at power users, developers and any people dealing with
--                 every day computing tasks and who want to have fine-grained control on their
--                 graphical environment.
--         "


block1 =
    E.column
        [ E.width E.fill
        , E.height (E.px 360)
        , EBackground.gradient
            { angle = 3.14
            , steps = 
                -- [ E.rgb255 20 30 70
                -- , E.rgb255 20 20 70
                -- ]
                [ (E.rgb255 0 0 0)
                , (E.rgb255 0 0 0)
                , (E.rgb255 20 20 20)
                , (E.rgb255 20 20 20)
                , (E.rgb255 20 20 20)
                , (E.rgb255 20 20 20)
                , (E.rgb255 20 20 20)
                , (E.rgb255 0 0 0)
                ]
            }
        ]
        [ E.column
            [ E.htmlAttribute <| Html.Attributes.style "text-align" "center"
            -- , E.centerY
            , E.paddingEach { top = 140, right = 0, bottom = 0, left = 0}
            , E.centerX
            , E.spacing 10
            , E.width (E.px 1440)
            -- , E.spacing 7
            ]
            [ E.el 
                [ E.centerX
                , E.paddingEach { top = 0, right = 0, bottom = 40, left = 0}
                , EFont.medium
                , EFont.size 28
                , EFont.color (E.rgb255 255 255 255)
                , EFont.family
                    [ EFont.typeface "Roboto"
                    ]
                ]
                <| E.text "AwesomeWM: a highly configurable window manager framework for X."
            , E.paragraph
                [ E.centerX
                , E.width (E.px 560)
                , EFont.size 14
                , EFont.color (E.rgb255 255 255 255)
                , EFont.family
                    [ EFont.typeface "Roboto"
                    ]
                ]
                [ E.text "It is very fast, extensible and licensed under the "
                , E.link [] { url = "http://www.gnu.org/licenses/old-licenses/gpl-2.0.html", label = E.text "GNU GPLv2 license."}
                , E.text """ Its target audience is power users, developers and any people dealing with
                            every day computing tasks and who want to have fine-grained control on their
                            graphical environment."""
                ]
            ]
        -- , E.image [] {src="", description = ""}
        ]
        -- [ E.text "Awesomewm is a highly configurable window manager framework for X."
        -- , E.text "It is very fast, extensible and licensed under the"
        -- , E.text "http://www.gnu.org/licenses/old-licenses/gpl-2.0.html\" GNU GPLv2 license."
        -- , E.text "It is primarily targeted at power users, developers and any people dealing with"
        -- , E.text "every day computing tasks and who want to have fine-grained control on their"
        -- , E.text "graphical environment."
        -- ]

block2 =
    E.column
        -- [ EBackground.color <| E.rgb255 
        [ E.height (E.px 600)
        , E.width E.fill
        , E.paddingXY 0 70
        , E.spacing 40
        ]
        [ E.el
            [ E.width E.fill
            , E.height (E.px 50)
            ]
            <| E.el
                [ E.width (E.px 100)
                , E.height (E.fill)
                , E.centerX
                , E.htmlAttribute <| Html.Attributes.style "transform" "skew(-8deg)"
                , EBackground.color (E.rgb255 20 20 20)
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
                        -- [ EFont.typeface "Montserrat Medium"
                        [ EFont.typeface "Roboto Condensed"
                        ]
                    ]
                    <| E.text "Expo"
        , E.row
            [ E.width (E.px 1440)
            , E.centerX
            , E.spacing 80
            ]
            [ makePost 
                { author = "elenapan" 
                , title = "Mechanical Love"
                , likes = 231
                , postPic = "../../../resources/expo_placeholders/7.png"
                -- , profilePic = "../../../resources/default_profile_pic.jpg"
                , profilePic = "../../../resources/elenapan_profile.png"
                , datePosted = "06.01.2020"
                }
            , makePost
                { author = "Elv13" 
                , title = "Matrix Multiplication"
                , likes = 113
                , postPic = "../../../resources/expo_placeholders/3.png"
                , profilePic = "../../../resources/default_profile_pic.jpg"
                , datePosted = "06.01.2020"
                }
            , makePost
                { author = "szorfein" 
                , title = "Anonymous"
                , likes = 207
                , postPic = "../../../resources/expo_placeholders/4.jpg"
                , profilePic = "../../../resources/default_profile_pic.jpg"
                , datePosted = "06.01.2020"
                }
            ]
        ]


makePost { author, title, likes, postPic, profilePic, datePosted } =
    let
        width = 400
        imageHeight = dontShowPastX 16 9 width
    in
    E.column
        [ E.width (E.px width)
        , E.height (E.px 372)
        , EBackground.color (E.rgb255 246 246 246)
        ]
        -- [ E.html
        --     <| Html.div
        --         [ Html.Attributes.style "width" ((String.fromInt width) ++ "px")
        --         , Html.Attributes.style "overflow" "hidden"
        --         , Html.Attributes.style "margin" "0"
        --         ]
        --         [ Html.img
        --             [ Html.Attributes.style "display" "block"
        --             , Html.Attributes.style "width" "100%"
        --             , Html.Attributes.src img
        --             ]
        --             []
        --         ]
        [ E.html
            <| Html.div
                [ Html.Attributes.style "width" ((String.fromInt width) ++ "px")
                , Html.Attributes.style "height" ((String.fromInt imageHeight) ++ "px")
                , Html.Attributes.style "background-image" ("url(" ++ postPic ++ ")")
                , Html.Attributes.style "background-size" "cover"
                -- , Html.Attributes.style "background-position" "center"
                ]
                [
                ]
                -- [ Html.img
                --     [ Html.Attributes.style "display" "block"
                --     , Html.Attributes.style "width" "100%"
                --     , Html.Attributes.src img
                --     ]
                --     []
                -- ]
        -- [ E.image
        --     [ E.
        --     , E.width E.fill
        --     , E.height E.fill
        --     , E.htmlAttribute <| Html.Attributes.style "overflow" "hidden"
        --     , E.htmlAttribute <| Html.Attributes.style "max-height" ((String.fromInt imageHeight) ++ "px")
        --     ]
        --     { src = postPic, description = "LLALALALA" }
            
        , E.column
            [ E.width E.fill
            , E.height E.fill
            ]
            [ E.row -- the row with the like, comment & other buttons
                [ E.width E.fill 
                -- , EBackground.color (E.rgb255 230 70 70)
                , E.paddingXY 14 0
                , E.height (E.px 50)
                ]
                [ E.row
                    [ E.alignLeft
                    , E.spacing 16
                    ]
                    [ E.el 
                        [ E.width (E.px 30)
                        , E.height (E.px 30)
                        , E.centerY
                        ] (E.html (Icons.heart "1"))
                    , E.el
                        [ E.width (E.px 30)
                        , E.height (E.px 30)
                        , E.centerY
                        ] (E.html (Icons.comment "1"))
                    ]
                , E.el
                    [ E.width (E.px 30)
                    , E.height (E.px 30)
                    , E.alignRight
                    , E.centerY
                    ]
                    <| E.html (Icons.dots "1")
                ]
            , E.row -- Likes and Comments row
                [ E.width E.fill
                , E.paddingEach { top = 0, right = 14, bottom = 14 , left = 14 }
                -- , E.alignBottom
                , E.spacing 12
                , EFont.size 14
                , EFont.family
                    -- [ EFont.typeface "Montserrat Medium"
                    [ EFont.typeface "Roboto"
                    ]
                ]
                [ E.text ((String.fromInt likes) ++ " Likes")
                -- , E.text "·"
                , E.text "16 Comments"
                , E.el
                    [ E.alignRight
                    ]
                    <| E.text datePosted
                ]
            , E.el -- TITLE
                [ E.paddingEach { top = 0, right = 0, bottom = 14 , left = 14 }
                , EFont.color (E.rgb255 10 10 10)
                , EFont.size 19
                -- , EFont.letterSpacing 0.1
                , EFont.extraBold
                , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
                , E.htmlAttribute <| Html.Attributes.style "transform" "skew(-8deg)"
                , EFont.family
                    -- [ EFont.typeface "Montserrat Medium"
                    [ EFont.typeface "Roboto Condensed"
                    ]
                ]
                <| E.text title
            , E.row -- author info
                -- [ E.paddingXY 14 0
                [ E.paddingEach { top = 0, right = 0, bottom = 8 , left = 14}
                , E.width E.fill
                -- , E.alignBottom
                ]
                [ E.row
                    [ E.alignLeft
                    , E.spacing 6
                    ]
                    [ E.image
                        [ E.width (E.px 18)
                        , E.height (E.px 18)
                        -- , EBorder.rounded 8
                        , E.htmlAttribute <| Html.Attributes.style "border-radius" "50%"
                        , E.htmlAttribute <| Html.Attributes.style "overflow" "hidden"
                        ]
                        { src = profilePic, description = "Profile Image" }
                    -- , E.el
                    --     [ EFont.color (E.rgb255 60 60 60)
                    --     , EFont.size 14
                    --     , EFont.regular
                    --     , EFont.family
                    --         -- [ EFont.typeface "Montserrat Medium"
                    --         [ EFont.typeface "Roboto"
                    --         ]
                    --     ]
                    --     <| E.text "By "
                    , E.el
                        [ EFont.size 14
                        , EFont.medium
                        , EFont.family
                            -- [ EFont.typeface "Montserrat Medium"
                            [ EFont.typeface "Roboto"
                            ]
                        ]
                        <| E.text author
                    ]
                ]
            -- , E.column
            --     [ 
            --     ]
                -- [ E.
                -- ]
                -- [ E.html    
                --     <| Markdown.toHtml 
                --         [ Html.Attributes.style "overflow" "hidden"
                --         , Html.Attributes.style "max-width" "200"
                --         ]
                --         (truncateText 300 desc)
                -- ]
            ]
        ]

            -- , E.el
            --     [ E.paddingXY 18 4
            --     , EFont.color (E.rgb255 60 60 60)
            --     , EFont.size 14
            --     , EFont.regular
            --     , EFont.family
            --         -- [ EFont.typeface "Montserrat Medium"
            --         [ EFont.typeface "Roboto"
            --         ]
            --     ]
            --     <| E.text "See entire post..."

-------------------
-- Helpers
-------------------


-- for a given width, it outputs the max height that this should show, according to an aspect ratio
dontShowPastX w h width =
    let
        unit = width / w
        max_height = unit * h
    in
        round max_height

truncateText maxChar text =
    String.slice 0 maxChar text

desc = """
# Hello and Merry Christmas r/unixporn !

(Had to repost because imgur converted the image to jpg)

In my quest to make my desktop even more awesome, I had to get familiar with the AwesomeWM widget API.

I want to have info about my computer (CPU usage, temperature, battery...) readily available but I don't want a busy panel.

Thus, I created a toggleable sidebar with all the info I need, as well as useful clickable widgets (volume control, music control, spawn htop, launch file manager, launch any app with rofi, logout).

Also I created an exit screen that can be used easily by both the keyboard and the mouse.

Now my desktop looks cleaner and is a lot more mouse friendly than before.

### Details

* Wallpaper: [original here](https://imgur.com/16ARtWb) and [my edit here](https://imgur.com/OsfFKJ0)

* Album: [here](https://imgur.com/a/RiIvATA)

* WM: Awesome

* Browser: Qutebrowser

* Homepage: [here](https://github.com/Jaredk3nt/homepage) by Jaredk3nt

* Terminal: Termite

* Font: Anka/Coder

* Colorscheme: I call it [lovelace](https://github.com/elenapan/dotfiles/blob/master/.xfiles/lovelace)

* GTK Theme: [here](https://github.com/elenapan/dotfiles/tree/master/misc/gtk) -- made with oomox

* Icons: Linebit for Android (NOTE: non free!)

* Dotfiles: [here](https://github.com/elenapan/dotfiles)

For *even more details* refer to the README in my repo.

Let me know if anything is missing or if you have any questions.
"""
