//
//  SnapViewController.swift
//  CatChat
//
//  Created by Macbook on 01/09/2017.
//  Copyright © 2017 Chappy-App. All rights reserved.
//

import UIKit
import FirebaseAuth

class SnapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func logoutTapped(_ sender: Any) {
		try? FIRAuth.auth()?.signOut()
		dismiss(animated: true, completion: nil)
		print("Log Out was successful :)" )
		
	}
	
}

extension SnapViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.textLabel?.text = "Hello Michael"
		return cell
	}
	
	
	
}
