//
//  MapsViewController.swift
//  WeatherApp
//
//  Created by Gino Wu on 11/11/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import UIKit

class MapsViewController: UIViewController {

    var presenter: MapsPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.didLoad()
    }
}

extension MapsViewController: MapsUserInterface {

    func configure(with viewModel: MapsViewModel) {

    }
}

class MapsStoryboard {

    private static let storyboard = UIStoryboard(name: "Maps", bundle: Bundle(for: MapsStoryboard.self))

    static var viewController: MapsViewController {
        return storyboard.viewController("MapsViewController")
    }
}
