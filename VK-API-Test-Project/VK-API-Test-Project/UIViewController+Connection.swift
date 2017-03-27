//
//  UIViewController+Connection.swift
//  
//
//  Created by Yurii Chukhlib on 27.03.17.
//
//

import UIKit
import SystemConfiguration

extension UIViewController {
	func isConnectedToNetwork(in viewController: UIViewController) -> Bool {
		let reachabilityManager = ReachabilityManager()
		let alertsManager = AlertsManager()
		if !reachabilityManager.isConnectedToNetwork() {
			alertsManager.showCommonError(with: NSLocalizedString("No Internet Connection", comment: ""), in: viewController)
			return false
		}
		return true
	}
}
