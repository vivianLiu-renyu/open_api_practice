//
//  playlistTableViewController.swift
//  open_api_practice
//
//  Created by YenChen Huang on 2019/1/11.
//  Copyright © 2019年 Search_Question_Avengers. All rights reserved.
//

import UIKit
import KKBOXOpenAPISwift
let API = KKBOXOpenAPI(clientID: "f83d449bf6233c25b73330413dcb313b", secret: "bbe1d1310eb22e2d6c4517c4a5907e09")

class playlistTableViewController: UITableViewController {
    //let API = KKBOXOpenAPI(clientID: "f83d449bf6233c25b73330413dcb313b", secret: "bbe1d1310eb22e2d6c4517c4a5907e09")
    var playlistsList: PlaylistsAPIData = PlaylistsAPIData()
    var playlistData: [PlaylistData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistsList = GetPlaylistsData.initPlaylistData(playlistsList)
        if let playlistData = playlistsList.playlistArray {
            self.playlistData = playlistData
        }
        
        print("Launch")
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlist", for: indexPath) as! playlistTableViewCell
        let playlistData = self.playlistData[indexPath.row]
        cell.displayContent(with: playlistData)

        return cell
    }
    
//    private func getPlaylists(territory: KKTerritory) -> Self {
//        _ = try? API.fetchNewHitsPlaylists(territory: territory, offset: 0, limit: 10) { result in
//            print("Hi in fetchNewHitsPlaylists")
//            switch result {
//            case .error(let error):
//                print(error);
//            case .success(let playlist):
//                print("Hi")
//                print(playlist.playlists.count)
//                for i in 0..<playlist.playlists.count {
//                    self.setPlaylistsInfo(playlist: playlist.playlists[i])
//                }
//                //print(playlist.playlists[0])
//                // Successfully logged-in
//            }
//        }
//
//        return self
//    }
    
//    private func setPlaylistsInfo(playlist: KKPlaylistInfo) -> Self {
//        let playlist = playlistData(playlistName: playlist.title, curatorName: playlist.owner.name)
//        playlistsList.append(playlist)
//        
//        print(playlistsList)
//        return self
//    }

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
