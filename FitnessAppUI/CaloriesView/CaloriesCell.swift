
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class CaloriesCell: UITableViewCell {
    static var identifier : String {
        return String(describing: self)
    }

	@IBOutlet var viewBackground: UIView!
	@IBOutlet var labelTime: UILabel!
	@IBOutlet var buttonTime: UIButton!
	@IBOutlet var labelKCal: UILabel!
	@IBOutlet var labelGCarb: UILabel!
	@IBOutlet var labelGProtein: UILabel!
	@IBOutlet var labelGFat: UILabel!
	@IBOutlet var buttonAdd: UIButton!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = AppColor.Border?.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let time = data["time"] else { return }
		guard let cal = data["cal"] else { return }
		guard let carb = data["carb"] else { return }
		guard let protein = data["protein"] else { return }
		guard let fat = data["fat"] else { return }

		labelTime.text = time
		labelKCal.text = cal + " kcal"
		labelGCarb.text = carb + " g"
		labelGProtein.text = protein + " g"
		labelGFat.text = fat + " g"
	}
}
