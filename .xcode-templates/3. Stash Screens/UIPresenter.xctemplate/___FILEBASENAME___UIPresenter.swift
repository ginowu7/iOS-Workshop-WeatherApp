//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import StashCore
import StashUI
import StashUIComponents

class ___VARIABLE_productName___UIPresenter: NavigationBinding {
    weak var userInterface: (UIViewController & ___VARIABLE_productName___UserInterface)!
    public var next: NextAction?

    public required init() {}

    public func bindInterface() -> UIViewController {
        let vc = ___VARIABLE_productName___Storyboard.viewController
        vc.presenter = self
        userInterface = vc

        return vc
    }

    private func configureNavigation() {

    }

    private func configureView() {

    }

    private func dismiss() {
        userInterface.navigationController?.popOrDismissIfRoot()
    }
}

extension ___VARIABLE_productName___UIPresenter: ___VARIABLE_productName___PresenterInterface {

    public func didLoad() {
        configureNavigation()
        configureView()
    }
}
