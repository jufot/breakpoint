//
//  UIViewExt.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 9/26/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import UIKit

extension UIView {
    //Function that binds the text view to the keyboard
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        //The time duration the keyboard moves
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue //converting the data into a cgRectValue
            
        let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue //converting the data into a cgRectValue
        
        let deltaY = endFrame.origin.y - beginningFrame.origin.y //The height the keybord is
        
        
        //Animate the frames
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
