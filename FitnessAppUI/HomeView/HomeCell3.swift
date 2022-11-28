
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class HomeCell3: UICollectionViewCell {
    static var identifier : String {
        return String(describing: self)
    }

	@IBOutlet var imageView: UIImageView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath) {
		imageView.sample("Fitness", "WomanPower", index.row+10)
	}
}
