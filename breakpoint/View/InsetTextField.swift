//
//  InsetTextField.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 8/27/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {
    
    
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0) //how it should appear on the rectangle
    
    override func awakeFromNib() {
        //Sets the placeholder to white
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        self.attributedPlaceholder = placeholder
        super.awakeFromNib()
    }
    
    //Where the text is held
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let bounds = bounds.inset(by: padding)
        return bounds
    }
    
    //Where the editing is
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let bounds = bounds.inset(by: padding)
        return bounds
    }
    
    //Where the placeholder will be
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let bounds = bounds.inset(by: padding)
        return bounds
    }
    
    
    

    
    

}
