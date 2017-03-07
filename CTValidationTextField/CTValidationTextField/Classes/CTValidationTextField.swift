//
//  CTValidationTextField.swift
//  Pods
//
//  Created by Taras Chernyshenko on 3/4/17.
//
//

import UIKit

open class CTValidationTextField: UITextField, UITextFieldDelegate {
    
    public enum ValidationMode {
        case afterEditing
        case onEditing
        case none
    }
    
    private var errorLabel: UILabel = UILabel(frame: CGRect.zero)
    
    open var updateAction: ((String) -> Void)?
    open var validationRules: [ValidationRule] = []
    open var mode: ValidationMode = .onEditing
    open var isValid: Bool {
        get {
            return self.text?.validate(with: self.validationRules) == .valid
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.initialization()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.initialization()
    }
    
    private func initialization() {
        self.clipsToBounds = false
        
        let label = self.errorLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        self.addConstraint(NSLayoutConstraint(
            item: label, attribute: .bottom, relatedBy: .equal, toItem: self,
            attribute: .bottom, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(
            item: label, attribute: .trailing, relatedBy: .equal, toItem: self,
            attribute: .trailing, multiplier: 1.0, constant: 0))
        label.addConstraint(NSLayoutConstraint(
            item: label, attribute: .height, relatedBy: .equal, toItem: nil,
            attribute: .height, multiplier: 1.0, constant: 15))
        
        self.errorLabel.textColor = UIColor.red
        self.errorLabel.font = UIFont.systemFont(ofSize: 10)
        self.errorLabel.isHidden = false
        self.errorLabel.textAlignment = .right
        self.errorLabel.numberOfLines = 0
    }
    
    private func validate(_ text: String) {
        if let errorMessage = text.validate(
            with: self.validationRules).message() {
            self.errorLabel.isHidden = false
            self.errorLabel.text = errorMessage
        } else {
            self.errorLabel.isHidden = true
        }
    }
    
    open func setValidation(_ isValid: Bool, with message: String = "") {
        self.errorLabel.isHidden = isValid
        self.errorLabel.text = message
    }
    
    //MARK: UITextFieldDelegate methods
    
    public func textField(_ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let nsString = NSString(string: text)
        let newText = nsString.replacingCharacters(in: range, with: string)
        self.text = newText
        
        self.updateAction?(newText)
        if self.mode == .onEditing && self.validationRules.count > 0 {
            self.validate(newText)
        }
        return false
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if self.mode == .afterEditing && self.validationRules.count > 0 {
            self.validate(textField.text ?? "")
        }
    }
}

