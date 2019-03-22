import Foundation
import KKBOXOpenAPISwift

class DataAPI: NSObject {
    
    func getNewHitsPlaylist(territory: KKTerritory) -> [KKPlaylistInfo] {
        var datas: [KKPlaylistInfo] = []
        let group = DispatchGroup()
        
        group.enter()
        _ = try? API.fetchNewHitsPlaylists(territory: territory, offset: 0, limit: 4) { result in
            switch result {
            case .error(let error):
                print(error)
            // Handle error...
            case .success(let playlist):
                datas = playlist.playlists //[KKPlaylistInfo]
                group.leave()
                // Handle the song track.
            }
        }
        group.wait()
        
        return datas
    }
    
    func getPlaylistMore(playlistID: String, territory: KKTerritory) -> KKTrackList {
        var datas: KKTrackList!
        let group = DispatchGroup()
        
        group.enter()
        _ = try? API.fetch(tracksInPlaylist: playlistID, territory: territory) { result in
            switch result {
            case .error(let error):
                print(error)
            // Handle error...
            case .success(let playlist):
                datas = playlist //KKTrackList
                group.leave()
                // Handle the song track.
            }
        }
        group.wait()
        
        return datas
    }
    
    func getNewAlbums(territory: KKTerritory, limit: Int) -> KKNewReleasedAlbumsCategory {
        var datas: KKNewReleasedAlbumsCategory!
        let group = DispatchGroup()
        
        group.enter()
        _ = try? API.fetch(newReleasedAlbumsUnderCategory: "KrdH2LdyUKS8z2aoxX", territory: territory, offset: 0, limit: limit) { result in
            switch result {
            case .error(let error):
                print(error)
            // Handle error...
            case .success(let albums):
                datas = albums //KKTrackList
                group.leave()
                // Handle the song track.
            }
        }
        group.wait()
        
        return datas
    }
}
