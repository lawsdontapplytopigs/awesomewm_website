module View.Desktop.Home exposing (view)

import Browser
import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
import Element.Font as EFont
import Element.Events as EEvents
import Html
import Html.Attributes
import Icons
import Logo
import Markdown
import Msg
import Palette
import SampleData
import Url
import View.Desktop.Lib

view title model =
    let 
        backgroundColor = E.rgb255 255 255 255
    in
        { title = title
        , body =
            [ (E.layout
                [ EBackground.color backgroundColor
                , View.Desktop.Lib.navbar
                ]
                (mainDocumentColumn model))
            ]
        }

mainDocumentColumn model =
    E.column
        [ E.width E.fill
        ]
        [ block0
        , block1 model
        , block2
        , block3
        , block4
        , block5
        , block6
        , View.Desktop.Lib.footer
        -- , spaceBlock 400
        ]


block0 =
    E.column
        [ E.width E.fill
        , E.height (E.px 360)
        , EBackground.gradient
            { angle = 3.14
            , steps = 
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
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                <| E.text "AwesomeWM: a highly configurable window manager framework for X."
            , E.paragraph
                [ E.centerX
                , E.width (E.px 560)
                , EFont.size 14
                , EFont.color (E.rgb255 255 255 255)
                , EFont.family
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                [ E.text "It is very fast, extensible and licensed under the "
                , E.link 
                    [ E.htmlAttribute <| Html.Attributes.style "text-decoration" "underline"
                    ] { url = "http://www.gnu.org/licenses/old-licenses/gpl-2.0.html", label = E.text "GNU GPLv2 license."}
                , E.text """ Its target audience is power users, developers and any people dealing with
                            every day computing tasks and who want to have fine-grained control on their
                            graphical environment."""
                ]
            ]
        ]


block1 model =
    E.column
        [ E.height (E.px 670)
        , E.width E.fill
        , E.paddingXY 0 70
        , E.spacing 40
        ]
        [ E.column
            [ E.width E.fill
            , E.height (E.px 50)
            , E.centerX
            ]
            [ E.el
                [ E.centerX
                , E.centerY
                , EFont.color (E.rgb255 10 10 10)
                , EFont.size 22
                , EFont.extraBold
                , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
                , E.htmlAttribute <| Html.Attributes.style "transform" "skew(-8deg)"
                , EFont.family
                    [ EFont.typeface Palette.font2
                    , EFont.sansSerif
                    ]
                ]
                <| E.text "Expo"
            , E.el
                [ E.centerX
                ]
                <| E.el
                    [ EBackground.color <| E.rgb255 20 20 20
                    , E.width (E.px 120)
                    , E.height (E.px 3)
                    ]
                    <| E.text ""
            ]
        , E.row
            [ E.width (E.px 1440)
            , E.centerX
            -- , E.spacing 80
            ]
            (List.map makePost (List.take 3 model.expoPosts))
            
            
        , E.el
            [ E.width E.fill
            , E.height (E.px 50)
            ]
            <| E.el
                [ E.width (E.px 120)
                , E.height (E.px 50)
                , E.centerX
                -- , E.htmlAttribute <| Html.Attributes.style "transform" "skew(-8deg)"
                -- , EBackground.color (E.rgb255 20 20 20)
                ]
                <| View.Desktop.Lib.button1 (Just linkLINK) "See More"
        ]

block2 =
    E.el -- background stuff
        [ E.height (E.px 400)
        , E.width E.fill
        , EBackground.gradient
            { angle = 3.14
            , steps = 
                [ (E.rgb255 14 14 14)
                , (E.rgb255 20 20 20)
                , (E.rgb255 20 20 20)
                , (E.rgb255 20 20 20)
                , (E.rgb255 14 14 14)
                ]
            }
        ]
        -- we use a row here because we may decide we want text on one side, and visuals on the other side
        <| E.row
            [ E.width (E.px 1440)
            , E.height E.fill
            , E.centerX
            ]
            [ E.column
                [ E.spacing 40
                ]
                [ E.el
                    [ EFont.size 24
                    , EFont.color (E.rgb255 255 255 255)
                    , EFont.bold
                    , EFont.family
                        [ EFont.typeface Palette.font1
                        , EFont.sansSerif
                        ]
                    ]
                    <| E.text "Why AwesomeWM?"
                , E.textColumn
                [ E.width (E.px 430)
                , E.spacing 20
                , EFont.size 14
                , EFont.color (E.rgb255 255 255 255)
                , EFont.family
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                    [ E.paragraph
                        []
                        [ E.text"""A window manager is one of the most used software 
                            applications in your day-to-day tasks, along with 
                            your web browser, mail reader and text editor."""
                        ]
                    , E.paragraph
                        []
                        [ E.text """We believe configuring it to your specific workflow
                            will make your daily computing tasks much more productive
                            in the long run."""
                        ]
                    ]
                ]
            ]

block3 =
    E.el -- background stuff
        [ E.height (E.px 400)
        , E.width E.fill
        , EBackground.gradient
            { angle = 3.14/2.3
            , steps = 
                [ (E.rgb255 240 234 204 )
                -- , (E.rgb255 240 200 214 )
                , (E.rgb255 240 200 214 )
                ]
                -- [ (E.rgb255 14 14 14)
                -- , (E.rgb255 20 20 20)
                -- , (E.rgb255 20 20 20)
                -- , (E.rgb255 20 20 20)
                -- , (E.rgb255 14 14 14)
                -- ]
            }
        ]
        -- we use a row here because we may decide we want text on one side, and visuals on the other side
        <| E.row
            [ E.width (E.px 1440)
            , E.height E.fill
            , E.centerX
            ]
            [ E.column
                [ E.spacing 40
                , E.alignRight
                , E.htmlAttribute <| Html.Attributes.style "text-align" "right"
                ]
                [ E.el
                    [ EFont.size 24
                    , E.width E.fill
                    , EFont.color (E.rgb255 0 0 0)
                    , EFont.bold
                    , EFont.family
                        [ EFont.typeface Palette.font1
                        , EFont.sansSerif
                        ]
                    ]
                    <| E.text "Ultimate extensibility"
                , E.textColumn
                [ E.width (E.px 500)
                , E.spacing 20
                , EFont.size 14
                , EFont.color (E.rgb255 0 0 0)
                , EFont.family
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                    [ E.paragraph
                        []
                        [ E.text
                            """ Some window managers are very easy to use and set up, such as KDE or Gnome.
                            Others allow more flexibility when it comes to their configuration, such as i3.  """
                        ]
                    , E.paragraph
                        []
                        [ E.text 
                            """ Awesome sets itself apart by being as extensible as it gets: Its code IS its config files. 
                            That's why awesome has been designed as a framework window manager, 
                            allowing you to very easily extend it to fit your own needs."""
                        ]
                    ]
                ]
            ]


block4 =
    E.el -- background stuff
        [ E.height (E.px 400)
        , E.width E.fill
        , EBackground.gradient
            { angle = 3.14
            , steps = 
                [ (E.rgb255 14 14 14)
                , (E.rgb255 20 20 20)
                , (E.rgb255 20 20 20)
                , (E.rgb255 20 20 20)
                , (E.rgb255 14 14 14)
                ]
            }
        ]
        -- we use a row here because we may decide we want text on one side, and visuals on the other side
        <| E.row
            [ E.width (E.px 1440)
            , E.height E.fill
            , E.centerX
            ]
            [ E.column
                [ E.spacing 40
                ]
                [ E.el
                    [ EFont.size 24
                    , EFont.color (E.rgb255 255 255 255)
                    , EFont.bold
                    , EFont.family
                        [ EFont.typeface Palette.font1
                        , EFont.sansSerif
                        ]
                    ]
                    <| E.text "Thoroughly documented api"
                , E.textColumn
                [ E.width (E.px 430)
                , E.spacing 20
                , EFont.size 14
                , EFont.color (E.rgb255 255 255 255)
                , EFont.family
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                    [ E.paragraph
                        []
                        [ E.text "25% of AwesomeWM's source code is documentation. Check out "
                        , E.link 
                            [ E.htmlAttribute <| Html.Attributes.style "text-decoration" "underline"
                            ]
                            { url = "awesomewm.org/docs", label = E.text "the docs." }
                        ]
                    ]
                ]
            ]

block5 =
    E.el -- background stuff
        [ E.height (E.px 400)
        , E.width E.fill
        , EBackground.gradient
            { angle = 3.14/1.6
            , steps = 
                [ (E.rgb255 210 234 224 )
                -- , (E.rgb255 240 200 214 )
                , (E.rgb255 202 200 244 )
                ]
                -- [ (E.rgb255 14 14 14)
                -- , (E.rgb255 20 20 20)
                -- , (E.rgb255 20 20 20)
                -- , (E.rgb255 20 20 20)
                -- , (E.rgb255 14 14 14)
                -- ]
            }
        ]
        -- we use a row here because we may decide we want text on one side, and visuals on the other side
        <| E.row
            [ E.width (E.px 1440)
            , E.height E.fill
            , E.centerX
            ]
            [ E.column
                [ E.spacing 40
                , E.alignRight
                , E.htmlAttribute <| Html.Attributes.style "text-align" "right"
                ]
                [ E.el
                    [ EFont.size 24
                    , E.width E.fill
                    , EFont.color (E.rgb255 0 0 0)
                    , EFont.bold
                    , EFont.family
                        [ EFont.typeface Palette.font1
                        , EFont.sansSerif
                        ]
                    ]
                    <| E.text "Write your own widgets!"
                , E.textColumn
                [ E.width (E.px 500)
                , E.spacing 20
                , EFont.size 14
                , EFont.color (E.rgb255 0 0 0)
                , EFont.family
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                ]
                    [ E.paragraph
                        []
                        [ E.text
                            """AwesomeWM uses the cairo drawing library for drawing, meaning you'll be able to write whatever graphical 
                            extensions you can imagine and rest assured Awesomewm will not hold you back."""
                        ]
                    , E.paragraph
                        []
                        [ E.text 
                            """This also means that should you not like the titlebars, you can rewrite them, same with the taskbar, clock, taglist, etc."""
                        ]
                    ]
                ]
            ]

block6 =
    E.el
        [ E.width E.fill
        , E.height (E.px 80)
        , EBackground.color (E.rgb255 0 0 0)
        ]
        <| E.row
            [ E.width (E.fill |> E.maximum 1440)
            , E.height (E.px 70)
            , E.centerX
            ]
            []

-------------------
-- Helpers
-------------------


-- TODO: Figure out what to do exactly about these kinds of links
linkLINK =
    (Msg.LinkClicked (Browser.Internal url))

url = 
    case (Url.fromString "http://127.0.0.1:7070/expo") of -- FIXME
        Just val ->
            val
        Nothing ->
            { protocol = Url.Http
            , host = "127.0.0.1"
            , port_ = Just 80
            , path = "/"
            , query = Nothing
            , fragment = Nothing
            }

makePost { author, title, likes, postPic, datePosted } =
    let
        width = 400
        imageHeight = dontShowPastX 16 9 width
        date = String.fromInt datePosted
        profilePic = "../../../data/default/default_profile_pic.jpg"-- TODO: get it from reddit
    in
    E.el
        [ E.width E.fill
        ]
        <| E.column
            [ E.width (E.px width)
            , E.height (E.px 342)
            , E.centerX
            ]
            [ E.html
                <| Html.div
                    [ Html.Attributes.style "width" ((String.fromInt width) ++ "px")
                    , Html.Attributes.style "height" ((String.fromInt imageHeight) ++ "px")
                    , Html.Attributes.style "background-image" ("url(" ++ postPic ++ ")")
                    , Html.Attributes.style "background-size" "cover"
                    ]
                    [
                    ]
            , E.column
                [ E.width E.fill
                , E.height E.fill
                ]
                [ E.row -- Likes and Comments row
                    [ E.width E.fill
                    , E.paddingEach { top = 14, right = 7, bottom = 14 , left = 7 }
                    , E.spacing 12
                    , EFont.size 14
                    , EFont.family
                        [ EFont.typeface Palette.font1
                        , EFont.sansSerif
                        ]
                    ]
                    [ E.text ((String.fromInt likes) ++ " Likes")
                    , E.text "16 Comments"
                    , E.el
                        [ E.alignRight
                        ]
                        <| E.text date
                    ]
                , E.el -- TITLE
                    [ E.paddingEach { top = 0, right = 0, bottom = 14 , left = 7 }
                    , EFont.color (E.rgb255 10 10 10)
                    , EFont.size 19
                    , EFont.extraBold
                    , E.htmlAttribute <| Html.Attributes.style "text-transform" "uppercase"
                    , E.htmlAttribute <| Html.Attributes.style "transform" "skew(-8deg)"
                    , EFont.family
                        [ EFont.typeface Palette.font2
                        , EFont.sansSerif
                        ]
                    ]
                    <| E.text title
                , E.row -- author info
                    [ E.paddingEach { top = 0, right = 0, bottom = 8 , left = 7}
                    , E.width E.fill
                    ]
                    [ E.row
                        [ E.alignLeft
                        , E.spacing 6
                        ]
                        [ E.image
                            [ E.width (E.px 18)
                            , E.height (E.px 18)
                            , E.htmlAttribute <| Html.Attributes.style "border-radius" "50%"
                            , E.htmlAttribute <| Html.Attributes.style "overflow" "hidden"
                            ]
                            { src = profilePic, description = "Profile Image" }
                        , E.el
                            [ EFont.size 14
                            , EFont.medium
                            , EFont.family
                                [ EFont.typeface Palette.font1
                                , EFont.sansSerif
                                ]
                            ]
                            <| E.text author
                        ]
                    ]
                ]
            ]

spaceBlock height =
    E.el
        [ E.height (E.px height)
        ]
        <| E.text ""


-- for a given width, it outputs the max height that this should show, according to an aspect ratio
dontShowPastX w h width =
    let
        unit = width / w
        max_height = unit * h
    in
        round max_height

truncateText maxChar text =
    String.slice 0 maxChar text

