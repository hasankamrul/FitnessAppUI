
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class RunningCell: UITableViewCell {
    static var identifier : String {
        return String(describing: self)
    }


	@IBOutlet var viewBackground: UIView!
	@IBOutlet var labelActivity: UILabel!
	@IBOutlet var labelDistance: UILabel!
	@IBOutlet var labelActiveTime: UILabel!
	@IBOutlet var labelCalories: UILabel!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()

		viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = AppColor.Border?.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(data: [String: String]) {

		guard let activity = data["activity"] else { return }
		guard let distance = data["distance"] else { return }
		guard let activeTime = data["activeTime"] else { return }
		guard let calories = data["calories"] else { return }

		labelActivity.text = activity.uppercased()
		labelDistance.text = distance + " km"
		labelActiveTime.text = activeTime
		labelCalories.text = calories + " kcal"
	}
}
