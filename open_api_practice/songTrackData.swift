import Foundation
import KKBOXOpenAPISwift

class songTracksAPIData {
    var songTracksArray: [songTrackData]? = nil
}

class songTrackData {
    var songCoverURL = ""
    var songName = ""
    var artistName = ""
    
    init() {
        self.songCoverURL = ""
        self.songName = ""
        self.artistName = ""
    }
    
    init(songCoverURL:String, songName:String, artistName:String) {
        self.songCoverURL = songCoverURL
        self.songName = songName
        self.artistName = artistName
    }
}

func getSongTracks(by playlistID: String) -> [KKTrackInfo] {
    let songTracksInfo = DataAPI().getSongTrack(by: playlistID)
    
    return songTracksInfo
}

func setSongTrackInfo(as info: KKTrackInfo) -> songTrackData {
    let trackData = songTrackData()
    
    trackData.songCoverURL = (info.album?.images[2].url?.absoluteString)!
    trackData.songName = info.name
    trackData.artistName = (info.album?.artist?.name)!
    
    return trackData
}
