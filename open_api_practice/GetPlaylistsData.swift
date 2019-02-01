import Foundation

class GetPlaylistsData: NSObject {
    
    static func initPlaylistData(_ allPlaylists: PlaylistsAPIData) -> PlaylistsAPIData {
        allPlaylists.playlistArray = []

        
        let playlistList = getPlaylists(territory: .taiwan)
        
        for i in 0..<playlistList.count {
            allPlaylists.playlistArray?.append(setPlaylistsInfo(as: playlistList[i]))
        }

        print("print playlistList", playlistList)
        return allPlaylists
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
