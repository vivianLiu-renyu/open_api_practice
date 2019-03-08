import UIKit
import KKBOXOpenAPISwift

let API = KKBOXOpenAPI(clientID: "f83d449bf6233c25b73330413dcb313b", secret: "bbe1d1310eb22e2d6c4517c4a5907e09")

class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var playlistsList: PlaylistsAPIData = PlaylistsAPIData()
    var playlistData: [PlaylistData] = []
    var passData: Bool = false
    var selectedRow = 0
    var doingSegue = false
        
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
                    self.loadView()
                }
            }
        }
        self.view.backgroundColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlist", for: indexPath) as! playlistTableViewCell
        let playlistDat = self.playlistData[indexPath.row]
        cell.displayContent(with: playlistDat)
        
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
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "熱門歌單"
//    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let sectionTitle = UILabel(frame: CGRect(x: 30, y: 10, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        sectionTitle.font = UIFont(name: "Test", size: 30)
        sectionTitle.text = "熱門歌單"
        sectionTitle.sizeToFit()
        sectionTitle.textColor = UIColor.white
        headerView.addSubview(sectionTitle)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedRow = indexPath.row
        print("indexPath.row:  ", indexPath.row)
        performSegue(withIdentifier: "playlistMore", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if (segue.identifier == "playlistMore") {
            let nextPage = segue.destination as! songTrackTableViewController
            let playlist = playlistData[selectedRow]
            let playlistID = playlist.playlistID
            let playlistName = playlist.playlistName
            
            nextPage.playlistName = playlistName
            nextPage.playlistID = playlistID
            nextPage.territory = .taiwan
            print("nextPage.playlistName: ", playlistName)
        }
     }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "playlistMore") {
            if doingSegue {
                return false
            }
            else {
                doingSegue = true
                return true
            }
        }
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        doingSegue = false
    }
}
