var output = '';
function findTrack()
{
	musicApp = Application('Music');
	if (musicApp.running()) {
    	var temp = ''
		var track = musicApp.currentTrack;
    	var artist = track.artist();
    	var title = track.name();
		
		if (title.includes(artist)) {
			title = title.replace(artist, '');
		}
		
		if ((artist == 'Unknown artist') || (artist == 'Various Artists') || artist.includes('http')){
			temp = (`♫ ${title}`).substr(0, 30);
		}else{
			temp = (`♫ ${artist} - ${title}`).substr(0, 50);

		}
		
		if (temp.includes('_')) {
			temp = temp.replace(/_/g, ' ')
		}
		
		if (temp.includes('(mp3.pm)')) {
			temp = temp.replace(/\(mp3.pm\)/g, '')
		}
		
		output = temp;
		return output;
	} 
		
}

output = findTrack('Music');
output
