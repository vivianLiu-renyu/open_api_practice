import Foundation
import Alamofire
private let KKBOXAPIPath = "https://api.kkbox.com/v1.1/"
private let headers: HTTPHeaders = ["Authorization" : "Bearer QToFzyxn0IC1cPrZMjDPeg=="]
typealias DownloadComplete = () -> ()

enum Territory: String {
    case taiwan = "TW"
}

class DataAPI: NSObject {
    
    func getNewHitsPlaylist(territory: Territory) -> [String: Any] {
        var datas = [String: Any]()
        let url = "https://api.kkbox.com/v1.1/new-hits-playlists"
        
        Alamofire.request(url,
                          method: .get,
                          parameters: ["territory": "TW"],
                          headers: headers)
            .responseJSON { response in
                switch(response.result) {
                case .success(_):
                    print(response.result.value)
                    datas = response.result.value as! [String : Any]
                case .failure(_):
                    print("Error message:\(response.result.error)")
                    break
                }
        }
        
        
//        _ = try? API.fetchNewHitsPlaylists(territory: .taiwan) { result in
//            switch result {
//            case .error(let error): break
//            // Handle error...
//            case .success(let playlist):
//                print(playlist)
//                datas = playlist.playlists //[KKPlaylistInfo]
//                // Handle the song track.
//            }
//
//        }
        
        return datas
    }
}
