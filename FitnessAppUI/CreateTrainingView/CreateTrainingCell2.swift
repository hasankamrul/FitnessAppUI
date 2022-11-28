
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class CreateTrainingCell2: UICollectionReusableView {
    static var identifier : String {
        return String(describing: self)
    }

	@IBOutlet var labelTitle: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(title: String) {

		labelTitle.text = title
	}
}
