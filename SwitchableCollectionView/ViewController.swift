
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var typeSegmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!

    let gridFlowLayout = GridFlowLayout()
    let listFlowLayout = ListFlowLayout()

    var fileNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

        for i in 1...6 {
            fileNames.append("flag\(i)")
        }

        collectionView.collectionViewLayout = gridFlowLayout
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)

    }

    @IBAction func onDidTappedType(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case ViewType.grid.rawValue:
            changeView(gridFlowLayout)
        case ViewType.list.rawValue:
            changeView(listFlowLayout)
        default:
            break
        }
    }

    private func changeView(_ flowLayout: UICollectionViewFlowLayout) {
        UIView.animate(withDuration: 0.2) { [weak self] () -> Void in
            self?.collectionView.collectionViewLayout.invalidateLayout()
            self?.collectionView.setCollectionViewLayout(flowLayout, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fileNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                            for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageView.image = UIImage(named: "\(fileNames[indexPath.row])")!
        
        return cell
    }
}
