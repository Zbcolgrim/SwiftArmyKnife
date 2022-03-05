//
//  Todos+Convenience.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 3/5/22.
//

import Foundation
import CoreData

extension Todo {
    @discardableResult
    convenience init(name: String) {
        self.init(context: TodoListStorage.shared.container.viewContext)
        self.name = name
        self.isComplete = false
    }
}
