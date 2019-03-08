import UIKit
import KKBOXOpenAPISwift

class playlistTableViewController: UITableViewController {
    var playlistsList: PlaylistsAPIData = PlaylistsAPIData()
    var playlistData: [PlaylistData] = []
    let API = KKBOXOpenAPI(clientID: "f83d449bf6233c25b73330413dcb313b", secret: "bbe1d1310eb22e2d6c4517c4a5907e09")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = try? API.fetchAccessTokenByClientCredential { result in
            switch result {
            case .error(let error): break
            case .success(_):
                print("AccessToken ")
            }
        }
        
        DispatchQueue.global().async {
            self.playlistsList = GetPlaylistsData.initPlaylistData(self.playlistsList)
            DispatchQueue.main.async {
                if let playlistDat = self.playlistsList.playlistArray {
                    self.playlistData = playlistDat
                    self.tableView.reloadData()
                }
            }
        }
        
        self.view.backgroundColor = UIColor.black
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlist", for: indexPath) as! playlistTableViewCell
        let playlistDat = self.playlistData[indexPath.row]
        cell.displayContent(with: playlistDat)

        //cell.playlistName.text = playlistData[indexPath.row].playlistName
        //cell.curatorName.text = playlistData[indexPath.row].curatorName
        
        let playlistImageAddress = playlistData[indexPath.row].playlistImageUrl
        if let imageUrl = URL(string: playlistImageAddress) {
            DispatchQueue.global().async {
                do{
                    let imageData = try Data(contentsOf: imageUrl)
                    let downloadedImage = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell.playlistImage.image = downloadedImage
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

        cell.playlistImage.layer.cornerRadius = 5
        cell.playlistImage.clipsToBounds = true

        let curatorImageAddress = playlistData[indexPath.row].curatorImageUrl
        if let imageUrl = URL(string: curatorImageAddress) {
            DispatchQueue.global().async {
                do{
                    let imageData = try Data(contentsOf: imageUrl)
                    let downloadedImage = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell.curatorImage.image = downloadedImage
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        cell.curatorImage.layer.cornerRadius = cell.curatorImage.frame.height/2
        cell.curatorImage.clipsToBounds = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "熱門歌單"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let sectionTitle = UILabel()
        sectionTitle.text = "熱門歌單"
        headerView.addSubview(sectionTitle)
        
        return headerView
    }
}
