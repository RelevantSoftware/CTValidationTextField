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
            case .letters: return NSLocalizedString("letters", comment: "")
            case .numbers: return NSLocalizedString("numbers", comment: "")
            case .symbols(let symbols): return "[\(symbols.joined(separator: ", "))] \(NSLocalizedString("symbols", comment: ""))"
            case .email: return NSLocalizedString("E-mail", comment: "")
            case .phone: return NSLocalizedString("Phone", comment: "")
            case .minLength(let min): return "\(NSLocalizedString("minimum length", comment: "")): (\(min))"
            case .maxLength(let max): return "\(NSLocalizedString("maximum length", comment: "")): (\(max))"
            case .notEmpty: return NSLocalizedString("field is required", comment: "")
        }
    }
}
