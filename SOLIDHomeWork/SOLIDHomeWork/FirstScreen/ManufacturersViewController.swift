//
//  ViewController.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//

import UIKit

protocol IManufacturersViewController: AnyObject
{
	var navController: UINavigationController? { get }
}

final class ManufacturersViewController: UIViewController {
	
	struct Dependencies
	{
		let presenter: IManufacturersPresenter
		let view: IManufacturersView
	}
	
	private enum Names
	{
		static let navTitle = "Выберите марку машины"
	}
	
	var navController: UINavigationController?

	private	let presenter: IManufacturersPresenter
	private let ui: IManufacturersView
	
	override func loadView() {
		guard let nc = self.navigationController else { return }
		self.navController = nc
		
		self.navigationItem.title = Names.navTitle
		self.view = self.ui as? UIView
		self.presenter.loadView()
	}

	init(dependencies: Dependencies) {
		self.presenter = dependencies.presenter
		self.ui = dependencies.view
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ManufacturersViewController: IManufacturersViewController
{}
