import UIKit

class playlistTableViewCell: UITableViewCell {

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

        // Configure the view for the selected state
    }

}
