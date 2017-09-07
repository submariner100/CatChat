//
//  LoginViewController.swift
//  CatChat
//
//  Created by Macbook on 01/09/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var topButton: UIButton!
	@IBOutlet weak var bottomButton: UIButton!
	
	var signupMode = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	@IBAction func topTapped(_ sender: Any) {
		if let email = emailTextField.text {
			if let password = passwordTextField.text {
				if signupMode {
					// Sign Up
					FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
						if let error = error {
							self.presentAlert(alert: error.localizedDescription)
						} else {
							
						if let user = user {
					FIRDatabase.database().reference().child("users").child(user.uid).child("email").setValue(user.email)
							print("sign Up was successful :)" )
							self.performSegue(withIdentifier: "moveToCats", sender: nil)
							}
						}
					})
					
		} else {
			// Log In
					FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
						if let error = error {
							self.presentAlert(alert: error.localizedDescription)
						} else {
							
							
							self.performSegue(withIdentifier: "moveToCats", sender: nil)
						}
					})
					
				}
				
			}
			
		}
	}
	
	func presentAlert(alert: String) {
		let alertVC = UIAlertController(title: "Error", message: alert, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
			alertVC.dismiss(animated: true, completion: nil)
		}
		alertVC.addAction(okAction)
		present(alertVC, animated: true, completion: nil)
		
		
		
	}
	
	
	
	
	
	@IBAction func bottomTapped(_ sender: Any) {
		if signupMode {
			// Switch to Log In
			signupMode = false
			topButton.setTitle("Log In", for: .normal)
			bottomButton.setTitle("Switch to Sign Up", for: .normal)
			
		} else {
			// Switch to Sign Up
			signupMode = true
			topButton.setTitle("Sign Up", for: .normal)
			bottomButton.setTitle("Switch to Log In", for: .normal)
			
			
		}
	}
}

