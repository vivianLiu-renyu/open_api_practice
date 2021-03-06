import UIKit

class PlaylistTableViewCell: UITableViewCell {

    @IBOutlet weak var playlistName: UILabel!
    @IBOutlet weak var curatorName: UILabel!
    @IBOutlet weak var playlistImage: UIImageView!
    @IBOutlet weak var curatorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func displayContent(with playlistData: PlaylistData) {
        self.playlistName.text = playlistData.playlistName
        self.curatorName.text = playlistData.curatorName
    }
}
