//
//  ForcastView.swift
//  WeatherApp
//
//  Created by Gino Wu on 8/20/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

class ForcastView: UIView {

    @IBOutlet weak var headerLabel: UILabel! {
        didSet {
            headerLabel.textColor = .white
            headerLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        }
    }
    @IBOutlet weak var iconView: SKYIconView!
    @IBOutlet weak var topLabel: UILabel! {
        didSet {
            topLabel.textColor = .lightText
            topLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        }
    }
    @IBOutlet weak var bottomLabel: UILabel! {
        didSet {
            bottomLabel.textColor = .lightText
            bottomLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        }
    }
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.backgroundColor = .clear
        }
    }

}
