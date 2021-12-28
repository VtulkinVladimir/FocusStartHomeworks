//
//  AddCompanyViewController.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit

protocol IAddCityViewController: UIViewController
{
	
}

final class AddCityViewController: UIViewController
{
	private let ui: IAddCityView
	private let presenter: IAddCityPresenter
	
	struct Dependencies
	{
		let view: IAddCityView
		let presenter: IAddCityPresenter
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


extension AddCityViewController: IAddCityViewController
{
	
}
