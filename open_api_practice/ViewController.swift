//
//  ViewController.swift
//  open_api_practice
//
//  Created by Vivian Liu on 2019/1/4.
//  Copyright © 2019 Search_Question_Avengers. All rights reserved.
//

import UIKit
import KKBOXOpenAPISwift

class ViewController: UIViewController {
    let API = KKBOXOpenAPI(clientID: "f83d449bf6233c25b73330413dcb313b", secret: "bbe1d1310eb22e2d6c4517c4a5907e09")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = try? self.API.fetchAccessTokenByClientCredential { result in
            switch result {
            case .error(let error):
                print("Error")
                print(error);
                self.API.logout()
            case .success(_): break
                // Successfully logged-in
            }
        }
        
        _ = try? self.API.fetchNewHitsPlaylists(territory: .taiwan, offset: 0, limit: 10) { result in
            print("Hi in fetchNewHitsPlaylists")
            switch result {
            case .error(let error):
                print(error);
            case .success(let playlist):
                print("Hi")
                print(playlist.playlists.count)
                print(playlist.playlists[0])
                
                // Successfully logged-in
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
}

