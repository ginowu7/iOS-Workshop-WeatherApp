//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import StashCore

class ___VARIABLE_productName___Interactor {

    typealias Remote = UserRemote
    typealias Database = UserDatabase

    private let remote: Remote
    private let database: Database
    weak var output: ___VARIABLE_productName___InteractorOutput?

    init(database: Database, remote: Remote) {
        self.remote = remote
        self.database = database
    }
}

extension ___VARIABLE_productName___Interactor: ___VARIABLE_productName___InteractorInput {

}
