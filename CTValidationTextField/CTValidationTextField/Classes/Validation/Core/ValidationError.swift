//
//  ValidationError.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

public enum ValidationError: Error {
    
    case letters
    case numbers
    case symbols([String])
    case email
    case phone
    case minLength(Int)
    case maxLength(Int)
    case notEmpty
    
    func message() -> String {
        switch self {
            case .letters: return "letters"
            case .numbers: return "numbers"
            case .symbols(let symbols): return "[\(symbols.joined(separator: ", "))] symbols"
            case .email: return "E-mail"
            case .phone: return "Phone"
            case .minLength(let min): return "minimum length: (\(min))"
            case .maxLength(let max): return "maximum length: (\(max))"
            case .notEmpty: return "field is required"
        }
    }
}
