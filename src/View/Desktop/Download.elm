module View.Desktop.Download exposing
    ( view
    )

import Element as E
import Element.Background as EBackground
import Element.Border as EBorder
-- import Element.Events as EEvents
import Element.Font as EFont
import Element.Input as EInput
import Html
import Html.Attributes
import Icons
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

unit0 = 14
unit1 = 28
unit2 = 56
unit3 = 112

mainDocumentColumn model =
    let
        height = 2400
        width = 1080
    in
    E.column
        [ E.paddingEach { top = 64, right = 0, bottom = 0, left = 0}
        , E.width <| E.maximum width E.fill
        -- , EBackground.color <| E.rgb255 200 220 255
        , E.height (E.px height)
        , E.centerX
        , EFont.family
            [ EFont.typeface Palette.font1
            , EFont.sansSerif
            ]
        , EFont.color <| E.rgb255 40 40 40
        ]
        [ 



        E.el
            [ E.paddingEach { top = unit3, right = 0, bottom = unit2, left = 0 }
            , EFont.bold
            , EFont.size 80
            ]
            <| E.text "Download:"
        , E.el
            [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0}
            , EFont.medium
            , EFont.family
                -- [ EFont.typeface Palette.font2
                [ EFont.typeface Palette.font1
                , EFont.sansSerif
                ]
            , EFont.size 22
            ]
            <| E.text "Packages:"
        , E.column
            [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 0 }
            , E.width E.fill
            , EFont.regular
            , EFont.size 15
            ]
            [ E.column
                [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0 }
                , E.spacing 8
                ]
                [ E.text "Arch Linux:" -- arch linux section
                , E.column
                    [ E.paddingEach { top = 0, right = 0, bottom = 0, left = unit1 }
                    , E.spacing 6
                    ]
                    [ View.Desktop.Lib.myNewTabLink "https://www.archlinux.org/packages/community/x86_64/awesome/" "stable"
                    , View.Desktop.Lib.myNewTabLink "https://aur.archlinux.org/packages/awesome-git" "awesome-git in AUR"
                    , View.Desktop.Lib.myNewTabLink "https://aur.archlinux.org/packages/awesome-luajit-git" "awesome-luajit-git in AUR"
                    ]
                , View.Desktop.Lib.myNewTabLink "https://packages.debian.org/awesome" "Debian"
                , View.Desktop.Lib.myNewTabLink "https://packages.ubuntu.com/awesome" "Ubuntu"
                , View.Desktop.Lib.myNewTabLink "https://apps.fedoraproject.org/packages/awesome" "Fedora"
                , View.Desktop.Lib.myNewTabLink "https://www.freshports.org/x11-wm/awesome/" "FreeBSD"
                , View.Desktop.Lib.myNewTabLink "https://packages.gentoo.org/package/x11-wm/awesome" "Gentoo"
                , View.Desktop.Lib.myNewTabLink "http://openports.se/x11/awesome" "OpenBSD"
                , View.Desktop.Lib.myNewTabLink "http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/wm/awesome/" "NetBSD"
                , View.Desktop.Lib.myNewTabLink "http://codex.sourcemage.org/test/windowmanagers/awesome/" "Source Mage GNU"
                , View.Desktop.Lib.myNewTabLink "https://t2-project.org/packages/awesome.html" "T2 SDE"
                , View.Desktop.Lib.myNewTabLink "http://crux.nu/portdb/index.php?q=awesome&amp;a=search&amp;s=true" "CRUX"
                , View.Desktop.Lib.myNewTabLink "http://download.opensuse.org/repositories/X11:/windowmanagers/" "OpenSUSE"
                , View.Desktop.Lib.myNewTabLink "https://notabug.org/milislinux/milis/src/master/talimatname/genel/a/awesome" "Millis Linux"
                , View.Desktop.Lib.myNewTabLink "https://pld-linux.org" "PLD Linux"
                , View.Desktop.Lib.myNewTabLink "http://mageia.madb.org/package/show/application/0/name/awesome" "Mageia"
                , View.Desktop.Lib.myNewTabLink "https://pkg.openindiana.org/hipster/en/search.shtml?token=awesome&amp;action=Search" "OpenIndiana"
                ]
            , E.row
                -- I would add here bottom padding for the next section, 
                -- but for some reason it breaks
                [ E.width E.fill 
                , E.height (E.px 54)
                , EBackground.color <| E.rgb255 216 228 255
                , EBorder.width 1
                , EBorder.color <| E.rgb255 190 210 235
                , EBorder.rounded 6
                ]
                [ E.el
                    [ E.width <| E.px 54
                    ]
                    <| E.html (Icons.info "0.47" Palette.color0)
                , E.paragraph
                    []
                    [ E.text "Repology provides a " 
                    , View.Desktop.Lib.myNewTabLink "https://repology.org/metapackage/awesome/versions" "comprehensive overview "
                    , E.text "of which version of "
                    , E.el 
                        [ EFont.medium, EFont.color <| E.rgb255 0 0 0 ] <| E.text "AwesomeWM "
                    , E.text "is included in which distribution"
                    ]
                ]



            , E.el
                [ E.paddingEach { top = unit2, right = 0, bottom = unit1, left = 0}
                , EFont.medium
                , EFont.family
                    -- [ EFont.typeface Palette.font2
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                , EFont.size 22
                ] <| E.text "Distributions using AwesomeWM as the default window manager:"
            , E.column
                [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 0 }
                , E.spacing 6
                ]
                [ View.Desktop.Lib.myNewTabLink "https://gobolinux.org" "GoboLinux"
                ]



            , E.el
                [ E.paddingEach { top = unit2, right = 0, bottom = unit1, left = 0}
                , EFont.medium
                , EFont.family
                    -- [ EFont.typeface Palette.font2
                    [ EFont.typeface Palette.font1
                    , EFont.sansSerif
                    ]
                , EFont.size 22
                ] <| E.text "Building from source:"
            , E.column
                [ E.paddingEach { top = 0, right = 0, bottom = unit2, left = 0 }
                ]
                [ E.row
                    -- I would add here bottom padding for the next section, 
                    -- but for some reason it breaks
                    [ E.width E.fill 
                    , E.height (E.px 54)
                    , EBackground.color <| E.rgb255 255 214 228
                    , EBorder.width 1
                    , EBorder.color <| E.rgb255 255 185 216
                    , EBorder.rounded 6
                    ]
                    [ E.el
                        [ E.width <| E.px 54
                        ]
                        <| E.html (Icons.info "-0.47" Palette.color1)
                    , E.paragraph
                        []
                        [ E.text "We strongly recommend using the "
                        , E.el
                            [ EFont.medium, EFont.color <| E.rgb255 0 0 0 ] <| E.text "AwesomeWM "
                        , E.text "package of your distribution."
                        ]
                    ]
                , E.column
                    [ E.spacing unit1
                    , E.paddingEach { top = unit1, right = 0, bottom = unit2 , left = 0 }
                    , EFont.color <| E.rgb255 40 40 40
                    , EFont.size 15
                    ]
                    [ E.paragraph
                        []
                        [ E.text "This is because many people who tried to build from source had problems. "
                        , View.Desktop.Lib.myNewTabLink "https://github.com/pavouk/lgi" "LGI"
                        , E.text """, one of awesome's dependencies, currently hardcodes the package search 
                            path used by Lua 5.1. Part of the reason for this is that Lua upstream intends 
                            Lua to be embedded, which means that detecting an installed Lua version properly 
                            is not easy."""
                        ]
                    , E.paragraph
                        []
                        [ E.text """
                            After installing awesome, you can check if you are affected by this problem by
                            running """
                        , E.html <| Html.code [Html.Attributes.style "font-family" "RobotoMono Nerd Font" ] [ Html.text "awesome -v" ]
                        , E.text """. If an error message is displayed instead of LGI version's
                            number, you are likely affected."""
                        ]
                    ]


                -- Stable
                , E.column
                    []
                    [ E.el
                        [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0}
                        , EFont.medium
                        , EFont.family
                            -- [ EFont.typeface Palette.font2
                            [ EFont.typeface Palette.font1
                            , EFont.sansSerif
                            ]
                        , EFont.size 18
                        ]
                        <| E.text "Stable:"
                    , E.paragraph
                        [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0}
                        ]
                        [ E.text "Latest stable version of "
                        , E.el
                            [ EFont.medium, EFont.color <| E.rgb255 0 0 0 ] <| E.text "AwesomeWM "
                        , E.text "is version 4.3 "
                        , E.el
                            [ EFont.color <| E.rgb255 0 0 0, EFont.italic ] <| E.text "\"Too long\""
                        , E.text ", released on 28 January 2019."
                        ]
                    ]

                , E.el -- download table
                    -- we have to do the padding here. if we do it in the table itself, it breaks
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    ]
                    <| E.column
                        [ EBackground.color <| E.rgb255 228 228 228
                        , EBorder.color <| E.rgb255 160 160 160
                        , EBorder.width 1
                        , EBorder.rounded 8
                        ]
                        [ E.row
                            [ E.height <| E.px 46
                            , E.width <| E.px 360
                            ]
                            [ githubNewTabLink "https://github.com/awesomeWM/awesome-releases/raw/master/awesome-4.3.tar.bz2" "awesome-4.3.tar.bz2"
                            , separatorV
                            , gpgNewTabLink "https://github.com/awesomeWM/awesome-releases/raw/master/awesome-4.3.tar.bz2.asc" "GPG signature"
                            ]
                        , separatorH
                        , E.row
                            [ E.height <| E.px 46
                            , E.width <| E.px 360
                            ]
                            [ githubNewTabLink "https://github.com/awesomeWM/awesome-releases/raw/master/awesome-4.3.tar.xz" "awesome-4.3.tar.xz"
                            , separatorV
                            , gpgNewTabLink "https://github.com/awesomeWM/awesome-releases/raw/master/awesome-4.3.tar.xz.asc" "GPG signature"
                            ]
                        ]
                , E.el
                    -- we have to do the padding here. if we do it in the table itself, it breaks
                    [ E.paddingEach { top = 0, right = 0, bottom = unit2, left = 0 }
                    ]
                    <| E.row
                        [ EBackground.color <| E.rgb255 228 228 228
                        , EBorder.color <| E.rgb255 160 160 160
                        , EBorder.width 1
                        , EBorder.rounded 8
                        , E.height <| E.px 40
                        , E.width <| E.px 270
                        ]
                        [ bookNewTabLink "https://awesomewm.org/changelogs/v4.3.txt" "v4.3 changelog" 150
                        , separatorV
                        , bookNewTabLink "https://awesomewm.org/changelogs/short/v4.3.txt" "short log" 130
                        ]


                -- Old stable
                , E.column
                    []
                    [ E.el
                        [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0}
                        , EFont.medium
                        , EFont.family
                            -- [ EFont.typeface Palette.font2
                            [ EFont.typeface Palette.font1
                            , EFont.sansSerif
                            ]
                        , EFont.size 18
                        ]
                        <| E.text "Old Stable:"
                    , E.paragraph
                        [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0}
                        , EFont.color <| E.rgb255 250 60 80
                        ]
                        [ E.text "This branch of "
                        , E.el
                            [ EFont.medium ] <| E.text "AwesomeWM "
                        , E.text "is deprecated."
                        ]
                    , E.paragraph
                        [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0}
                        ]
                        [ E.text "The latest old stable version of "
                        , E.el
                            [ EFont.medium, EFont.color <| E.rgb255 0 0 0 ] <| E.text "AwesomeWM "
                        , E.text "is version 3.5.9 "
                        , E.el
                            [ EFont.color <| E.rgb255 0 0 0, EFont.italic ] <| E.text "\"Mighty Ravendark\""
                        , E.text ", released on 6 March 2016."
                        ]
                    ]

                , E.el -- download table
                    -- we have to do the padding here. if we do it in the table itself, it breaks
                    [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0 }
                    ]
                    <| E.column
                        [ EBackground.color <| E.rgb255 228 228 228
                        , EBorder.color <| E.rgb255 160 160 160
                        , EBorder.width 1
                        , EBorder.rounded 8
                        , E.width <| E.px 220
                        ]
                        [ E.row
                            [ E.height <| E.px 46
                            ]
                            [ githubNewTabLink "https://github.com/awesomeWM/awesome-releases/raw/master/awesome-3.5.9.tar.bz2" "awesome-3.5.9.tar.bz2"
                            ]
                        , separatorH
                        , E.row
                            [ E.height <| E.px 46
                            ]
                            [ githubNewTabLink "https://github.com/awesomeWM/awesome-releases/raw/master/awesome-3.5.9.tar.xz" "awesome-3.5.9.tar.xz"
                            ]
                        ]
                , E.el
                    -- we have to do the padding here. if we do it in the table itself, it breaks
                    [ E.paddingEach { top = 0, right = 0, bottom = unit2, left = 0 }
                    ]
                    <| E.row
                        [ EBackground.color <| E.rgb255 228 228 228
                        , EBorder.color <| E.rgb255 160 160 160
                        , EBorder.width 1
                        , EBorder.rounded 8
                        , E.height <| E.px 40
                        , E.width <| E.px 290
                        ]
                        [ bookNewTabLink "https://awesomewm.org/changelogs/v3.5.9.txt" "v3.5.9 changelog" 170
                        , separatorV
                        , bookNewTabLink "https://awesomewm.org/changelogs/short/v3.5.9.txt" "short log" 170
                        ]

                -- Development
                , E.column
                    []
                    [ E.el
                        [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0}
                        , EFont.medium
                        , EFont.family
                            -- [ EFont.typeface Palette.font2
                            [ EFont.typeface Palette.font1
                            , EFont.sansSerif
                            ]
                        , EFont.size 18
                        ]
                        <| E.text "Development:"
                    , E.paragraph
                        [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = 0}
                        ]
                        [ E.text "The git repository can be cloned from github:"
                        ]
                    , E.paragraph
                        [ E.paddingEach { top = 0, right = 0, bottom = unit0, left = unit1}
                        ]
                        [ E.html <| Html.code 
                            [ Html.Attributes.style "font-family" "RobotoMono Nerd Font" ] 
                            [ Html.text "git clone https://github.com/awesomeWM/awesome.git"
                            ]
                        ]
                    , E.paragraph
                        [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0}
                        ]
                        [ E.text "Alternatively, development versions can be downloaded as ZIP files through the "
                        , View.Desktop.Lib.myNewTabLink "https://github.com/awesomeWM/awesome" "Github web interface"
                        , E.text "."
                        ]
                    ]
                ]



            -- History
            , E.column
                [
                ]
                [ E.el
                    [ E.paddingEach { top = 0, right = 0, bottom = unit1, left = 0}
                    , EFont.medium
                    , EFont.family
                        -- [ EFont.typeface Palette.font2
                        [ EFont.typeface Palette.font1
                        , EFont.sansSerif
                        ]
                    , EFont.size 22
                    ]
                    <| E.text "History:" 
                , E.column
                    [
                    ]
                    [ E.paragraph
                        [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 0}
                        ]
                        [ E.text "A list of of old releases "
                        , View.Desktop.Lib.myNewTabLink "https://awesomewm.org/releases/" "is available here"
                        , E.text "."
                        ]
                    ]
                ]
            ]
        ]

