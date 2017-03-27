//
//  AlbumsTableViewController+Datasource.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

extension AlbumsTableViewController {
	//DataSource
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return albums.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell") as? AlbumTableViewCell {
			let album = albums[indexPath.row]
			cell.config(with: album)
			return cell
		}
		return UITableViewCell()
	}
	
}
