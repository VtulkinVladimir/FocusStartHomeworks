//
//  test.swift
//  MyCV
//
//  Created by Владимир Втулкин on 12.11.2021.
//

import UIKit

final class MainTabBar: UITabBarController
{
	override func viewDidLoad() {
		self.tabBar.backgroundColor = .orange

		let infoVc = InfoViewController()
		let item = UITabBarItem(title: nil, image: UIImage(named: "InfoLogo"), tag: 1)
		infoVc.tabBarItem = item
		
		let skillsVc = SkillsViewController()
		let item2 = UITabBarItem(title: nil, image: UIImage(named: "SkillsLogo"), tag: 2)
		skillsVc.tabBarItem = item2
		
		let hobbysVc = HobbysViewController()
		let item3 = UITabBarItem(title: nil, image: UIImage(named: "HobbysLogo"), tag: 3)
		hobbysVc.tabBarItem = item3
		
		let controllers = [infoVc, skillsVc, hobbysVc]
		self.viewControllers = controllers
	}
}
