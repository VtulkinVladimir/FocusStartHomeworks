//
//  DetailCompanyPresenter.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation


protocol IDetailCityPresenter: AnyObject
{
	func loadView()
	func set(_ city: CityModel)
}

final class DetailCityPresenter
{
	private weak var view: IDetailCityView?
	private let storeManager: IStoreManager
	private let router: IDetailCityRouter
	
	private var city: CityModel?
	
	struct Dependencies {
		let storemanager: IStoreManager
		let router: IDetailCityRouter
		let view: IDetailCityView
	}
	
	init(dependencies: Dependencies) {
		self.view = dependencies.view
		self.storeManager = dependencies.storemanager
		self.router = dependencies.router
	}
}

extension DetailCityPresenter: IDetailCityPresenter
{
	func loadView() {
		self.view?.configure()
		
	}
	func set(_ city: CityModel) {
		self.city = city
		self.view?.set(city: city)
//		self.view?.set(weatherImage: city.lastWeatherImage)
	}
}
