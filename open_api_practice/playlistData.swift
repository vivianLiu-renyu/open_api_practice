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

func getPlaylists(territory: Territory) -> [String: Any] {
    let playlistInfo = DataAPI().getNewHitsPlaylist(territory: .taiwan)

    return playlistInfo
    //return ["a":"a"]
}

func setPlaylistsInfo(as info: NSDictionary) -> PlaylistData {
    let playlistData = PlaylistData()
    print(info)
    playlistData.playlistName = info["title"] as? String ?? ""
    let owner = info["owner"] as? NSDictionary ?? [:]
    playlistData.curatorName = owner["name"] as? String ?? ""
    
    return playlistData
}
