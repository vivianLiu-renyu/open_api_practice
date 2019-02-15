import Foundation
import KKBOXOpenAPISwift

class DataAPI: NSObject {
    
    func getNewHitsPlaylist(territory: KKTerritory) -> [KKPlaylistInfo] {
        var datas: [KKPlaylistInfo] = []
        let group = DispatchGroup()
        
        group.enter()
        _ = try? API.fetchNewHitsPlaylists(territory: territory, offset: 0, limit: 10) { result in
            switch result {
            case .error(let error):
                print(error)
            // Handle error...
            case .success(let playlist):
                print(playlist)
                datas = playlist.playlists //[KKPlaylistInfo]
                group.leave()
                // Handle the song track.
            }
        }
        group.wait()
        
        return datas
    }
}
