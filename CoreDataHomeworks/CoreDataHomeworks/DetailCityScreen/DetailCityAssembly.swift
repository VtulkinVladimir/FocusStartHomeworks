//
//  DetailCompanyAssembly.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit

final class DetailCityAssembly
{
	static func build(storeManager: IStoreManager) -> IDetailCityVC {
		let router: IDetailCityRouter = DetailCityRouter()
		let view: IDetailCityView = DetailCityView()
		
		let presenter: IDetailCityPresenter = DetailCityPresenter(dependencies: .init(storemanager: storeManager, router: router, view: view))
		
		let vc: IDetailCityVC = DetailCityViewController(dependencies: .init(view: view, presenter: presenter))
		
		return vc
	}
}
