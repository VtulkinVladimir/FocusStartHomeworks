//
//  CompanyPresenter.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 19.12.2021.
//

import Foundation
import UIKit

protocol ICityPresenter
{
	func loadView()
	func didTapAdd()
}

final class CityPresenter
{
	private weak var view: ICityView?
	private var storeManager: IStoreManager
	private var router: ICityRouter
	private var networkManager: INetworkManager
	
	private var citys = [CityModel]()
	
	struct Dependencies
	{
		let view: ICityView
		let storeManager: IStoreManager
		let router: ICityRouter
		let networkManager: INetworkManager
	}
	
	init(dependencies: Dependencies) {
		self.view = dependencies.view
		self.storeManager = dependencies.storeManager
		self.router = dependencies.router
		self.networkManager = dependencies.networkManager
		
		
		self.storeManager.notify = {[weak self] in
			self?.retriveCity()
		}
		self.retriveCity()
		
	}
	
	private func configureCell(at index: Int) -> UITableViewCell? {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "City")
		let city = self.citys[index]
		cell.textLabel?.text = city.name + " " + String(city.lastTemp ?? 0)
		return cell
	}
	
	private func retriveCity() {
		
		guard let citys = self.storeManager.retriveCity() else { return }
		self.citys = citys
		self.view?.reloadData()

	}
	
	private func detailCompanyScreen(index: Int) {
		
		let city = self.citys[index]

		
		self.responseInfo(city: city)
	}
	
	private func responseInfo(city: CityModel) {
		self.networkManager.getWeatherIn(cityId: city.woeId) { result in
			switch result {
			case .failure(let error): print(error)
			case .success(let weather):
				let weatherModel = WeatherModel(dto: weather)
				city.weather = weatherModel
				guard let todayWeather = weatherModel.consolidatedWeather.first else { return }
				city.lastTemp = todayWeather.theTemp
				
				self.downloadWeatherImage(city: city)
				
			
			}
		}
	}
	
	func downloadWeatherImage(city: CityModel) {
		guard let currentWeather = city.weather?.consolidatedWeather.first else {
			print("сосни")
			return }
			self.networkManager.getWeatherImage(weatherAbr: currentWeather.weatherAbr) { result in
				print(result)
				switch result {
				case .failure(let error): print(error)
				case .success(let data):
					print(data)
					currentWeather.weatherImage = data
					print("current \(city.weather?.consolidatedWeather.first?.weatherImage)")
//					DispatchQueue.main.async {
//	//					self.view?.reloadData()
//						self.storeManager.updateCity(in: city)
//						self.router.next(with: city)
//					}
					DispatchQueue.main.async {
						self.view?.reloadData()
						self.storeManager.updateCity(in: city)
						self.router.next(with: city)
						print("next \(city.weather?.consolidatedWeather.first?.weatherImage)")
					}
				}
			}
		
	}
	
	
	
}



extension CityPresenter: ICityPresenter
{
	func loadView() {
		self.view?.configureCellHandler = { [weak self] index in
			self?.configureCell(at: index)
		}
		
		self.view?.numberOfRowHandler = {[weak self] in
			self?.citys.count
		}
		
		self.view?.didTapCellHandler = {[weak self] index in
			self?.detailCompanyScreen(index: index)
		}
		
		self.view?.didDeleteCellHandler = {[weak self] index in
			guard let city = self?.citys[index] else { return }
			self?.storeManager.removeCity(city)
		}
		
		
		self.view?.configure()
	}
	
	func didTapAdd() {
		self.router.nextToAddCompany()
	}
}
