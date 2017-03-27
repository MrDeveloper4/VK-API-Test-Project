//
//  PhotoTableViewCell.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

	@IBOutlet weak var coverImageView: UIImageView!
	
	func config(with image:Image) {
		if let link = image.coverLink {
			self.coverImageView.setShowActivityIndicator(true)
			self.coverImageView.setIndicatorStyle(.gray)
			self.coverImageView.sd_setImage(with: URL(string: link), placeholderImage: nil)
		}
	}
}
