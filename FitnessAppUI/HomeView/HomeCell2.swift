
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class HomeCell2: UICollectionViewCell {
    static var identifier : String {
        return String(describing: self)
    }

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelCategory: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let category = data["category"] else { return }

		imageView.sample("Fitness", "Classes", index.row)
		labelTitle.text = title
		labelCategory.text = category
	}
}
