//
//  String+Extension.swift
//  FitnessAppUI
//
//  Created by Md Kamrul Hasan on 28/11/22.
//

import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
extension String {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func toDate(withFormate formate: String) -> Date {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        return dateFormatter.date(from: self)!
    }
}
