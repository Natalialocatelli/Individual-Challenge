//
//  CustomTextField.swift
//  color generator
//
//  Created by Natalia Locatelli Barbosa on 24/10/22.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 15
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        layer.shadowOpacity = 0.05
        layer.shadowRadius = 1.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        layer.shadowColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 20, 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 20, 0)
    }
    
}

