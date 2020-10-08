
import UIKit

class ViewController: UIViewController {

    // @IBOutlet weak var typeSegmentControl: UISegmentedControl!
    @IBOutlet weak var switchableCollectionView: SwitchableCollectionView!
    @IBOutlet weak var changeTypeButton: UIButton!
    
    var imageNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        for i in 1...6 {
            imageNames.append("flag\(i)")
        }
        switchableCollectionView.setImageNames(imageNames: imageNames)
    }
    
    @IBAction func tappedChangeTypeButton(_ sender: Any) {
        switchableCollectionView.switchLayout(isList: changeTypeButton.isSelected)
        changeTypeButton.isSelected = !changeTypeButton.isSelected
    }
}

