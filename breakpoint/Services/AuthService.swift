//
//  AuthService.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 9/5/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import Foundation
import Firebase

//Singleton class: instantiate an instance of this class within itself, which gives access to it through out the entire life cycle of the app from any class
//userCreationComplete is a completion handler
class AuthService {
    static let instance = AuthService()
    
    //Pass in email and password, and use Firebase to register a user into the databse
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else{
                userCreationComplete(false, error) //If there is an error with registering a user
                return
            }
            // But if it works then:
            let userData = ["provider": user.providerID, "email": user.email] // Dictionary of user data
            //Where all the data gets passed to Firebase
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    //login in a user
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if (error != nil) {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
    
}


