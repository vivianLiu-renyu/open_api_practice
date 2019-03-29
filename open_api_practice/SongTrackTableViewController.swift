import UIKit
import KKBOXOpenAPISwift

class SongTrackTableViewController: UITableViewController {
    var playlistID: String!
    var playlistName: String = ""
    var territory: KKTerritory!
    var songTracksList: SongTracksAPIData = SongTracksAPIData()
    var songTrackData: [SongTrackData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            self.songTracksList = GetSongTracksData.initSongTracksData(self.songTracksList, playlistID: self.playlistID, territory: self.territory)
            DispatchQueue.main.async {
                if let songTrackDat = self.songTracksList.songTracksArray {
                    self.songTrackData = songTrackDat
                    self.tableView.reloadData()
                }
            }
        }
        self.navigationItem.title = playlistName
        self.view.backgroundColor = UIColor.black
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songTrackData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songTrack", for: indexPath) as! SongTrackTableViewCell

        cell.songName.text = songTrackData[indexPath.row].songName
        cell.artistName.text = songTrackData[indexPath.row].artistName
        
        let songTrackImageAddress = songTrackData[indexPath.row].songCoverURL
        if let imageUrl = URL(string: songTrackImageAddress) {
            DispatchQueue.global().async {
                do{
                    let imageData = try Data(contentsOf: imageUrl)
                    let downloadedImage = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        cell.songImage.image = downloadedImage
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }

        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func openSortMenu(_ sender: Any) {
        handleMore()
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.songTrackController = self
        return launcher
    }()
    
    func handleMore() {
        settingsLauncher.showSettings()
    }
    
    func sort(by method: Setting) {
        switch method.name {
        case "Sort By Release Date":
            print("Sort By Release Date")
        case "Sort By Artist Name":
            print("Sort By Artist Name")
        case "Sort By Song Name":
            print("Sort By Song Name")
        default:
            print("Nothing")
        }
    }
}
