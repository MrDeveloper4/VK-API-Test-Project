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
	func userAlbumPhotos(_ albumId: Int, completion: @escaping UserAlbumPhotosCompletion)
}

typealias UserInfoCompletion = (_ user: User?, _ errorDescr: String?) -> ()
typealias UserAlbumsCompletion = (_ albums: [Album]?, _ errorDescr: String?) -> ()
typealias UserAlbumPhotosCompletion = (_ photos: [Image]?, _ errorDescr: String?) -> ()

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
	
	func userAlbumPhotos(_ albumId: Int, completion: @escaping UserAlbumPhotosCompletion) {
		VK.API.Photos.get([VK.Arg.albumId : String(albumId), VK.Arg.photoSizes : "1"]).send(onSuccess: { (json) in
			var photos = [Image]()
			
			for i in 0..<json["count"].intValue {
				photos.append(self.calculation(at: i, json: json["items"][i]))
			}
			completion(photos, nil)
		}, onError: { error in
			completion(nil, error.localizedDescription)
		}, onProgress: nil)
	}
	
	fileprivate func calculation(at index: Int, json: JSON) -> Image {
		let image = Image()
		for (_, sizeJson) in json["sizes"] {
			if let imageLink = sizeJson["src"].string,
				let width = sizeJson["width"].int,
				let height = sizeJson["height"].int {
				
				if image.coverHeight == nil || image.imageHeight == nil {
					image.coverHeight = height
					image.imageHeight = height
					image.coverWidth = width
					image.imageWidth = width
					image.imageLink = imageLink
				}
				
				if image.coverArea > width * height {
					image.coverHeight = height
					image.coverWidth = width
					image.coverLink = imageLink
				}
				
				if image.imageArea < width * height {
					image.imageHeight = height
					image.imageWidth = width
					image.imageLink = imageLink
				}
			}
		}
		return image
	}
	
}
