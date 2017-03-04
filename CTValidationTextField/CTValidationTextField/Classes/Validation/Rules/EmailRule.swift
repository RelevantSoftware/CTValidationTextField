//
//  EmailRule.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

public struct EmailRule: ValidationRule {
    
    public var actionMode: ActionMode
    public var error: ValidationError = .email
    
    public init(mode: ActionMode = .required) {
        self.actionMode = mode
    }
    
    public func validate(_ text: String) -> ValidationError? {
        if text.isEmpty { return nil }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text) ? nil : self.error
    }
}
