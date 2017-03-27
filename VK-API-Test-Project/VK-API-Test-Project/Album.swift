//
//  Album.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class Album {
	let name: String
	let descr: String
	let coverLink: String?
	let id: Int
	let size: Int
	
	init(_ name: String, _ descr: String, _ coverLink: String?, _ id: Int, _ size: Int) {
		self.name = name
		self.descr = descr
		self.coverLink = coverLink
		self.id = id
		self.size = size
	}
}
