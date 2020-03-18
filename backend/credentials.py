#!/usr/bin/env python

import getpass

def get_creds():
    username = input("Username: ")
    pw = getpass.getpass()
    creds = {
        "username" : username,
        "password" : pw
    }
    return creds

