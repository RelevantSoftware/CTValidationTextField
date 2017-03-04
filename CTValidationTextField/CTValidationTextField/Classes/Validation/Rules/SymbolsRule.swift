//
//  SymbolsRule.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

public struct SymbolsRule: ValidationRule {
    
    public var actionMode: ActionMode
    private let symbols: [String]
    
    public var error: ValidationError {
        get {
            return .symbols(self.symbols)
        }
    }
    
    public init(mode: ActionMode = .required) {
        self.actionMode = mode
        self.symbols = []
    }
    
    public init(symbols: [String], mode: ActionMode = .required) {
        self.symbols = symbols
        self.actionMode = mode
    }
    
    public func validate(_ text: String) -> ValidationError? {
        for symbol in self.symbols {
            if text.contains(symbol) { return nil }
        }
        
        return .symbols(self.symbols)
    }
}
