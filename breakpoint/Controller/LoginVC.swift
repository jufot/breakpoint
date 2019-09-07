//
//  LoginVC.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 8/27/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import UIKit


class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, loginError) in
                if success { //if it's successful dismiss the LoginVC view controller
                    self.dismiss(animated: true, completion: nil)
                } else { //if the login was not successful
                    print(String(describing: loginError?.localizedDescription)) //explicitly casting the login error message as a String
                }
                
                //If there was an error login in; the user will be prompted to register
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    //if the user was successfully registered then login them in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            //if the user was successfully logged in then dismiss the LoginVC view controller
                                self.dismiss(animated: true, completion: nil)
                            print("Successfully registrated user")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            }
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension LoginVC: UITextFieldDelegate { }
