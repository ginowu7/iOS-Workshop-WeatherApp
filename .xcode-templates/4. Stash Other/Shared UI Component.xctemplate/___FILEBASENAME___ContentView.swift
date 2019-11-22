//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

final public class ___VARIABLE_productName___ContentView: NibView, ColorStylable {

    public typealias ViewModel = ___VARIABLE_productName___ViewModel

    public var colorStyle: ColorStyle = .lightContent {
        didSet {
            applyColorStyle()
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }
}

private extension ___VARIABLE_productName___ContentView {

    private func commonInit() {
        applyColorStyle()
    }

    private func applyColorStyle() {
        backgroundColor = colorStyle.background1
    }
}

extension ___VARIABLE_productName___ContentView: ViewModelConfigurable {

    public func configure(with viewModel: ViewModel) {

    }
}
