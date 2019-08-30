//
//  UIView+Extensions.swift
//  WeatherApp
//
//  Created by Gino Wu on 8/26/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {

    class func fromNib<T: UIView>() -> T {
        
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }

}
