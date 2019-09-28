//
//  FeedVC.swift
//  breakpoint
//
//  Created by Jeremiah Ufot on 8/14/19.
//  Copyright © 2019 Jeremiah Ufot. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self //set delegate
        tableView.dataSource = self //set datasource
    }
    
    //Download all the messages nd fill up ur local array and feed
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessageArray) in
            self.messageArray = returnedMessageArray
            self.tableView.reloadData() //reloads/updates the table view with new data
        }
    }
    
}


extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else { return UITableViewCell() } //creates a cell else return an empty tableview cell
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row] //Populate them based on the row of the tableview
        
        //After the message has been instantiated, configure cell
        cell.configureCell(profileImage: image!, email: message.senderId, content: message.content)
        return cell
    }
}
