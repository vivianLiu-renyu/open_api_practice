import UIKit
import KKBOXOpenAPISwift

class SongTrackTableViewController: UITableViewController {
    var playlistID: String!
    var playlistName: String = ""
    var territory: KKTerritory!
    var songTracksList: SongTracksAPIData = SongTracksAPIData()
    var songTracksData: [SongTrackData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            self.songTracksList = GetSongTracksData.initSongTracksData(self.songTracksList, playlistID: self.playlistID, territory: self.territory)
            DispatchQueue.main.async {
                if let songTrackDat = self.songTracksList.songTracksArray {
                    self.songTracksData = songTrackDat
                    self.tableView.reloadData()
                }
            }
        }
        self.navigationItem.title = playlistName
        self.view.backgroundColor = UIColor.black
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songTracksData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songTrack", for: indexPath) as! SongTrackTableViewCell

        cell.songName.text = songTracksData[indexPath.row].songName
        cell.artistName.text = songTracksData[indexPath.row].artistName
        cell.releaseDate.text = songTracksData[indexPath.row].releaseDate
        
        let songTrackImageAddress = songTracksData[indexPath.row].songCoverURL
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
            songTracksData.sort{
                ($0.releaseDate) > ($1.releaseDate)
            }
            self.tableView.reloadData()
        case "Sort By Artist Name":
            songTracksData.sort{
                ($0.artistName) < ($1.artistName)
            }
            self.tableView.reloadData()
        case "Sort By Song Name":
            songTracksData.sort{
                ($0.songName) < ($1.songName)
            }
            self.tableView.reloadData()
        default:
            print("Nothing")
        }
    }
}
