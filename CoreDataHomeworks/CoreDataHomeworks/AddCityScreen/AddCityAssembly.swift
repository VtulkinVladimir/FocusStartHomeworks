//
//  AddCompanyAssembly.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit

final class AddCityAssembly
{
	static func build(storeManager: IStoreManager) -> IAddCityViewController {
		let router: IAddCityRouter = AddCityRouter()
		let view: IAddCityView = AddCityView()
		
		let presenter: IAddCityPresenter = AddCityPresenter(dependencies: .init(view: view, router: router, storeManager: storeManager))
		
		let viewController: IAddCityViewController = AddCityViewController(dependencies: .init(view: view, presenter: presenter))
		
		if let vc = viewController as? UIViewController {
			router.setCurrencyViewController(vc)
		}
		return viewController
	}
}
