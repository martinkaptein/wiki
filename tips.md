# Youtube-dl

Download numbered playlist to audio (mp3).

```
youtube-dl --extract-audio --audio-format mp3 -o "%(playlist_index)s-%(title)s.%(ext)s" "https://www.youtube.com/watch?v=3PZlve77LAI&list=PLJHAmFz9mLV-CCH7vsG-uOdDUY4Z7iSGW" --playlist-start 30
```
