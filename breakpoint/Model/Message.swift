//
//  Message.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 9/27/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import Foundation

class Message {
    //Encapsulation
    private var _content: String
    private var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String  {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
    
}
