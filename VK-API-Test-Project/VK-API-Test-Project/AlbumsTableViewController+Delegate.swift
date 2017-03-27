//
//  AlbumsTableViewController+Delegate.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit

extension AlbumsTableViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedAlbum = albums[indexPath.row]
		performSegue(withIdentifier: "toPhotosSegue", sender: self)
	}
}
