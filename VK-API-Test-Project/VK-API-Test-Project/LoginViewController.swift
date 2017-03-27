//
//  LoginViewController.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit
import SwiftyVK

class LoginViewController: UIViewController {

	fileprivate let vkApiManager    = VkApiManager()
	fileprivate let vkSignInHandler = VkSignInHandler()
	fileprivate let alertsManager   = AlertsManager()

	@IBAction func loginButtonAction(_ sender: Any) {
		if self.isConnectedToNetwork(in: self) {
			self.view.blockUI()
			vkSignInHandler.signIn { [weak self] error in
				guard let `self` = self else { return }
				self.view.unBlockUI()
				if let signInError = error {
					self.alertsManager.showCommonError(with: signInError.localizedDescription, in: self)
				}
				else {
					self.performSegue(withIdentifier: "profileControllerSegue", sender: self)
				}
			}
		}
	}
	
}
