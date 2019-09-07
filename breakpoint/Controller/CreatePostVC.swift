//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 9/6/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       textView.delegate = self
    }

    @IBAction func sendBtnWasPressed(_ sender: Any) {
        //If there is text and the send button was pressed, then disable the send button
        if textView != nil && textView.text != "Say something here..." {
            sendBtn.isEnabled = false
           
            
            //This calls the upload method in the Data Service class
            DataService.instance.uploadPost(withMessage: textView.text, forUId: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                //If it was successful then enable the send button and dismiss it
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else { //Other wise disbale it again
                    self.sendBtn.isEnabled = false
                    print("There was an error")
                }
            }
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
}
