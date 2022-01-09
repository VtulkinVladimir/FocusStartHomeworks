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
        let storeManager: IStoreManager = StoreManager()

		let router: ICityRouter = CityRouter(storemanager: storeManager)
		
		let networkManager: INetworkManager = NetworkManager()
    
		
		
		
		let presenter: ICityPresenter = CityPresenter(dependencies: .init(view: view, storeManager: storeManager, router: router, networkManager: networkManager))
		
		let viewController = CityViewController(dependencies: .init(view: view, presenter: presenter))
		
		router.setCurrentViewController(viewController)
    
		
		return viewController
	}
}
