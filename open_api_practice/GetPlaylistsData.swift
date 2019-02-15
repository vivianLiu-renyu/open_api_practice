import Foundation
import KKBOXOpenAPISwift
class GetPlaylistsData: NSObject {
    static func initPlaylistData(_ allPlaylists: PlaylistsAPIData) -> PlaylistsAPIData {
        var playlistList: [KKTerritory:[KKPlaylistInfo]] = [:]
        
        allPlaylists.playlistArray = []

        playlistList[.taiwan] = getPlaylists(territory: .taiwan)
        playlistList[.hongkong] = getPlaylists(territory: .hongkong)
        playlistList[.japan] = getPlaylists(territory: .japan)
        playlistList[.singapore] = getPlaylists(territory: .singapore)
        playlistList[.malaysia] = getPlaylists(territory: .malaysia)
        
        for (territory, infos) in playlistList {
            for info in infos {
                allPlaylists.playlistArray?.append(setPlaylistsInfo(as: info))
            }
        }

        print("print playlistList", playlistList)
        return allPlaylists
    }
}
