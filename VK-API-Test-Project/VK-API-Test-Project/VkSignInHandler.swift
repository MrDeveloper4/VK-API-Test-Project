//
//  VkSignInHandler.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit
import SwiftyVK

typealias VKSignInCompletion = (_ error: AuthError?) -> Void

class VkSignInHandler: VKDelegate {
	
	fileprivate var signInCompletion: VKSignInCompletion?
	
	fileprivate let appID = "5947003"
	fileprivate let scope: Set<VK.Scope> = [.photos]
	var isUserLogedIn: Bool {
		get {
			return VK.state == .authorized ? true : false
		}
	}
	
	init() {
		VK.configure(withAppId: appID, delegate: self)
	}
	
	func signIn(signInCompletion: @escaping VKSignInCompletion) -> Void {
		VK.logIn()
		self.signInCompletion = signInCompletion
	}
	
	func vkWillAuthorize() -> Set<VK.Scope> {
		return scope
	}
	
	func vkDidAuthorizeWith(parameters: Dictionary<String, String>) {
		signInCompletion?(nil)
	}
	
	func vkAutorizationFailedWith(error: AuthError) {
		signInCompletion?(error)
	}
	
	func vkDidUnauthorize() {
		
	}
	
	func vkShouldUseTokenPath() -> String? {
		return nil
	}
	
	func vkWillPresentView() -> UIViewController {
		return UIApplication.shared.delegate!.window!!.rootViewController!
	}

}


