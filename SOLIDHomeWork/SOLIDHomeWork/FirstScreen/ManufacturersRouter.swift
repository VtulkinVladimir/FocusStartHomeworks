//
//  CarsRouter.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//

import UIKit

protocol IManufacturersRouter
{
	func set(currentViewController: IManufacturersViewController)
	func set(targetViewController: ICarsViewController)
	func next(with manufacturer: Manufacturer)
}

final class ManufacturersRouter
{
	private var currentController: IManufacturersViewController?
	private var targetController:  ICarsViewController?
	
}

extension ManufacturersRouter: IManufacturersRouter
{
	func next(with manufacturer: Manufacturer) {
		guard let targetController = self.targetController else { return }
		targetController.setManufacturer(manufacturer: manufacturer)
		
		guard let target = targetController as? UIViewController else { return }
		self.currentController?.navController?.pushViewController(target, animated: true)
	}
	
	func set(targetViewController: ICarsViewController) {
		self.targetController = targetViewController
	}
	
	func set(currentViewController: IManufacturersViewController) {
		self.currentController = currentViewController
	}
}
