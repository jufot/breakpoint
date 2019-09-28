//
//  DataService.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 8/14/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    //Creates an instance of this class within itself
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    //Reference to the database
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    //Reference to the users
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    //Reference to the group of users
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    //Reference to the feed
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    //Creates a user to update to database
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    //A method to upload post to Firebase. The completion handler is necessary; it's "escaping" because to get out the Firebase closures you have to escape the vlaue out of it
    func uploadPost(withMessage message: String, forUId uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool) -> ()) {
        if groupKey != nil {
            // send  to group ref
        } else {
            //Generate an ID for every message
            REF_FEED.childByAutoId().updateChildValues(["content" : message, "senderID" : uid])
            sendComplete(true)
        }
    }
    
    //Func to pass the data that we download
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        //Observe a single event, when it's called every message will be downloaded
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnaphot) in
            guard let feedMessageSnaphot = feedMessageSnaphot.children.allObjects as? [DataSnapshot] else { return }
            
            //Pull out content from the senderId, create a message object, and then append it to array
            for message in feedMessageSnaphot {
                let content = message.childSnapshot(forPath: "content").value as? String ?? "" //fetching message value from the Firebase database
                let senderId = message.childSnapshot(forPath: "senderID").value as? String ?? "" //fetching senderId value from the Firebase database
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            
            handler(messageArray) //call handler and pass in messageArray (result after the for loop ends)
        }
    }
    
    
}
