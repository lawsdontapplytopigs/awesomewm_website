#!/usr/bin/env python

import credentials
import praw
from pprint import pprint

# creds = credentials.get_creds()

reddit = praw.Reddit(
    client_id="m3616RtVM_jMrw",
    client_secret="kHCBbWteCw3P5Xqq4Jn1fgmY8es",
    # username = creds["username"],
    # password = creds["password"],
    user_agent = "AwesomeWM-expo post fetcher"
    )

awesomewm_sub = reddit.subreddit("awesomewm")
posts = awesomewm_sub.top(limit=30)

def get_post(post_list):
    k = 0
    for post in post_list:
        if k == 7:
            return post
            k += 1
        else:
            k += 1

# post = get_post(posts)
for post in posts:
    if post.url.startswith("https://i.redd") and (post.url.endswith("png") or post.url.endswith("jpg")):
        pprint(post.url)


