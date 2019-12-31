module Logo exposing (logo)

import Svg
import Svg.Attributes

logo scaling =
    Svg.node "svg"
        [ Svg.Attributes.width "200px" 
        , Svg.Attributes.height "100px" 
        , Svg.Attributes.version "1.1" 
        , Svg.Attributes.viewBox "0 0 200 100" 
        -- Svg.Attributes.xmlns "http://www.w3.org/2000/svg" 
        -- Svg.Attributes.xmlns:cc "http://creativecommons.org/ns#" 
        -- Svg.Attributes.xmlns:dc "http://purl.org/dc/elements/1.1/" 
        -- Svg.Attributes.xmlns:rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#">
        , Svg.Attributes.transform ("scale("++ scaling ++ ")")
        ]
        [ Svg.g 
            [ Svg.Attributes.transform "translate(0,-197)"
            ]
            [ Svg.path
                [ Svg.Attributes.transform "scale(-1)" 
                , Svg.Attributes.d "m-31.277-277.69h16.038v64.963h-16.038zm-32.425 0h16.038v64.963h-16.038zm-45.596 51.513h-16.038v-51.513h16.038zm-30.817 0h-16.038v-51.513h16.038zm-46.855 3e-5v-16.038h77.672v16.038zm16.038-3e-5h-16.038v-51.513h16.038zm45.596-51.513h16.038v51.513h-16.038zm30.817 0h16.038v51.513h-16.038zm46.855 0v16.038h-77.672v-16.038zm-16.038 32.141v-16.038h48.463v16.038zm0-32.141h16.038v64.963h-16.038zm0 64.963v-16.038h48.463v16.038z" 
                , Svg.Attributes.fill "#0d0d0d" 
                , Svg.Attributes.style "paint-order:normal"
                ]
                []
            ]
        ]
