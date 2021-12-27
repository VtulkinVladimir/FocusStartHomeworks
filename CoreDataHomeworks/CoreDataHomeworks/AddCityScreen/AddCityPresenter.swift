//
//  AddCompanyPresenter.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit

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
	
	
	private var findCitys: [FindCityModel]?
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
	
	private func configureCell(at index: Int) -> UITableViewCell? {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "City")
		if let city = self.findCitys?[index] {
			cell.textLabel?.text = city.name
			return cell
		}
		return nil
	}
	
	private func findCity(request: String) {
		self.networkManager.getCityInfo(from: request) { result in
			switch result {
			case .failure(let error): print(error)
			case .success(let citys):
				let findCitys = citys.map { FindCityModel(dto: $0)}
				print("cast\(findCitys)")
				self.findCitys = findCitys
				DispatchQueue.main.async {
					self.view?.reloadData()
				}
			}
		}
	}
}

extension AddCityPresenter: IAddCityPresenter
{
	func loadView() {
		self.view?.searchButtonTapHandler = {[weak self] str in
//			self?.storeManager.addCompany(company: company)
//			self?.router.close()
			self?.findCity(request: str)
		}
		
		self.view?.configureCellHandler = {[weak self] index in
			self?.configureCell(at: index)
		}
		
		self.view?.numberOfRowHandler = {[weak self] in
			self?.findCitys?.count
		}
		
		self.view?.didTapCellHandler = {[weak self] index in
			guard let citys = self?.findCitys else { return }
			let city = citys[index]
			let cityModel = CityModel(findCity: city)
			self?.storeManager.addCity(city: cityModel)
			self?.router.close()
		}
		
		self.view?.configure()
	}
}
