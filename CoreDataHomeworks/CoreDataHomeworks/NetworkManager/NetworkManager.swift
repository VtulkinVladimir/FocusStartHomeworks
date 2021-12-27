//
//  NetworkManager.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 25.12.2021.
//

import Foundation
protocol INetworkManager
{
	func getCityInfo(from city: String, completion: @escaping ((Result<DTOCity,Error>)-> Void))
	func getWeatherIn(cityId: Int, completion: @escaping ((Result<DTOWeather, Error>) -> Void))
	func getWeatherImage(weatherAbr: String, completion: @escaping ((Result<Data, Error>) -> Void))
}

final class NetworkManager
{
	private let session = URLSession(configuration: .default)
	private let weatherUrl = "https://www.metaweather.com/api/location/"
	private let weatherImageUrl = "https://www.metaweather.com/static/img/weather/png/64/"
	private let searchCityUrl = "https://www.metaweather.com/api/location/search/?query="
}

extension NetworkManager: INetworkManager
{
	func getCityInfo(from city: String, completion: @escaping ((Result<DTOCity,Error>)-> Void)) {
//		let searchUrl = "https://www.metaweather.com/api/location/search/?query="
		let fullSearchUrl = self.searchCityUrl + city
		guard let url = URL(string: fullSearchUrl) else { return }
		
		let request = URLRequest(url: url)
		
		self.session.dataTask(with: request) { data, response, error in
			guard let data = data else { return }
			
			do {
				let result = try JSONDecoder().decode(DTOCity.self, from: data)
				completion(.success(result))
//				print("network \(result)")
			}
			catch {
				
				print(error)
			}
		}.resume()
		
		
	}
	
	
	func getWeatherIn(cityId: Int, completion: @escaping ((Result<DTOWeather, Error>) -> Void)) {
		let stringUrl = self.weatherUrl + String(cityId)
		guard let url = URL(string: stringUrl) else { return }
		let request = URLRequest(url: url)
		
		self.session.dataTask(with: request) { data, response, error in
			guard let data = data else { return }
			
			do {
				let result = try JSONDecoder().decode(DTOWeather.self, from: data)
				completion(.success(result))
			}
			catch {
				completion(.failure(error))
			}
		}.resume()
	}
	
	func getWeatherImage(weatherAbr: String, completion: @escaping ((Result<Data, Error>) -> Void)) {
		let strUrl = self.weatherImageUrl + weatherAbr + ".png"
		guard let url = URL(string: strUrl) else { return }
		let request = URLRequest(url: url)
		
		self.session.downloadTask(with: request) { url, response, error in
			guard let url = url else {
				print("нихуя идем домой")
				return }
			
			do {
				let data = try Data(contentsOf: url)
//				print(data)
				completion(.success(data))
				
			}
			catch {
				print(error)
				completion(.failure(error))
				
			}
		}.resume()
	}
}
