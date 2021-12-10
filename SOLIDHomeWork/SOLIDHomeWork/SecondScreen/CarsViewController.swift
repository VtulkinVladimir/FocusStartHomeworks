//
//  CarsViewController.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 07.12.2021.
//

import UIKit
protocol ICarsViewController: AnyObject
{
	func setManufacturer(manufacturer: Manufacturer)

}

final class CarsViewController: UIViewController {
	
	private let ui: ICarsView
	private let presenter: ICarsPresenter
	
	struct Dependencies
	{
		let view: ICarsView
		let presenter: ICarsPresenter
	}
	
	init(dependencies: Dependencies) {
		self.ui = dependencies.view
		self.presenter = dependencies.presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = self.ui as? UIView
		self.presenter.loadView()
	}
}

extension CarsViewController: ICarsViewController
{
	func setManufacturer(manufacturer: Manufacturer) {
		self.presenter.setManufacturer(manufacturer: manufacturer)
	}
}
