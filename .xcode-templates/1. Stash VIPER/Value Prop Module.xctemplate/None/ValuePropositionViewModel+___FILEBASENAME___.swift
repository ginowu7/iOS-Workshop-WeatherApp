//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import StashUI
import StashModules

extension ValuePropositionViewModel {

    private static var disclosureString: NSAttributedString {
        return NSAttributedString(string: ___VARIABLE_productName___LocalizedString.disclosure,
                                  stashAttributes: .disclosureLight)
    }

    public static func ___VARIABLE_productNameCamelCase___(withContinueAction continueAction: @escaping () -> Void) -> ValuePropositionViewModel {
        let continueButton = ButtonViewModel(title: ___VARIABLE_productName___LocalizedString.cta,
                                             action: continueAction)

        return ValuePropositionViewModel(image: ___VARIABLE_image___.image,
                                         text: ___VARIABLE_productName___LocalizedString.text,
                                         detailText: ___VARIABLE_productName___LocalizedString.detailText,
                                         buttons: [continueButton],
                                         disclosureAttributedText: disclosureString)
    }
}
