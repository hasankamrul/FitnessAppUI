
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class CreateTrainingCell1: UICollectionViewCell {
    static var identifier : String {
        return String(describing: self)
    }

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var viewSelectedStart: UIView!
	@IBOutlet var viewSelectedEnd: UIView!
	@IBOutlet var viewInRange: UIView!

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(date: Date, firstDate: Date, startDate: Date?, endDate: Date?) {

		viewSelectedStart.isHidden = true
		viewSelectedEnd.isHidden = true
		viewInRange.isHidden = true
		labelTitle.text = ""

		guard date.isMonth(in: firstDate) else { return }

		labelTitle.text = date.toString(withFormate: "d")
		let dayOfWeek = date.getDayOfWeek()
		labelTitle.textColor = ((dayOfWeek == 1) || (dayOfWeek == 7)) ? UIColor.systemGray : UIColor.label

		setSelected((date == startDate) || (date == endDate))
		viewSelectedStart.isHidden = !(date == startDate)
		viewSelectedEnd.isHidden = !(date == endDate)

		guard let stDate = startDate else { return }
		guard let enDate = endDate else { return }
		viewInRange.isHidden = !date.isDateInBetween(of: [stDate,enDate])
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setSelected(_ selected: Bool) {

		labelTitle.textColor = selected ? UIColor.white : labelTitle.textColor
		labelTitle.font = selected ? UIFont.systemFont(ofSize: 16, weight: .semibold) : UIFont.systemFont(ofSize: 16)
	}
}
