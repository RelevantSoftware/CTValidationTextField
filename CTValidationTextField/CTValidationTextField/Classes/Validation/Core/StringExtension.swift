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
        
        var errors: [ValidationError] = []
        let requiredRules = rules.filter { $0.actionMode == .required }
        let overlapingRules = rules.filter { $0.actionMode == .canOverlap }
        
        for rule in requiredRules {
            if let error = rule.validate(self) {
                return .invalid([error])
            }
        }
        
        var isValid = true
        for character in self.characters {
            
            var isChecked = false
            
            let string = String.init(character)
            for rule in overlapingRules {
                if isChecked == false {
                    isValid = rule.validate(string) == nil
                    isChecked = isValid
                }
            }
            
            if !isValid { return .invalid(overlapingRules.map { $0.error }) }
        }
        
        return .valid
    }
}
