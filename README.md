# retroPieBackgroundMusic
Play music when you fire up RetroPie!

Why not make your countercade double as a jukebox that plays awesome 80's new wave songs, completing the arcade experience? It's (relatively) easy.

```
Play Music
sudo apt-get install mpg123
sudo mkdir scripts
cd scripts
sudo nano play_music.sh
```
Copy and paste the contents of play_music.sh

`sudo chmod +x play_music.sh`

Now we have to create a music folder.

`mkdir ~/RetroPie/roms/music`

Putting it in the roms folder should take care of permission issues.
Now in Windows explorer, type in \\retropie and navigate to roms/music and copy your music into the folder.

Set Volume System Wide
That's great for the music, but what about the games? We want to set game sounds volume to 67% too. Here's how:

`sudo nano /etc/rc.local`

Copy and paste the contents of rc.local. Save and exit.

`sudo nano /etc/asound.conf`

Copy and paste the contents of the associated file. Save and exit.

`sudo nano /etc/systemd/system/play_music.service`

Copy and paste the contents of the associated file. Save and exit.

```
sudo systemctl enable play_music.service
sudo systemctl start play_music.service
```

That's good but now we have to create runcommand-onstart and runcommand-onend hooks. When you fire up a game, emustation stops and runcommand takes over. When runcommand starts, we want the music to stop.

`sudo nano /opt/retropie/configs/all/runcommand-onstart.sh`

You know what to do!

`sudo chmod +x /opt/retropie/configs/all/runcommand-onstart.sh`

When runcommand ends, we want the music to begin.

`sudo nano /opt/retropie/configs/all/runcommand-onend.sh`

You know what to do!

```
sudo chmod +x /opt/retropie/configs/all/runcommand-onend.sh
sudo reboot
```

Whew, that was a lot of work for something that's available by default in Recalbox. But in the end it's probably worth it.

