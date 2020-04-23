
[x] Don't forget to add the default "EFont.sansSerif" on font families used on the site
[x] Fix the AWM logo and its placement
[x] Center the Home "Expo" posts (I thought they were centered but they're actually not...)
[x] Fix the button I made. I don't think it's working all too well
[x] Take out the profile pic and the bell from the navbar, since I won't be making the site work that way
[x] Take out the like, comment, and "other" buttons from the small posts on the home page
[x] change all hardcoded fonts in the code to "Palette.font1" or something of that sort
[ ] make the footer
        Additional things I could put in the footer:
            - Authors
            - commit graph
            - Donations link

[x] probably take out the weird left-side spacing happening in the `/download` page
[x] Take out the colons in the titles from the "Download" page
[ ] Make scrolling and making http requests automatically work on the `/expo` page.
        valuable info to keep in mind:
            - `window.scrollY` gets you the scroll y position
            - `document.body.scrollHeight` gets you the height of the document
            - `document.body.offsetHeight` gets you the height of the viewport
[x] Maybe make the little info card smaller on the `/expo` page
[ ] Make the date work properly
[ ] Make the titles of the posts link to the reddit post
[ ] Make the user tag link to the reddit user
[ ] Restrict the length of the title
[ ] Maybe change around the title a bit.
[ ] Show the top 3 expo posts on the main page
[ ] Only show the [Awesome] posts (redesign the post filter function). Also,
    for the time being, filter out imgur posts until I figure out how to use
    their api to register the app
    
[ ] Make the spacing between the info card and the posts section smaller (/expo)
[ ] Actually fetch the reddit user image, parse the link, and display
    it properly
[ ] Write out the json decoding error cases properly
[ ] Walk through all `TODO`s in the source files and maybe do some of them
[ ] Walk through all the `FIXME`s in the source files
[ ] Make the logo lead to the homepage
[ ] Set up something so that you can't scroll down, it makes a request, then you
    scroll up, down again, and it makes the same request again
[ ] Add some sort of "loading" animation at the bottom of the page
[ ] Make the space between the `/community` text and the footer larger
[ ] Make comments show properly

[ ] Write the backend properly

###Once I'm online
[x] REGISTER NEW APP WITH REDDIT AND GET NEW SECRETS. (i accidentally commited them to the repo... OOPSIE)
        ACTUALLY!!!!! I don't even think I need to use the reddit api in any
        way. I can just make the clients make all the requests necessary from
        reddit and that's a gg right there
        Yeah, it turns out I don't even need to use the reddit api. I don't 
        need access to any sort of account access

[x] Take a look at what the elm website has on their footer
    Looks like this:
        "Install - Compiler Source - Site Source - Copyright 2012 - 2020 Evan Czaplicki

[x] MAKE SURE to actually test out the website regarding fetching posts from
        reddit
[ ] Make the sorting buttons work - They're done, I just need to make sure
    They make the http requests when they're clicked


###Maybe I'll do these, but I'm not sure
[ ] maybe do something for posts like "showcase" vs "library" vs "plugin" etc...
[ ] Get some vector art of the cairo logo to maybe use in one of the blocks.
[ ] Don't forget the "fork me on github" link
[ ] Write a "beginner's guide" and make sure to link it in the main 
    page's `Thoroughly docummented API` section.
[ ] Make the "Likes" and "Comments" elements a bit more distinctive
[ ] Maybe redesign how the gpg signature is displayed on the "download" page
[ ] I think I can get to the point where I remove the ports used to make
        http requests at certain scrolling points in the page, and just use
        elm, but I'm not sure



##In production
[ ] The "Roboto Mono" font setting in the front end is "roboto mono nerd font" change it to the regular one in prod
