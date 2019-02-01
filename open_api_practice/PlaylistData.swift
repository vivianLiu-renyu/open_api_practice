import Foundation
import KKBOXOpenAPISwift

class PlaylistsAPIData {
    var playlistArray: [PlaylistData]? = nil
}
class PlaylistData {
    var playlistName = ""
    var playlistImageUrl = ""
    var playlistURL = ""
    var curatorName = ""
    var curatorImageUrl = ""
    var curatorURL = ""
    
    init() {
        playlistName = ""
        playlistImageUrl = ""
        playlistURL = ""
        curatorName = ""
        curatorImageUrl = ""
        curatorURL = ""
    }
    
    init(playlistName: String, curatorName: String, playlistImageUrl: String, curatorImageUrl: String ) {
        self.playlistName = playlistName
        self.playlistImageUrl = playlistImageUrl
        self.curatorName = curatorName
        self.curatorImageUrl = curatorImageUrl
    }
}

func getPlaylists(territory: Territory) -> [KKPlaylistInfo] {
    let playlistInfo = DataAPI().getNewHitsPlaylist(territory: .taiwan)

    return playlistInfo
    //return ["a":"a"]
}

func setPlaylistsInfo(as info: KKPlaylistInfo) -> PlaylistData {
    let playlistData = PlaylistData()
    print("Info:", info)
    playlistData.playlistName = info.title
    let owner = info.owner
    playlistData.curatorName = owner.name
    
    return playlistData
}
