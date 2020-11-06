# l1t-protips

Happy Devember 2020!

Everyone loves the L1T news! Those rascals have a running joke giving "protips" for people unfortunate enough to make the weekly news. It would be fun to see a supercut of *all* protips from the history of the show...but finding them all?

That's what these scripts do! They use the Youtube auto-generated subtitles to locate the timestamp(s) of the phrase "protip" inside every video and download the clip!

## Setup

Ok, to get this done you'll need a bash shell with the following tools.

* `youtube-dl`
* `ffmpeg`
* `jq`
* `python3.6+`

For `youtube-dl` and `ffmpeg` whatever version is in your package manager - it's out of date. Go directly to the project website to download the latest version!

## Usage

Cawling for "protips" is completed in three steps:

1. Start by cloning the repository, it looks like this:

    ```bash
    $ tree -L 1
    .
    ├── subs
    ├── clips
    ├── download-protips.py
    ├── download-subtitles.sh
    └── README.md
    ```

2. Download auto-translated subtitles for every episode of the L1T news into the `subs` folder. This script uses the [youtube playlists](https://www.youtube.com/c/Level1Techs/playlists?view=50&sort=dd&shelf_id=2) for every "season" of the news - for future seasons, add the playlist urls.

    ```bash
    $ bash download-subtitles.sh
    ```

3. Search the subtitles downloaded in the previous step for the phrase "protips" and download clips at that timestamp. The clips will be saved into the `clips` folder.

    ```bash
    $ python download-protips.py
    ```
    This process involves downloading *every* episode with a protip so it's going to take a while and use a ton of bandwidth. I've hardcoded the limit to download the videos at `<=1080p` resolution, which speeds things up but it still takes hours. If your internet is slow (like mine) consider renting a VPC with gigabit internet and running it there!

At the end, you're left with a `clips` folder full of short video clips of all found the protips!

## Results

The scripts certially work, but I can't be sure they find every last protip. I don't know if you can really be sure of the count without re-watching the entirity of the news. However, it does work well enough to make a fun [supercut like this]()!

If you think you can improve the match-rate, feel free to fork and make improvements. Happy Devember 2020!
