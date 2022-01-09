//
//  City.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 25.12.2021.
//

import Foundation

struct DTOCityElement: Codable {
	let title: String
	let woeid: Int
	let lattLong: String

	enum CodingKeys: String, CodingKey {
		case title
		case woeid
		case lattLong = "latt_long"
	}
}


typealias DTOCity = [DTOCityElement]
