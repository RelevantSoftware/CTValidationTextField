//
//  NumbersRule.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

public struct NumbersRule: ValidationRule {
    
    public var actionMode: ActionMode
    public var error: ValidationError = .numbers
    
    public init(mode: ActionMode = .required) {
        self.actionMode = mode
    }
    
    public func validate(_ text: String) -> ValidationError? {
        let characterSet = CharacterSet.decimalDigits.inverted
        if let _ = text.rangeOfCharacter(from: characterSet) {
            return self.error
        }
        
        return nil
    }
}
