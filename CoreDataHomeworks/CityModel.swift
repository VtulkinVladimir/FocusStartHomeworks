//
//  EmployeeModel.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation

final class CityModel
{
	let name: String
	let woeId: Int
	let id: UUID
	var lastTemp: Int?
	
	var weather: WeatherModel?

	
	init(name: String, woeId: Int) {
		self.name = name
		self.woeId = woeId
		self.id = UUID()
	}
	
	init(city: City) {
		self.name = city.name
		self.woeId = Int(city.woeId)
		self.id = city.id
		if let temp = city.lastTemp {
			self.lastTemp = temp.intValue
		}
	}
}
