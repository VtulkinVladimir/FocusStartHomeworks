//
//  SceneDelegate.swift
//  URLTableView
//
//  Created by Владимир Втулкин on 13.12.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	let networkServices: INetworkServices = NetworkServices()

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)
		self.window = window
		window.rootViewController = URLViewController(network: self.networkServices)
		window.makeKeyAndVisible()
	}
}

