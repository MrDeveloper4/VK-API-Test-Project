//
//  AlbumsTableViewController.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {

	var albums = [Album]()
	
	fileprivate let vkApiManager  = VkApiManager()
	fileprivate var alertsManager = AlertsManager()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		vkApiManager.userAlbums { [weak self] albumsArray, errorMessage in
			guard let `self` = self else { return }
			guard errorMessage == nil else {
				self.alertsManager.showCommonError(with: errorMessage!, in: self)
				return
			}
			DispatchQueue.main.async {
				if let albums = albumsArray {
					self.albums = albums
				}
			}
			
			self.tableView.reloadData()
		}
    }
}
