//
//  CarMVPModel.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 08.12.2021.
//

import UIKit

final class CarMVPModel
{
	let image: UIImage?
	let manufacturer: String
	let model: String
	let yearOfIssue: Int
	let power: Int
	let price: Int
	let overlocking: Double
	
	init(car: Car) {
		self.image = car.image
		self.manufacturer = car.manufacturer
		self.model = car.model
		self.yearOfIssue = car.yearOfIssue
		self.power = car.power
		self.price = car.price
		self.overlocking = car.overlocking
	}
}
