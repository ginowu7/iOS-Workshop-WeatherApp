//
//  WeatherWireframe.swift
//  WeatherApp
//
//  Created by Gino Wu on 9/13/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation
import UIKit

public class WeatherWireframe: WeatherWireframeInterface {
    public weak var viewController: UIViewController?

    public func createViewController() -> UIViewController {
        let presenter = WeatherPresenter()
        let userInterface = WeatherStoryboard.viewController
        let interactor = WeatherInteractor()

        userInterface.presenter = presenter
        interactor.output = presenter
        presenter.userInterface = userInterface
        presenter.interactor = interactor
        presenter.wireframe = self
        viewController = userInterface
        return userInterface
    }

}
