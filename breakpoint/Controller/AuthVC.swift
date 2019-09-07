//
//  AuthVC.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 8/27/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        //Access the next view controller (LoginVC) and presenting it
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func googleSignInBtnWAsPressed(_ sender: Any) {
    }
    
}
