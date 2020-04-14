
[x] Don't forget to add the default "EFont.sansSerif" on font families used on the site
[x] Fix the AWM logo and its placement
[x] Center the Home "Expo" posts (I thought they were centered but they're actually not...)
[x] Fix the button I made. I don't think it's working all too well
[x] Take out the profile pic and the bell from the navbar, since I won't be making the site work that way
[x] Take out the like, comment, and "other" buttons from the small posts on the home page
[ ] change all hardcoded fonts in the code to "Palette.font1" or something of that sort
[ ] The "Roboto Mono" font setting in the front end is "roboto mono nerd font" change it to the regular one in prod
[ ] Maybe redesign how the gpg signature is displayed on the "download" page
[ ] make the footer
[x] probably take out the weird left-side spacing happening in the `/download` page
[ ] Take out the colons in the titles from the "Download" page
[ ] Make scrolling and making http requests automatically work on the `/expo` page.
        valuable info to keep in mind:
            - `window.scrollY` gets you the scroll y position
            - `document.body.scrollHeight` gets you the height of the document
            - `document.body.offsetHeight` gets you the height of the viewport
[ ] Maybe make the little info card smaller on the `/expo` page
[ ] I think I can get to the point where I remove the ports used to make
        http requests at certain scrolling points in the page, and just use
        elm, but I'm not sure


[ ] Write the backend...

###Once I'm online
[ ] REGISTER NEW APP WITH REDDIT AND GET NEW SECRETS. (i accidentally commited them to the repo... OOPSIE)
        // ACTUALLY!!!!! I don't even think I need to use the reddit api in any
        // way. I can just make the clients make all the requests necessary from
        // reddit and that's a gg right there


###Maybe I'll do these, but I'm not sure
[ ] Figure out what to do about posts like "showcase" vs "library" vs "plugin" etc...
[ ] Get some vector art of the cairo logo to maybe use in one of the blocks.
[ ] Don't forget the "fork me on github" link
[ ] Write a "beginner's guide" and make sure to link it in the main 
    page's `Thoroughly docummented API` section.
[ ] Make the "Likes" and "Comments" elements a bit more distinctive
