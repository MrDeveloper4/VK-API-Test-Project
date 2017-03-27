//
//  VkApiManager.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit
import SwiftyVK

protocol VkApiProtocol {
	func userInfo(completion: @escaping UserInfoCompletion)
}

typealias UserIdCompletion   = (_ userId: String?, _ error: AuthError?) -> ()
typealias UserInfoCompletion = (_ user: User?, _ errorDescr: String?) -> ()

class VkApiManager: VkApiProtocol {

	func userInfo(completion: @escaping UserInfoCompletion) {
		VK.API.Users.get([VK.Arg.fields : "photo_200"]).send(onSuccess: { (json) in
			let name = json[0]["first_name"].string ?? "Name"
			let surname = json[0]["last_name"].string ?? "Surname"
			let avatarLink = json[0]["photo_200"].string ?? nil
			let user = User(name, surname, avatarLink)
			completion(user, nil)
		}, onError: { error in
			completion(nil, error.localizedDescription)
		}, onProgress: nil)
	}
	
}
