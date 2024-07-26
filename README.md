### musicapp.sh
`musicapp.sh` is the first full version of this program. It features the options to search for a song, provide a url or just a video ID to download from YT. 
```bash
Usage: ./musicapp.sh [options]

-m mode                           Directly choose a mode
-c                                Continue after first download and prompt again for input
-o output_directory               Set output directory, if none is set ./musicapp.sh will use current working Directory
-h                                Help Page
```

### dd.sh
dd stands for direct download and you can run `./dd.sh SONGNAME` to search for the song on YT and download the first result automaticly. The flags are preconfigured for audio in MP3
