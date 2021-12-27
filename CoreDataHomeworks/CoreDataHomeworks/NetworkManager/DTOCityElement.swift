//
//  City.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 25.12.2021.
//

import Foundation

struct DTOCityElement: Codable {
	let title: String
	let locationType: LocationType
	let woeid: Int
	let lattLong: String

	enum CodingKeys: String, CodingKey {
		case title
		case locationType = "location_type"
		case woeid
		case lattLong = "latt_long"
	}
}

enum LocationType: String, Codable {
	case city = "City"
}

typealias DTOCity = [DTOCityElement]
