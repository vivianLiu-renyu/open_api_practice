import Foundation

class GetPlaylistsData: NSObject {
    
    static func initPlaylistData(_ allPlaylists: PlaylistsAPIData) -> PlaylistsAPIData {
        allPlaylists.playlistArray = []

        let playlistList = getPlaylists(territory: .taiwan)
        
//        for i in 0..<playlistList.count {
//            allPlaylists.playlistArray?.append(setPlaylistsInfo(as: playlistList[i]))
//        }
        
        print("print playlistList", playlistList)
        return allPlaylists
    }
}