-- helpers

bookNewTabLink url label width =
    E.row
        [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 8 }
        , E.spacing 6
        , E.width <| E.maximum width E.fill
        ]
        [ E.el 
            [ E.width <| E.px 20
            , E.height <| E.px 20
            ] <| E.html <| Icons.book "#505050"
        , tableNewTabLink url label
        ]

gpgNewTabLink url label = 
    E.row
        [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 8 }
        , E.spacing 6
        ]
        [ E.el 
            [ E.width <| E.px 20
            , E.height <| E.px 20
            ] <| E.html <| Icons.key "#505050"
        , tableNewTabLink url label
        ]

githubNewTabLink url label =
    E.row
        [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 10 }
        , E.spacing 10
        ]
        [ E.el 
            [ E.width <| E.px 20
            , E.height <| E.px 20
            ] <| E.html <| Icons.github "#505050"
        , tableNewTabLink url label
        ]

tableNewTabLink url label =
    E.newTabLink
        [ EFont.color <| E.rgb255 60 60 60
        , E.width <| E.px 160
        , EFont.medium
        , EFont.size 15
        , EFont.family
            [ EFont.typeface Palette.font1
            , EFont.sansSerif
            ]
        ]
        { url = url
        , label = E.text label
        }

separatorV =
    E.el
        [ E.width <| E.px 1
        , E.height E.fill
        , EBackground.color <| E.rgb255 160 160 160
        ]
        <| E.text ""

separatorH =
    E.el
        [ E.width E.fill
        , E.height <| E.px 1
        , EBackground.color <| E.rgb255 160 160 160
        ]
        <| E.text ""

