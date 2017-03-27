//
//  User.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class User {
	let name: String
	let surname: String
	var fullName: String {
		get {
			return "\(name) \(surname)"
		}
	}
	let avatarLink: String?
	
	init(_ name: String, _ surname: String, _ avatarLink: String?) {
		self.name = name
		self.surname = surname
		self.avatarLink = avatarLink
	}
}
