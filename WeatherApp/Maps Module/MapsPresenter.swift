//
//  MapsPresenter.swift
//  WeatherApp
//
//  Created by Gino Wu on 11/11/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation

class MapsPresenter {

    weak var userInterface: MapsUserInterface!
    var interactor: MapsInteractorInput!
    var wireframe: MapsWireframeInterface!

    init() {
    }

    private func configureNavigation() {

    }

    private func configureView() {
        userInterface.configure(with: .initial)
    }
}

extension MapsPresenter: MapsPresenterInterface {

    func didLoad() {
        configureNavigation()
        configureView()
    }
}

extension MapsPresenter: MapsInteractorOutput {

}
