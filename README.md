<p align="center">
    <h1 align="center">Dawson</h1>
    <p align="center">
      Track your project's statistics on Hacker News and Github, and get notified on every new interaction
    </p>
    <p align="center">
      <a href="#introduction">Introduction</a> -
      <a href="#features">Features</a> -
      <a href="#install">Install</a>
    </p>
</p>

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Install](#install)
- [Examples](#examples)
- [Troubleshoot](#troubleshoot)
- [Credits](#credits)

## Introduction

Dawson is a tiny utility that enables you to track your project's submission on Hacker News, and your project's repository on Github.
On every new comment, upvote, fork, issue, or star, Dawson will send you a desktop notification so you can quickly react and anticipate.

I decided to create that tool after noticing that my latest project ([Isaiah](https://github.com/will-moss/isaiah)) had made it to the
front page of Hacker News, and brought hundreds of reactions and comments. I wanted to be able to track everything without having to refresh
my browser every other minute, and quickly reply to questions and suggestions. That's why I built Dawson

## Features

Dawson has these features implemented :
- Track any given Hacker News post or Github repository
- Send a desktop notification on every new comment, upvote, fork, issue, or star
- Open the monitored page when clicking on notifications
- Customize the monitoring (frequency, title, sound, number of notifications, etc.)

Everything fits into one small Python file, and you can either install Dawson, or copy the script and run it locally.

## Install

Before proceeding, please make sure that your system meets the following requirements:
- Python 3.x is installed, and available as the `python3` executable
- Pip 3.x is installed, and available as the `pip3` executable
- On Mac OS, read the troubleshooting section

Then, you may choose one of the options below.

#### Using the remote install script

A remote install script was created to help you install Dawson in one line, from your terminal:

> As always, check the content of every file you pipe in bash

```bash
# Run the install script
curl https://raw.githubusercontent.com/will-moss/dawson/master/scripts/remote-install.sh | bash

# Dawson should be available now
dawson -h
```

#### Using the local install script

A local install script was created to help you install Dawson in a few lines, from your terminal:

```bash
# Retrieve the code
git clone https://github.com/will-moss/dawson
cd dawson

# Run the local install script
./scripts/local-install.sh

# Dawson should be available now
dawson -h
```

#### Manual install

Dawson being nothing more than a Python script, you can install it manually with the following commands:

```bash
# Retrieve the code
git clone https://github.com/will-moss/dawson
cd dawson

# Install the two dependencies
pip3 install -r requirements.txt

# Option 1 : Run Dawson using the Python executable
python3 dawson.py -h

# Option 2 : Run Dawson using the executable (a Python script with a shebang)
./dawson -h
```

## Examples

Please find below a few examples to help you get started with Dawson.

#### Track your project's submission on Hacker News

```bash
# Monitor for changes every 10 seconds
dawson -u https://news.ycombinator.com/item?id=<YOUR-ID> -f 10

# Using Python
python3 dawson.py -u https://news.ycombinator.com/item?id=<YOUR-ID> -f 10
```

#### Track your project's repository on Github

```bash
# Monitor for changes every 30 seconds
dawson -u https://github.com/<AUTHOR>/<REPOSITORY> -f 30 -T <TOKEN>

# Using Python
python3 dawson -u https://github.com/<AUTHOR>/<REPOSITORY> -f 30 -T <TOKEN>
```

#### Track your project on both Hacker News and Github, with custom settings, and background jobs

```bash
# Every process runs in the background, emits no notification sound, and has its own notification title
dawson -u https://news.ycombinator.com/item?id=<YOUR-ID> -f 10 -s -t "Hacker News - Activity recorded" &
dawson -u https://github.com/<AUTHOR>/<REPOSITORY> -f 10 -T <TOKEN> -s -t "Github - Activity recorded" &
```

#### Run Dawson in the background using screen

```bash
# Create a screen dedicated to Dawson
screen -S dawson

# Run Dawson
dawson -u https://news.ycombinator.com/item?id=<YOUR-ID> -f 10

# Leave the screen instance in the background
<CTRL+A> <D>
```

## Troubleshoot

Should you encounter any issue running Dawson, please refer to the following common questions, and problems with their solutions.

#### Can I use Dawson to monitor multiple projects at the same time?

Dawson can monitor one project at a time, but you can run multiple instances of Dawson in parallel.

For example, you may want to track your project on both Hacker News and Github.
To do so, you should run Dawson two times : once for Hacker News, and once for Github.
And you can, definitely, run Dawson in parallel as many times as wanted to track multiple projects at the same time.

I would recommend using `screen` or native background jobs for that purpose, and make sure that you don't hit API rate limits.

#### Dawson fails at monitoring my project on Github

First, please ensure that your Github repository is publicly accessible. If it isn't,
you must supply the `-T <TOKEN>` command-line argument.

Second, you may have hit Github API rate limits. In this case, you should generate a Github API Token, and supply it to Dawson
using the `-T <TOKEN>` command-line argument. By default, the public unauthenticated Github API is restricted to 60 requests per hour, which is very low.

Ultimately, please make sure that :
- Your monitoring frequency (`-f <FREQUENCY>` argument) isn't too small.
- Your Github's repository URL looks like so : `https://github.com/<AUTHOR>/<REPOSITORY>`

#### Notifications don't work on Mac OS

Dawson uses the great `Desktop Notifier` library to manage notifications on every operating system.

Should you encounter an issue on Mac OS, I suggest reading : [https://desktop-notifier.readthedocs.io/en/latest/#notes-on-macos](https://desktop-notifier.readthedocs.io/en/latest/#notes-on-macos)

For a simple explanation :
- To display notifications in the Notification Center of Mac OS, an app needs to be signed and properly configured.
- If your version of Python comes from `brew` or another package manager, it certainly isn't signed, or not configured as Mac OS expects it to be.
- The solution is to download Python from the official [python.org](https://python.org) website, run their installer, and use that version of Python to run Dawson.

Also, because Dawson is not a packaged and signed app for Mac OS, it can't send notifications on its own. It requires Python (which is signed and packaged!).
Packaging and signing Dawson could be doable, but it would require jumping hoops and paying for an Apple Developer License.

#### Something else

Please feel free to open an issue, explaining what happens, and describing your environment.

## Contribute

If you can help in any way, please do. Here's a few ideas :
- Open an issue if you encounter a bug
- Suggest new features and improvements
- Anything else that comes to your mind!

## Credits

Hey hey ! It's always a good idea to say thank you and mention the people and projects that help us move forward.

Big thanks to the creator of [Desktop Notifier](https://github.com/samschott/desktop-notifier)
for the powerful and convenient cross-os notification library.

And don't forget to mention Dawson if it makes your life easier!
