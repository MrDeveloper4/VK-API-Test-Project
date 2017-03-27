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
	var selectedAlbum: Album?
	
	fileprivate let vkApiManager  = VkApiManager()
	fileprivate var alertsManager = AlertsManager()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.blockUI()
		vkApiManager.userAlbums { [weak self] albumsArray, errorMessage in
			guard let `self` = self else { return }
			self.view.unBlockUI()
			guard errorMessage == nil else {
				self.alertsManager.showCommonError(with: errorMessage!, in: self)
				return
			}
			if let albums = albumsArray {
				self.albums = albums
			}
			
			self.tableView.reloadData()
		}
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "toPhotosSegue" {
			let navigationViewController = segue.destination as? UINavigationController
			let photosViewController = navigationViewController?.topViewController as? PhotosTableViewController
			photosViewController?.selectedAlbumId = selectedAlbum?.id
		}
	}
	
	@IBAction func dismissPhotosController(unwindSegue: UIStoryboardSegue) {
		
	}
}
