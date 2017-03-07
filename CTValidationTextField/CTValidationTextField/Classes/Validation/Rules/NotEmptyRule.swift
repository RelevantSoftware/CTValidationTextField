//
//  NotEmptyRule.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/7/17.
//
//

import Foundation

public struct NotEmptyRule: ValidationRule {
    
    public var actionMode: ActionMode
    public var error: ValidationError = .notEmpty
    
    public init(mode: ActionMode = .required) {
        self.actionMode = mode
    }
    
    public func validate(_ text: String) -> ValidationError? {
        return text.isEmpty ? self.error : nil
    }
}
