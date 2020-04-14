module SampleData exposing 
    ( data1
    , data2
    , data3
    )

-- TODO: get this sample data from decoded json in the "/data" directory

data1 =
    { author = "elenapan" 
    , title = "Mechanical Love"
    , likes = 231
    , postPic = "../data/0/0.png"
    -- , profilePic = "../../../resources/default_profile_pic.jpg"
    , profilePic = "../data/0/elenapan_profile.png"
    , datePosted = "06.01.2020"
    }

data2 =
    { author = "Elv13" 
    , title = "Matrix Multiplication"
    , likes = 113
    , postPic = "../data/1/1.png"
    , profilePic = "../data/default/default_profile_pic.jpg"
    , datePosted = "06.01.2020"
    }

data3 =
    { author = "szorfein" 
    , title = "Anonymous"
    , likes = 207
    , postPic = "../data/2/2.jpg"
    , profilePic = "../data/default/default_profile_pic.jpg"
    , datePosted = "06.01.2020"
    }
