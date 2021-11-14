//
//  test.swift
//  MyCV
//
//  Created by Владимир Втулкин on 12.11.2021.
//

import UIKit

class MainTabBar: UITabBarController
{
	override func viewDidLoad() {
		self.tabBar.backgroundColor = .orange

		let infoVc = InfoViewController(nibName: nil, bundle: nil)
		let item = UITabBarItem(title: "Info", image: nil, tag: 1)
		infoVc.tabBarItem = item
		
		let skillsVc = SkillsViewController(nibName: nil, bundle: nil)
		let item2 = UITabBarItem(title: "Skills", image: nil, tag: 2)
		skillsVc.tabBarItem = item2
		
		let hobbysVc = HobbysViewController(nibName: nil, bundle: nil)
		let item3 = UITabBarItem(title: "Hobbys", image: nil, tag: 3)
		hobbysVc.tabBarItem = item3
		
		let controllers = [infoVc, skillsVc, hobbysVc]
		self.viewControllers = controllers
	}
}
