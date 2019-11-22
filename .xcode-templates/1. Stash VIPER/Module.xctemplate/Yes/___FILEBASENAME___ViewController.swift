//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

class ___VARIABLE_productName___ViewController: UIViewController {

    var presenter: ___VARIABLE_productName___PresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.didLoad()
    }
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___UserInterface {

    func configure(with viewModel: ___VARIABLE_productName___ViewModel) {

    }
}

class ___VARIABLE_productName___Storyboard {

    private static let storyboard = UIStoryboard(name: "___VARIABLE_productName___", bundle: Bundle(for: ___VARIABLE_productName___Storyboard.self))

    static var viewController: ___VARIABLE_productName___ViewController {
        return storyboard.viewController("___VARIABLE_productName___ViewController")
    }
}
