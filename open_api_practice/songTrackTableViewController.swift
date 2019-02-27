import UIKit

class songTrackTableViewController: UITableViewController {
    var playlistID: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
    }
    
    var songTrackList:[songTrackData] = [
    songTrackData(songCoverURL: "https://i.kfs.io/album/global/27683214,0v1/fit/160x160.jpg", songName: "明天的秘密 (Tomorrow Will Be A Secret)", artistName: "蕭亞軒 (Elva Hsiao)"),
    songTrackData(songCoverURL: "https://i.kfs.io/album/global/27561016,0v1/fit/160x160.jpg", songName: "心之焰", artistName: "G.E.M.鄧紫棋")
    ]

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songTrackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songTrack", for: indexPath) as! songTrackTableViewCell

        cell.songName.text = songTrackList[indexPath.row].songName
        cell.artistName.text = songTrackList[indexPath.row].artistName
        
        let songTrackImageAddress = songTrackList[indexPath.row].songCoverURL
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
}
