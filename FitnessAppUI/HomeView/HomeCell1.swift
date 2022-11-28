
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class HomeCell1: UICollectionViewCell {
    static var identifier : String {
        return String(describing: self)
    }

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!
	@IBOutlet var buttonLearnMore: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		buttonLearnMore.layer.borderWidth = 1
        buttonLearnMore.layer.borderColor = AppColor.Border?.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let description = data["description"] else { return }

		imageView.sample("Fitness", "Yoga", index.row)
		labelTitle.text = title
		labelDescription.text = description
	}
}
