import Foundation
import KKBOXOpenAPISwift

class PlaylistsAPIData {
    var playlistArray: [PlaylistData]? = nil
}
class PlaylistData {
    var playlistName = ""
    var playlistImage = ""
    var playlistURL = ""
    var curatorName = ""
    var curatorImage = ""
    var curatorURL = ""
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
