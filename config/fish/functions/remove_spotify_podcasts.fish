function remove_spotify_podcasts
  cd /Applications/Spotify.app/Contents/Resources/Apps
  unzip -p xpui.spa xpui.js | sed 's/,show,/,/' | sed 's/,episode"/"/' > xpui.js
  cp xpui.spa xpui.spa.bak
  zip xpui.spa xpui.js
  cd -
end
