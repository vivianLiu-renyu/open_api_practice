import Foundation
import KKBOXOpenAPISwift
import Alamofire

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
    
    func getNewAlbums(territory: KKTerritory, offset: Int) -> KKNewReleasedAlbumsCategory {
        var datas: KKNewReleasedAlbumsCategory!
        let group = DispatchGroup()

        group.enter()
        
//        let url = "https://api.kkbox.com/v1.1/new-release-categories/KrdH2LdyUKS8z2aoxX?territory=TW&offset=\(offset)&limit=50"
//        let
//        Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default, headers: "AppConstant.Authorization : Bearer QToFzyxn0IC1cPrZMjDPeg==").responseJSON {
//
//        }
        
        _ = try? API.fetch(newReleasedAlbumsUnderCategory: "KrdH2LdyUKS8z2aoxX", territory: territory, offset: offset, limit: 50) { result in
            switch result {
            case .error(let error):
                print(error)
            // Handle error...
            case .success(let albums):
                datas = albums 
                group.leave()
                // Handle the song track.
            }
        }
        group.wait()
        
        return datas
    }
}
