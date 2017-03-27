//
//  UIView+BlockUI.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIView {
	func blockUI(message blockMessage: String? = nil) {
		DispatchQueue.main.async() {
			let loadingNotification = MBProgressHUD.showAdded(to: self, animated: true)
			loadingNotification.mode = MBProgressHUDMode.indeterminate
			loadingNotification.label.text = blockMessage
		}
	}
	
	func unBlockUI() {
		DispatchQueue.main.async() {
			MBProgressHUD.hide(for: self, animated: true)
		}
	}
}
