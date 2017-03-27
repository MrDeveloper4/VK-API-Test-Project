//
//  AlertsManager.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class AlertsManager {
	func showCommonError(with errorMessage: String, in viewController: UIViewController) {
		let errorAlert = UIAlertController(title: NSLocalizedString(NSLocalizedString("Error", comment: ""), comment: ""), message: errorMessage, preferredStyle: .alert)
		
		let cancelAction = UIAlertAction(title: NSLocalizedString(NSLocalizedString("OK", comment: ""), comment: ""), style: .cancel, handler: nil)
		errorAlert.addAction(cancelAction)
		
		viewController.present(errorAlert, animated: true, completion: nil)
	}
}
