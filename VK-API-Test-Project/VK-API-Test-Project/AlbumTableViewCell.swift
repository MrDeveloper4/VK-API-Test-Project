//
//  AlbumTableViewCell.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
	
	@IBOutlet weak var coverImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	func config(with album: Album) {
		self.titleLabel.text = album.name
		self.descriptionLabel.text = album.descr
		if let link = album.coverLink {
			self.coverImageView.setShowActivityIndicator(true)
			self.coverImageView.setIndicatorStyle(.gray)
			self.coverImageView.sd_setImage(with: URL(string: link), placeholderImage: UIImage(named: "placeholder"))
		}
	}
}
