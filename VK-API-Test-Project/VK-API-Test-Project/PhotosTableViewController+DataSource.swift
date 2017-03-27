//
//  PhotosTableViewController+DataSource.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

extension PhotosTableViewController {
	//DataSource
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return photos.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell") as? PhotoTableViewCell {
			let photo = photos[indexPath.row]
			cell.config(with: photo)
			return cell
		}
		return UITableViewCell()
	}
}
