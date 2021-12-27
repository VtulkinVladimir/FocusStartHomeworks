//
//  FindCityModel.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 27.12.2021.
//

import Foundation

final class FindCityModel
{
	let name: String
	let woeId: Int
	
	init(dto: DTOCityElement) {
		self.name = dto.title
		self.woeId = dto.woeid
	}
}
