import Foundation

class SongTrackData {
    var songName = ""
    var artistName = ""
    var songCoverURL = ""
    
    init() {
        songName = ""
        artistName = ""
        songCoverURL = ""
    }
    
    init(songCoverURL: String, songName: String, artistName: String) {
        self.songName = songName
        self.artistName = artistName
        self.songCoverURL = songCoverURL
    }
}
