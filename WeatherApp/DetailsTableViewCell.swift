//
//  DetailsTableViewCell.swift
//  WeatherApp
//
//  Created by Gino Wu on 8/29/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var topLabel: UILabel! {
        didSet {
            topLabel.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
            topLabel.textColor = .lightText
            topLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var bottomLabel: UILabel! {
        didSet {
            bottomLabel.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold)
            bottomLabel.textColor = .white
            bottomLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
}
