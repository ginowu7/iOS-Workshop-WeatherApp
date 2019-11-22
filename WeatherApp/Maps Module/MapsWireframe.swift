//
//  MapsWireframe.swift
//  WeatherApp
//
//  Created by Gino Wu on 11/11/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import UIKit

public class MapsWireframe {

    public weak var viewController: UIViewController?

    public func createViewController() -> UIViewController {
        let presenter = MapsPresenter()
        let userInterface = MapsStoryboard.viewController
        let interactor = MapsInteractor()

        userInterface.presenter = presenter
        interactor.output = presenter
        presenter.userInterface = userInterface
        presenter.interactor = interactor
        presenter.wireframe = self

        return userInterface
    }
}

extension MapsWireframe {

}

extension MapsWireframe: MapsWireframeInterface {

}
