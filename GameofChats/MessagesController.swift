//
//  ViewController.swift
//  GameofChats
//
//  Created by The Hidden Genius Project on 9/24/16.
//  Copyright © 2016 Devon Nutting. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UIViewController  {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "FilmCollector")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 61, g: 91, b: 161)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var createCollectionButton: UIButton = {
        let button = UIButton(type: .System)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 200)
        button.setTitle("Create Collection", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(24)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleNewCollection), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    lazy var discardCollectionButton: UIButton = {
        let button = UIButton(type: .System)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 200)
        button.setTitle("Delete Collection", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(24)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleDiscardCollection), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    lazy var viewCollectionButton: UIButton = {
        let button = UIButton(type: .System)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 200)
        button.setTitle("View Collection", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(24)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleViewCollection), forControlEvents: .TouchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: #selector(handleLogout))
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 161)
        
        view.addSubview(inputsContainerView)
        view.addSubview(createCollectionButton)
        view.addSubview(discardCollectionButton)
        view.addSubview(viewCollectionButton)
        view.addSubview(profileImageView)
        
        checkIfIUserIsLoggedIn()
        setupInputsContainerView()
        setupCreateCollectionButton()
        setupDiscardCollectionButton()
        setupViewCollectionButton()
        setupProfileImageView()
    
    }
    
    func handleViewCollection() {
        //Takes you to another page to view a collection
        let addCollectionController = NewCollectionViewController()
        let navController = UINavigationController(rootViewController: addCollectionController)
        presentViewController(navController, animated: true, completion: nil)
    }
    
    func handleNewCollection() {
        let addCollectionController = NewCollectionViewController()
        let navController = UINavigationController(rootViewController: addCollectionController)
        presentViewController(navController, animated: true, completion: nil)
    }
    
    func handleDiscardCollection() {
        //Takes you a page to select which collection to delete
        let addCollectionController = NewCollectionViewController()
        let navController = UINavigationController(rootViewController: addCollectionController)
        presentViewController(navController, animated: true, completion: nil)
    }
    
    func setupProfileImageView() {
    //need x, y, height and width constraints (PROFILE IMAGE VIEW)
    profileImageView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
    profileImageView.bottomAnchor.constraintEqualToAnchor(createCollectionButton.topAnchor, constant: -12).active = true
    profileImageView.widthAnchor.constraintEqualToConstant(150).active = true
    profileImageView.heightAnchor.constraintEqualToConstant(150).active = true
    }
    
    func setupCreateCollectionButton() {
        // need x, y, width and height constraints (NEW COLLECTION BUTTON)
        createCollectionButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        createCollectionButton.topAnchor.constraintEqualToAnchor(inputsContainerView.topAnchor).active = true
        createCollectionButton.widthAnchor.constraintEqualToAnchor(inputsContainerView.widthAnchor, constant: -12).active = true
        createCollectionButton.heightAnchor.constraintEqualToConstant(100).active = true
    }
    
    func setupDiscardCollectionButton() {
        // need x, y, width and height constraints (DISCARD COLLECTION BUTTON)
        discardCollectionButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        discardCollectionButton.topAnchor.constraintEqualToAnchor(createCollectionButton.bottomAnchor, constant: 5).active = true
        discardCollectionButton.widthAnchor.constraintEqualToAnchor(inputsContainerView.widthAnchor, constant: -12).active = true
        discardCollectionButton.heightAnchor.constraintEqualToConstant(100).active = true
    }
    
    func setupViewCollectionButton() {
        // need x, y, width and height constraints (VIEW COLLECTION BUTTON)
        viewCollectionButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        viewCollectionButton.topAnchor.constraintEqualToAnchor(discardCollectionButton.bottomAnchor, constant: 5).active = true
        viewCollectionButton.widthAnchor.constraintEqualToAnchor(inputsContainerView.widthAnchor, constant: -12).active = true
        viewCollectionButton.heightAnchor.constraintEqualToConstant(100).active = true
    }
    
    func setupInputsContainerView() {
        //need x, y, width, height constraints (INPUTCONTAINERVIEW)
        inputsContainerView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        inputsContainerView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor, constant: 36).active = true
        inputsContainerView.widthAnchor.constraintEqualToAnchor(view.widthAnchor, constant: -24).active = true
        inputsContainerView.heightAnchor.constraintEqualToConstant(300).active = true
    }
    
    func checkIfIUserIsLoggedIn() {
        if FIRAuth.auth()?.currentUser?.uid == nil {
            performSelector(#selector(handleLogout), withObject: nil, afterDelay: 0)
        
        } else {
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("Users").child(uid!).observeEventType(.Value, withBlock: { (snapshot) in
                
                if let Dictionary = snapshot.value as? [String: AnyObject] {
                    self.navigationItem.title = Dictionary["name"] as? String
                }
                    
                }, withCancelBlock: nil)
            
                
        }
    }

    func handleLogout() {
        do {
             try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print (logoutError)
        }
        
        let loginController = LoginController()
        presentViewController(loginController, animated: true, completion: nil)
    }

}



