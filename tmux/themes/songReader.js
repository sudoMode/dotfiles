function findTrack() {
  musicApp = Application("Music");
  if (musicApp.running()) {
    var temp = "";
    var track = musicApp.currentTrack;
    var artist = track.artist();
    var title = track.name();

    if (title.includes(artist)) {
      title = title.replace(artist, "");
    }

    if (
      artist == "Unknown artist" ||
      artist == "Various Artists" ||
      artist.includes("http")
    ) {
      temp = `♫ ${title}`;
    } else {
      temp = `♫ ${artist} - ${title}`;
    }

    temp = temp.replace(/_/g, " ");
    temp = temp.replace(/\(mp3.pm\)/g, "");

    output = temp;
    return output;
  }
}

findTrack("Music");
