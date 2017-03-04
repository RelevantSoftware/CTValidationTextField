//
//  MinLengthRule.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

public struct MinLengthRule: ValidationRule {
    
    public var actionMode: ActionMode
    private let minLength: Int
    public var error: ValidationError {
        get {
            return .minLength(self.minLength)
        }
    }
    
    public init(mode: ActionMode = .required) {
        self.actionMode = mode
        self.minLength = 0
    }
    
    public init(min: Int, mode: ActionMode = .required) {
        self.minLength = min
        self.actionMode = mode
    }
    
    public func validate(_ text: String) -> ValidationError? {
        if text.isEmpty { return nil }
        return text.characters.count < self.minLength ? self.error : nil
    }
}
