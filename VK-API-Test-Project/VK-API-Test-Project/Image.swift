//
//  Image.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class Image: NSObject {
	var coverLink: String?
	var imageLink: String?
	
	var coverWidth: Int?
	var coverHeight: Int?
	var coverArea: Int {
		get {
			return self.coverWidth! * self.coverHeight!
		}
	}
	
	var imageWidth: Int?
	var imageHeight: Int?
	var imageArea: Int {
		get {
			return self.imageWidth! * self.imageHeight!
		}
	}
	
}
