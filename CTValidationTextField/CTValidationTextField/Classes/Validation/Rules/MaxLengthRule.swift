//
//  MaxLengthRule.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/16/17.
//
//

import Foundation

public struct MaxLengthRule: ValidationRule {
    
    public var actionMode: ActionMode
    private let maxLength: Int
    public var error: ValidationError {
        get {
            return .maxLength(self.maxLength)
        }
    }
    
    public init(mode: ActionMode = .required) {
        self.actionMode = mode
        self.maxLength = -1
    }
    
    public init(max: Int, mode: ActionMode = .required) {
        self.maxLength = max
        self.actionMode = mode
    }
    
    public func validate(_ text: String) -> ValidationError? {
        if text.isEmpty || self.maxLength == -1 { return nil }
        return text.count > self.maxLength ? self.error : nil
    }
}
