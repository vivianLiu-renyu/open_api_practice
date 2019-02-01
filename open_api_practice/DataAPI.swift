import Foundation
//import Alamofire
import KKBOXOpenAPISwift
//private let KKBOXAPIPath = "https://api.kkbox.com/v1.1/"
//private let headers: HTTPHeaders = ["Authorization" : "Bearer QToFzyxn0IC1cPrZMjDPeg=="]
//typealias DownloadComplete = () -> ()

enum Territory: String {
    case taiwan = "TW"
}

class DataAPI: NSObject {
    
    func getNewHitsPlaylist(territory: Territory) -> [KKPlaylistInfo] {
        var datas: [KKPlaylistInfo] = []
//        let url = "https://api.kkbox.com/v1.1/new-hits-playlists"
        
//        Alamofire.request(url,
//                          method: .get,
//                          parameters: ["territory": "TW"],
//                          headers: headers)
//            .responseJSON { response in
//                switch(response.result) {
//                case .success(_):
//                    print(response.result.value)
//                    datas = response.result.value as! [String : Any]
//                case .failure(_):
//                    print("Error message:\(response.result.error)")
//                    break
//                }
//        }
        let group = DispatchGroup()
        group.enter()
        _ = try? API.fetchNewHitsPlaylists(territory: .taiwan, offset: 0, limit: 10) { result in
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


//DispatchQueue.global().async {
//                do{
//                    let imageData = try Data(contentsOf: imageUrl)
//                    let downloadedImage = UIImage(data: imageData)
//                    DispatchQueue.main.async {
//                        cell.playlistImage.image = downloadedImage
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
