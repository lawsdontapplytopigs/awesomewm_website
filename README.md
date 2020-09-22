
**Desktop**

![desktop preview](desktop_preview.png?raw=true "Desktop Preview)

# 1. Building

Now looking back, this project would be better off using some sort of build tool.
Maybe [create-elm-app](https://github.com/halfzebra/create-elm-app) or something of
the sort. But the way the development of this project continued was that I'd just
run `./make.sh` every time I made a change.
To deploy it I just made a "throwaway" branch where there's a "built" directory
with all the necessary files in it, and I'd just configure netlify to serve files
from there.
An ugly solution, but I just didn't know better at the time.

**Dependencies:**
- elm
- go *(although this is only used for a development server. you can change this to whatever you like)*

if you want to use some other server, just run it in `built/`. That's where all the relevant files are.

# 2. Motivation

The AwesomeWM project had been struggling with properly showcasing community works.
A real drawback of the official project's website was that it didn't adequately 
portray to visitors what the awesome window manager was really capable of achieving
visually.

It is one of the most flexible window managers out there, with an API that, if 
used properly could be leveraged to create very modern widgets on the desktop.

The way this problem was handled was by having people submit works on a [github
issue](https://www.reddit.com/r/awesomewm/comments/5nvw0x/wanted_awesome_screenshots/) 
of the project.

I thought there'd have to be a better way to address that issue, so I decided I 
would redesign the website, and have a special `expo` section on the website that
would automatically fetch posts from reddit, filter them, and display them.

This way, there wouldn't have to be any interaction from maintainers with the 
website to change pictures or anything of the sort. The images would
automatically get fetched and ordered by arbitrary factors like date posted,
number of votes, etc.

And this is exactly what this website does: It features a lot of basic information
about the website, and also has an `expo` that functions as a social media feed where, 
if the user scrolls down far enough, the website automatically fetches posts 
from the [r/unixporn](reddit.com/r/unixporn) subreddit, filters them for the 
ones that are tagged with `[awesomewm]` and then displays them below.

# 3. Issues

### Is this being used? 

Unfortunately, no.

There has been some discussion on this in [an issue](https://github.com/awesomeWM/awesome/issues/3078),
but ultimately one of the most important dealbreakers is the fact that people
who are likely to be interested in AwesomeWM would also be the people that would
be most likely to turn off javascript in their browsers.

So regardless of the proplem it would fix, if it doesn't render at all, people 
wouldn't even see it.

### Responsiveness & other bugs

There are still bugs which I have not addressed in this project. And on top of
that, there's no mobile or tablet version for the website.

The reason for this is because I first wanted to see if the maintainers were going
to be ok with replacing the current website with this one.

If yes, I would've fixed the bugs and made this responsive. But as it turned out,
I wasn't going to spend time fixing everything just for a pet project that wasn't 
going to see the light of ~p r o d u c t i o n~.

