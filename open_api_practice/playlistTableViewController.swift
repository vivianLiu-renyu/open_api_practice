import UIKit

class playlistTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
    }
    
    var playlistsList: [playlistData] = [
        playlistData(playlistName: "Yayaya", curatorName: "Stooooopid", playlistImageUrl: "https://i.kfs.io/playlist/global/26541395v33/cropresize/300x300.jpg", curatorImageUrl: "https://i.kfs.io/muser/global/94562966v27/cropresize/300x300.jpg"),
        playlistData(playlistName: "Yolo", curatorName: "Lol", playlistImageUrl: "https://i.kfs.io/playlist/global/26541409v110/cropresize/300x300.jpg", curatorImageUrl: "https://i.kfs.io/muser/global/94563062v1/cropresize/300x300.jpg"),
        playlistData(playlistName: "Just A Deam", curatorName: "Neyo", playlistImageUrl: "https://i.kfs.io/playlist/global/26541410v96/cropresize/1000x1000.jpg", curatorImageUrl: "https://i.kfs.io/muser/global/94563302v1/cropresize/300x300.jpg"),
        playlistData(playlistName: "BATS", curatorName: "Jikook", playlistImageUrl: "https://i.kfs.io/playlist/global/26541412v100/cropresize/300x300.jpg", curatorImageUrl: "https://i.kfs.io/muser/global/94563350v1/cropresize/300x300.jpg"),
        playlistData(playlistName: "Whatsoever I don't actually care, yeahhhhhhhhhh", curatorName: "I don't care anymore!!!", playlistImageUrl: "https://imgs.niusnews.com/upload/posts/po5_34182_1431502613.jpg", curatorImageUrl: "https://pbs.twimg.com/profile_images/949643576895557632/aLnmtkBC_400x400.jpg"),
        playlistData(playlistName: "Everything Is Awesome", curatorName: "Lego", playlistImageUrl: "https://imgs.niusnews.com/upload/posts/po5_34182_1431502613.jpg", curatorImageUrl: "https://pbs.twimg.com/profile_images/949643576895557632/aLnmtkBC_400x400.jpg"),
        playlistData(playlistName: "Age Of Empire", curatorName: "Nanohard", playlistImageUrl: "https://imgs.niusnews.com/upload/posts/po5_34182_1431502613.jpg", curatorImageUrl: "https://pbs.twimg.com/profile_images/949643576895557632/aLnmtkBC_400x400.jpg")
    ]
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlist", for: indexPath) as! playlistTableViewCell
        
        print(cell)

        cell.playlistName.text = playlistsList[indexPath.row].playlistName
        cell.curatorName.text = playlistsList[indexPath.row].curatorName
        let playlistImageAddress = playlistsList[indexPath.row].playlistImageUrl
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
        
        let curatorImageAddress = playlistsList[indexPath.row].curatorImageUrl
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
