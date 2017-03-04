//
//  StringExtension.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

extension String: Validatable {
    
    func validate(with rules: [ValidationRule]) -> ValidationResult {
        
        var isValid = true
        
        let requiredRules = rules.filter { $0.actionMode == .required }
        
        for rule in requiredRules {
            if rule.validate(self) != nil {
                return .invalid([rule.error])
            }
        }
        
        let overlapingRules = rules.filter { $0.actionMode == .canOverlap }
        
        for character in self.characters {
            
            let string = String.init(character)
            var isCharacterValid = false
            for rule in overlapingRules {
                if !isCharacterValid {
                    isCharacterValid = rule.validate(string) == nil
                }
            }
            
            isValid = isCharacterValid
            if !isValid { break }
        }
        
        let error = overlapingRules.map { $0.error }
        return !isValid ? .invalid(error) : .valid
    }
}

