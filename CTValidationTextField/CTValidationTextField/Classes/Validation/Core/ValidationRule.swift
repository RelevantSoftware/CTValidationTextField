//
//  ValidationRule.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import Foundation

public enum ActionMode {
    case required
    case canOverlap
}

public protocol ValidationRule {
    
    var actionMode: ActionMode { get }
    var error: ValidationError { get }
    
    init(mode: ActionMode)
    func validate(_ text: String) -> ValidationError?
}
