//
//  SceneDelegate.swift
//  MyCV
//
//  Created by Владимир Втулкин on 12.11.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)
		self.window = window
		
		window.rootViewController =  MainTabBar()
		window.makeKeyAndVisible()
	}
}

