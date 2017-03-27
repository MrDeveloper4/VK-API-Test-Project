//
//  PhotosTableViewController+Delegate.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit
import Agrume
import MapleBacon

extension PhotosTableViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if self.isConnectedToNetwork(in: self) {
			let selectedPhoto = photos[indexPath.row]
			if let link = selectedPhoto.imageLink {
				
				let agrume = Agrume(imageUrl: URL(string: link)!, backgroundBlurStyle: .light)
				agrume.download = { url, completion in
					let loaderManager = ImageManager.sharedManager
					_ = loaderManager.downloadImage(atUrl: URL(string: link)!, cacheScaled: false, imageView: nil, completion: { [weak self] imageInstance, error in
						
						guard let `self` = self else { return }
						guard error == nil else {
							self.alertsManager.showCommonError(with: (error?.localizedDescription)!, in: self)
							return
						}
						
						if let image = imageInstance?.image {
							completion(image)
						} else {
							completion(nil)
						}
					})
				}
				
				agrume.statusBarStyle = .none
				agrume.showFrom(self)
			}
		}
	}
}
