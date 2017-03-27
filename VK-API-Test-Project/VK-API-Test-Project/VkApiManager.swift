//
//  VkApiManager.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 26.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import UIKit
import SwiftyVK

protocol VkApiProtocol {
	func userInfo(completion: @escaping UserInfoCompletion)
	func userAlbums(completion: @escaping UserAlbumsCompletion)
}

typealias UserInfoCompletion = (_ user: User?, _ errorDescr: String?) -> ()
typealias UserAlbumsCompletion = (_ albums: [Album]?, _ errorDescr: String?) -> ()

class VkApiManager: VkApiProtocol {

	func userInfo(completion: @escaping UserInfoCompletion) {
		VK.API.Users.get([VK.Arg.fields : "photo_200"]).send(onSuccess: { (json) in
			let name = json[0]["first_name"].string ?? "Name"
			let surname = json[0]["last_name"].string ?? "Surname"
			let avatarLink = json[0]["photo_200"].string ?? nil
			let user = User(name, surname, avatarLink)
			completion(user, nil)
		}, onError: { error in
			completion(nil, error.localizedDescription)
		}, onProgress: nil)
	}
	
	func userAlbums(completion: @escaping UserAlbumsCompletion) {
		VK.API.Photos.getAlbums([VK.Arg.needCovers : "1"]).send(onSuccess: { (json) in
			var albums = [Album]()
			for i in 0..<json["count"].intValue {
				if let title = json["items"][i]["title"].string,
				   let descr = json["items"][i]["description"].string,
				   let coverLink = json["items"][i]["thumb_src"].string,
				   let id = json["items"][i]["id"].int,
				   let size = json["items"][i]["size"].int {
					
					let album = Album(title, descr, coverLink, id, size)
					albums.append(album)
				}
			}
			completion(albums, nil)
		}, onError: { error in
			completion(nil, error.localizedDescription)
		}, onProgress: nil)

	}
	
}
