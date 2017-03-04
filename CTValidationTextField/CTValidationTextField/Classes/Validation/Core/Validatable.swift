//
//  Validatable.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

protocol Validatable {
    
    func validate(with rules: [ValidationRule]) -> ValidationResult
}
