//
//  FeedCell.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 9/27/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    //Function to configure the cell
    func configureCell(profileImage: UIImage, email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
