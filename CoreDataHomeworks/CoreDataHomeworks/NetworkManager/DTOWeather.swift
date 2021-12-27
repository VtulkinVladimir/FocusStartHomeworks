//
//  WeatherDTO.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 25.12.2021.
//

import Foundation

// MARK: - Weather
struct DTOWeather: Codable {
	let consolidatedWeather: [DTOConsolidatedWeather]
	let time, sunRise, sunSet, timezoneName: String //время, восход, закат, временная зона

	enum CodingKeys: String, CodingKey {
		case consolidatedWeather = "consolidated_weather"
		case time
		case sunRise = "sun_rise"
		case sunSet = "sun_set"
		case timezoneName = "timezone_name"

	}
}

// MARK: - ConsolidatedWeather
struct DTOConsolidatedWeather: Codable {  //ПОГОДА
	let weatherStateName: String //описание погоды
	let weatherAbr : String //сокращение погоды, по ней берется картинка
	let windDirectionCompass: String //направление ветра в буквах
	let applicableDate: String //дата
	let minTemp: Double //температура
	let maxTemp: Double//температура
	let theTemp: Double//температура
	let windSpeed: Double //скорость ветра мили в час
	let airPressure: Double //давление в барах
	let humidity: Int //влажность
	let visibility: Double //видимость
	let predictability: Int //на сколько синоптики отвечают за базар

	enum CodingKeys: String, CodingKey {
		case weatherStateName = "weather_state_name"
		case windDirectionCompass = "wind_direction_compass"
		case applicableDate = "applicable_date"
		case minTemp = "min_temp"
		case maxTemp = "max_temp"
		case theTemp = "the_temp"
		case windSpeed = "wind_speed"
		case airPressure = "air_pressure"
		case weatherAbr = "weather_state_abbr"
		case humidity, visibility, predictability
	}
}


