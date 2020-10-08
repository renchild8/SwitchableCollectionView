
import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    static var identifier: String {
        get {
            return String(describing: type(of: self)).components(separatedBy: ".")[0]
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }

}



