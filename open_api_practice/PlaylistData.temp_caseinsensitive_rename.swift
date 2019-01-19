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

class GetPlaylistsData: NSObject {
    static func initPlaylistData(_ allPlaylists: PlaylistsAPIData) -> PlaylistsAPIData {
        allPlaylists.playlistArray = []
        
        _ = try? API.fetchAccessTokenByClientCredential { result in
            switch result {
            case .error(let error):
                print(error);
                API.logout()
            case .success(_):
                getPlaylists(territory: .taiwan, playlistList: (allPlaylists.playlistArray)!)
                // Successfully logged-in
            }
        }
        
//        for i in 1..<10 {
//            let shakingArea = ShakingArea()
//            shakingArea.areaName = "台北市\(i)"
//            shakingArea.areaIntensity = i
//            earthquake.intensityArray?.append(shakingArea)
//        }
        return allPlaylists
    }
}

func getPlaylists(territory: KKTerritory, playlistList: [PlaylistData]) {
    _ = try? API.fetchNewHitsPlaylists(territory: territory, offset: 0, limit: 10) { result in
        print("Hi in fetchNewHitsPlaylists")
        switch result {
        case .error(let error):
            print(error);
        case .success(let playlist):
            print("Hi")
            print(playlist.playlists.count)
            for i in 0..<playlist.playlists.count {
                setPlaylistsInfo(playlist: playlistList, info: playlist.playlists[i])
            }
            //print(playlist.playlists[0])
            // Successfully logged-in
        }
    }
}

private func setPlaylistsInfo(playlist: [PlaylistData], info: KKPlaylistInfo) {
    let playlistData = PlaylistData()
    playlistData.playlistName = info.title
    
    
}
