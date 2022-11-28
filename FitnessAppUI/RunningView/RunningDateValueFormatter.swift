
import Foundation
import Charts

//-----------------------------------------------------------------------------------------------------------------------------------------------
public class RunningDateValueFormatter: NSObject, AxisValueFormatter {

	private let dateFormatter = DateFormatter()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	public func stringForValue(_ value: Double, axis: AxisBase?) -> String {

		dateFormatter.dateFormat = "HH"
		if let date = dateFormatter.date(from: "\(Int(value))") {
			dateFormatter.dateFormat = "HH:mm"
			return dateFormatter.string(from: date)
		}
		dateFormatter.dateFormat = "HH:mm"
		return dateFormatter.string(from: Date(timeIntervalSince1970: value))
	}
}
