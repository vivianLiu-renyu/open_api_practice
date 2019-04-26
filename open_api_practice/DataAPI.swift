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
    
    func getNewAlbums(territory: KKTerritory, offset: Int, limit: Int) -> [String : AnyObject] {
        var datas: [String : AnyObject]!
        let url = "https://api.kkbox.com/v1.1/new-release-categories/KrdH2LdyUKS8z2aoxX/albums?limit=\(limit)&offset=\(offset)&territory=TW"
        let group = DispatchGroup()
        let header = [
            "Authorization": "Bearer AGIIEYCJZtglEBoddgra0g==",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]

        group.enter()

        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: header) .responseJSON { response in
            switch response.result {
            case .success(_):
                if let responseData = response.result.value {
                    datas = responseData as? [String : AnyObject]
                }
                group.leave()
                
            case .failure(_):
                print(response.result.value)
            }
        }
        
        group.wait()
        
        return datas
    }
}
