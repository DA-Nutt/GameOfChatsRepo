//
//  NewCollectionViewController.swift
//  GameofChats
//
//  Created by The Hidden Genius Project on 10/1/16.
//  Copyright © 2016 Devon Nutting. All rights reserved.
//

import UIKit
import Firebase

class NewCollectionViewController: UITableViewController {
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(handleCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(handleHomeView))
        
        navigationItem.title = ("Create Collection")
        
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 161)
        
    }
    
    func handleHomeView() {
        let homeController = MessagesController()
        let navController = UINavigationController(rootViewController: homeController)
        presentViewController(navController, animated: true, completion: nil)
    }
    
    func handleCancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "Dummy Text"
        
        return cell
        
    }
    
}