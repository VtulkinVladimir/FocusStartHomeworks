//
//  SceneDelegate.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)
		self.window = window
		
		let carsVC = ManufacturersAssembly.build()
		window.rootViewController = UINavigationController(rootViewController: carsVC)
		window.makeKeyAndVisible()
	}
}

