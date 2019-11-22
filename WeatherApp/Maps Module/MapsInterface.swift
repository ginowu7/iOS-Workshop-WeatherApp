//
//  MapsInterface.swift
//  WeatherApp
//
//  Created by Gino Wu on 11/11/19.
//  Copyright © 2019 Gino Wu. All rights reserved.
//

import Foundation

protocol MapsUserInterface: class {
    func configure(with viewModel: MapsViewModel)
}

protocol MapsPresenterInterface: class {
    func didLoad()
}

protocol MapsInteractorInput {

}

protocol MapsInteractorOutput: class {

}

protocol MapsWireframeInterface  {

}

protocol MapsEventTracking {

}
