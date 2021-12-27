//
//  DetailCompanyViewController.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit

protocol IDetailCityVC
{
	func set(city: CityModel)
}

final class DetailCityViewController: UIViewController
{
	private let ui: IDetailCityView
	private let presenter: IDetailCityPresenter
	
	struct Dependencies
	{
		let view: IDetailCityView
		let presenter: IDetailCityPresenter
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

extension DetailCityViewController: IDetailCityVC
{
	func set(city: CityModel) {
		self.presenter.set(city)
	}
}
