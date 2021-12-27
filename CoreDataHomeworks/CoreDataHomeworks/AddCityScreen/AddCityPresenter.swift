//
//  AddCompanyPresenter.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation

protocol IAddCityPresenter
{
	func loadView()
}

final class AddCityPresenter
{
	private weak var view: IAddCityView?
	private let storeManager: IStoreManager
	private let router: IAddCityRouter
	
	private let networkManager: INetworkManager = NetworkManager()
	
	struct Dependencies
	{
		let view: IAddCityView
		let router: IAddCityRouter
		let storeManager: IStoreManager
	}
	
	init(dependencies: Dependencies) {
		self.router = dependencies.router
		self.storeManager = dependencies.storeManager
		self.view = dependencies.view
	}
}

extension AddCityPresenter: IAddCityPresenter
{
	func loadView() {
		self.view?.searchButtonTapHandler = {[weak self] str in
//			self?.storeManager.addCompany(company: company)
//			self?.router.close()
			self?.networkManager.getCityInfo(from: str)
		}
		self.view?.configure()
	}
}
