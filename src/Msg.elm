module Msg exposing 
    ( Msg(..)
    -- , SortType(..)
    )

import Browser
import Url

type UrlRequest
    = Internal Url.Url
    | External String

type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotWindowAndDocumentData String
    | InitialWindowAndDocumentData String

    -- expo page sort by topic drop down menu
    | SortByTop
    | SortByHot
    | SortByNew
    | RollDownSortByTopicDropDown
    | RollUpSortByTopicDropDown

    -- expo page sort by date drop down menu
    | SortFromToday
    | SortFromPastWeek
    | SortFromPastMonth
    | SortFromPastYear
    | SortFromAllTime
    | RollDownSortByDateDropDown
    | RollUpSortByDateDropDown

-- type alias WindowAndDocumentData =
--     { documentYOffset : Int
--     , documentHeight : Int
--     , viewportHeight : Int
--     }



-- type SortType 
--     = Top
--     | Hot
--     | Controversial
--     -- TODO: Add the rest here
    
    
