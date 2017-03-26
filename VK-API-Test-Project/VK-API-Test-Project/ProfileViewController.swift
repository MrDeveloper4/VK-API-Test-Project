//
//  ProfileViewController.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	@IBOutlet weak var userAvatarImageView: UIImageView!
	@IBOutlet weak var usernameLabel: UILabel!

	fileprivate let vkApiManager     = VkApiManager()
	fileprivate var vkSigningHandler = VkSigningHandler()
	fileprivate var alertsManager    = AlertsManager()
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }

	@IBAction func albumsButtonAction(_ sender: Any) {
		
	}
}
