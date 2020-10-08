
import UIKit

class SwitchableCollectionView: UICollectionView {
    
    let list = ListFlowLayout()
    let grid = GridFlowLayout()
    
    var imageNames = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    func setImageNames(imageNames: [String]){
        self.imageNames = imageNames
    }

    func switchLayout(isList: Bool) {
        if isList {
            changeLayout(list)
        } else {
            changeLayout(grid)
        }
    }

    private func setup() {
        collectionViewLayout = list
        dataSource = self
        register(UINib(nibName: ImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    }

    private func changeLayout(_ flowLayout: UICollectionViewFlowLayout) {
        UIView.animate(withDuration: 0.2) { [weak self] () -> Void in
            self?.collectionViewLayout.invalidateLayout()
            self?.setCollectionViewLayout(flowLayout, animated: true)
        }
    }
}


extension SwitchableCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                            for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        let image = UIImage(named: "\(imageNames[indexPath.row])")!
        cell.setImage(image)
        
        return cell
    }
}
