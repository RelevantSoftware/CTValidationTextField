//
//  ViewController.swift
//  CTValidationTextField
//
//  Created by Taras Chernyshenko on 03/04/2017.
//  Copyright (c) 2017 Taras Chernyshenko. All rights reserved.
//

import UIKit
import CTValidationTextField

class TableViewController: UITableViewController {

    @IBOutlet private weak var nameTextField: CTValidationTextField?
    @IBOutlet private weak var emailTextField: CTValidationTextField?
    @IBOutlet private weak var phoneTextField: CTValidationTextField?
    @IBOutlet private weak var addressTextField: CTValidationTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numbersRule = NumbersRule(mode: .canOverlap)
        let lettersRule = LetterRule(mode: .canOverlap)
        let symbolsRule = SymbolsRule(symbols: [" ", "-", "'"], mode: .canOverlap)
        let emailRule = EmailRule()
        
        self.nameTextField?.validationRules = [lettersRule, numbersRule, symbolsRule]
        self.emailTextField?.validationRules = [emailRule, MinLengthRule(min: 7)]
        self.phoneTextField?.validationRules = [numbersRule, MinLengthRule(min: 8),
            SymbolsRule(symbols: ["+"])]
        self.addressTextField?.validationRules = [
            lettersRule, numbersRule,
            SymbolsRule(symbols: ["#", "(", ")", "\\", ".", ",", "-", " "],
            mode: .canOverlap)
        ]
        
        self.nameTextField?.updateAction = { (text) in
            self.nameTextField?.text = text
        }
        
        self.emailTextField?.updateAction = { (text) in
            self.emailTextField?.text = text
        }
        
        self.phoneTextField?.updateAction = { (text) in
            self.phoneTextField?.text = text
        }
        
        self.addressTextField?.updateAction = { (text) in
            self.addressTextField?.text = text
        }
    }
}
