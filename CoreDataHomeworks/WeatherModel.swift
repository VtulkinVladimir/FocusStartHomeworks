//
//  WeatherModel.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 25.12.2021.
//

import Foundation

final class WeatherModel
{
	let consolidatedWeather: [ConsolidatedWeather]
	let time: String
	let sunRise: String
	let sunSet: String
	let timezoneName: String
	
	init(dto: DTOWeather) {
		self.time = dto.time
		self.sunRise = dto.sunRise
		self.sunSet = dto.sunSet
		self.timezoneName = dto.timezoneName
		self.consolidatedWeather = dto.consolidatedWeather.map({ ConsolidatedWeather(dto: $0)
		})
	}
}

final class ConsolidatedWeather
{
	let weatherStateName: String
	let weatherAbr: String
	let windDirectionCompass: String
	let applicableDate: String
	let minTemp: Int
	let maxTemp: Int
	let theTemp: Int
	let windSpeed: Int
	let airPressure: Int
	let humidity: Int
	let visibility: Int
	let predictability: Int
	var weatherImage: Data?
	
	init(dto: DTOConsolidatedWeather) {
		self.weatherStateName = dto.weatherStateName
		self.weatherAbr = dto.weatherAbr
		self.windDirectionCompass = dto.windDirectionCompass
		self.applicableDate = dto.applicableDate
		self.minTemp = Int(dto.minTemp)
		self.maxTemp = Int(dto.maxTemp)
		self.theTemp = Int(dto.theTemp)
		self.windSpeed = Int(dto.windSpeed)
		self.airPressure = Int(dto.airPressure)
		self.humidity = dto.humidity
		self.visibility = Int(dto.visibility)
		self.predictability = dto.predictability
	}
}
