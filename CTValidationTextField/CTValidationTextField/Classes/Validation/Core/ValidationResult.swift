//
//  ValidationResult.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

enum ValidationResult: Equatable {
    
    case valid
    case invalid([ValidationError])
    
    func message() -> String? {
        switch self {
        case .invalid(let errors):
            let string = errors.map { $0.message() }.joined(separator: ", ")
            return "Allowed format:\(string)"
        default: return nil
        }
    }
    
    public static func ==(lhs: ValidationResult, rhs: ValidationResult) -> Bool {
        switch (lhs, rhs) {
        case (.valid, .valid): return true
        case ( invalid(_), invalid(_)): return true
        default: return false
        }
    }
}
