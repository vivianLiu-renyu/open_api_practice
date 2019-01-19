//
//  playlistTableViewCell.swift
//  open_api_practice
//
//  Created by YenChen Huang on 2019/1/11.
//  Copyright © 2019年 Search_Question_Avengers. All rights reserved.
//

import UIKit

class playlistTableViewCell: UITableViewCell {

    @IBOutlet weak var playlistName: UILabel!
    @IBOutlet weak var curatorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayContent(with playlistData: PlaylistData) {
        self.playlistName.text = playlistData.playlistName
        self.curatorName.text = playlistData.curatorName
    }

}
