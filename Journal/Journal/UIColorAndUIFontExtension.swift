//
//  ColorAndFontExtension.swift
//  Journal
//
//  Created by 楊采庭 on 2017/8/4.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

extension UIFont {

    class func textStyle24Font() -> UIFont {
        return UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightSemibold)
    }

    class func textStyle25Font() -> UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightRegular)
    }

    class func textStyle26Font() -> UIFont {
        return UIFont.systemFont(ofSize: 30.0, weight: UIFontWeightRegular)
    }

    class func textStyle27Font() -> UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: UIFontWeightRegular)
    }

}

extension UIColor {

    class var slate: UIColor {
        return UIColor(red: 67.0 / 255.0, green: 87.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0)
    }

    class var coolGrey: UIColor {
        return UIColor(red: 171.0 / 255.0, green: 179.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0)
    }

    class var blush: UIColor {
        return UIColor(red: 247.0 / 255.0, green: 174.0 / 255.0, blue: 163.0 / 255.0, alpha: 1.0)
    }

    class var dustyOrange: UIColor {
        return UIColor(red: 237.0 / 255.0, green: 96.0 / 255.0, blue: 81.0 / 255.0, alpha: 1.0)
    }

}
