//
//  CompanyAssembly.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 19.12.2021.
//

import UIKit

final class CityAssembly
{
	static func build() -> UIViewController {
		let view: ICityView = CityView()
		let router: ICityRouter = CityRouter()
		
		let storeManager: IStoreManager = StoreManager()
		let networkManager: INetworkManager = NetworkManager()
		
		///Temp
//		let cityLondon = CityModel(name: "London", woeId: 44418)
//		let citySanFrancisco = CityModel(name: "San Francisco", woeId: 2487956)
//		let cityMoscow = CityModel(name: "Moscow", woeId: 2122265)

//		storeManager.addCity(city: cityLondon)
//		storeManager.addCity(city: citySanFrancisco)
//		storeManager.addCity(city: cityMoscow)

		///Temp
		
		
		
		let presenter: ICityPresenter = CityPresenter(dependencies: .init(view: view, storeManager: storeManager, router: router, networkManager: networkManager))
		
		let viewController = CityViewController(dependencies: .init(view: view, presenter: presenter))
		
		router.setCurrentViewController(viewController)
		
		let nextVC = DetailCityAssembly.build(storeManager: storeManager)
		router.setNextViewController(nextVC)
		
		let addCompanyVC = AddCityAssembly.build(storeManager: storeManager)
		router.setAddCompanyViewController(addCompanyVC)
		
		return viewController
	}
}
