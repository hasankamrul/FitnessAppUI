//
//  AppColor.swift
//  FitnessAppUI
//
//

import Foundation
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
enum AssetsColor: String {
    case border = "Border"
    case theme = "Theme"
    case navigation = "Navigation"
}

struct AppColor {
    
    static let Border = UIColor(named: AssetsColor.border.rawValue)
    static let Theme = UIColor(named: AssetsColor.theme.rawValue)
    static let Navigation = UIColor(named: AssetsColor.navigation.rawValue)
}
