import Foundation
import KKBOXOpenAPISwift

class PlaylistsAPIData {
    var playlistArray: [PlaylistData]? = nil
}
class PlaylistData {
    var playlistName = ""
    var playlistImageUrl = ""
    var playlistURL = ""
    var playlistID = ""
    var curatorName = ""
    var curatorImageUrl = ""
    
    init() {
        playlistName = ""
        playlistImageUrl = ""
        playlistURL = ""
        playlistID = ""
        curatorName = ""
        curatorImageUrl = ""
    }
    
    init(playlistName: String, curatorName: String, playlistImageUrl: String, curatorImageUrl: String) {
        self.playlistName = playlistName
        self.playlistImageUrl = playlistImageUrl
        self.curatorName = curatorName
        self.curatorImageUrl = curatorImageUrl
    }
}

func getPlaylists(territory: KKTerritory) -> [KKPlaylistInfo] {
    let playlistInfo = DataAPI().getNewHitsPlaylist(territory: territory)

    return playlistInfo
    //return ["a":"a"]
}

func setPlaylistsInfo(as info: KKPlaylistInfo) -> PlaylistData {
    let playlistData = PlaylistData()

    playlistData.playlistName = info.title
    playlistData.playlistImageUrl = ((info.images[2].url)?.absoluteString)!
    playlistData.playlistID = info.ID
    
    let owner = info.owner
    playlistData.curatorName = owner.name
    playlistData.curatorImageUrl = ((owner.images[2].url)?.absoluteString)!
    
    return playlistData
}
