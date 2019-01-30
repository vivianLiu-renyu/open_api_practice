import Foundation

class songTrackData {
    var songCoverURL = ""
    var songName = ""
    var artistName = ""
    
    init(songCoverURL:String, songName:String, artistName:String) {
        self.songCoverURL = songCoverURL
        self.songName = songName
        self.artistName = artistName
    }
}
