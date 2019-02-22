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

class GetSongTrackData: NSObject {
    static func initSongTrackData(_ allSongTracks: songTracksAPIData, playlistID: String) -> songTracksAPIData {
        var songTracksList: [KKTrackInfo] = []
        
        allSongTracks.songTracksArray = []
        
        songTracksList = getSongTracks(by: playlistID)
        
        print("Song Track: ", songTracksList)
        
        for (info) in songTracksList {
            allSongTracks.songTracksArray?.append(setSongTrackInfo(as: info))
        }
        
        return allSongTracks
    }
}
