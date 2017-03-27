//
//  ReachabilityManager.swift
//  VK-API-Test-Project
//
//  Created by Yurii Chukhlib on 27.03.17.
//  Copyright © 2017 Yuri Chukhlib. All rights reserved.
//

import SystemConfiguration

class ReachabilityManager {
	func isConnectedToNetwork() -> Bool {
		var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
		zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
		zeroAddress.sin_family = sa_family_t(AF_INET)
		
		let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
			$0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
				SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
			}
		}
		
		var flags: SCNetworkReachabilityFlags = []
		if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
			return false
		}
		
		let isReachable = flags.contains(.reachable)
		let needsConnection = flags.contains(.connectionRequired)
		
		return isReachable && !needsConnection
	}
}
