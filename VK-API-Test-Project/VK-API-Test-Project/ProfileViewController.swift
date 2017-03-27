//
//  ProfileViewController.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyVK

class ProfileViewController: UIViewController {
	@IBOutlet weak var userAvatarImageView: UIImageView!
	@IBOutlet weak var usernameLabel: UILabel!

	fileprivate let vkApiManager        = VkApiManager()
	fileprivate var alertsManager       = AlertsManager()
	fileprivate let reachabilityManager = ReachabilityManager()
	
	var userId: String!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		fillData()
    }
	
	fileprivate func fillData() {
		vkApiManager.userInfo { [weak self] user, errorMessage in
			guard let `self` = self else { return }
			guard errorMessage == nil else {
				self.alertsManager.showCommonError(with: errorMessage!, in: self)
				return
			}
			if let currentUser = user {
				if let link = currentUser.avatarLink {
					self.userAvatarImageView.sd_setImage(with: URL(string: link), placeholderImage: UIImage(named: "placeholder"))
					self.userAvatarImageView.setShowActivityIndicator(true)
				}
				DispatchQueue.main.async {
					self.usernameLabel.text = currentUser.fullName
				}
			}
		}
	}
	
	@IBAction func albumsButtonAction(_ sender: Any) {
		if self.isConnectedToNetwork(in: self) {
			
		}
	}
}
