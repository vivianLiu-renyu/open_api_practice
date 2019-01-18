import Foundation

class playlistData {
    var playlistName = ""
    var curatorName = ""
    var playlistImageUrl = ""
    var curatorImageUrl = ""
    
    
    
    init(playlistName: String, curatorName: String, playlistImageUrl: String, curatorImageUrl: String) {
        self.playlistName = playlistName
        self.curatorName = curatorName
        self.playlistImageUrl = playlistImageUrl
        self.curatorImageUrl = curatorImageUrl
    }
}
