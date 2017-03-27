//
//  PhotosTableViewController.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class PhotosTableViewController: UITableViewController {

	var photos = [Image]()
	var selectedAlbumId: Int!
	
	fileprivate let vkApiManager  = VkApiManager()
	let alertsManager = AlertsManager()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.blockUI()
		vkApiManager.userAlbumPhotos(selectedAlbumId) { [weak self] photosArray, errorMessage in
			guard let `self` = self else { return }
			self.view.unBlockUI()
			guard errorMessage == nil else {
				self.alertsManager.showCommonError(with: errorMessage!, in: self)
				return
			}
			if let photos = photosArray {
				self.photos = photos
			}
			self.tableView.reloadData()
		}
	}
}
