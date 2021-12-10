//
//  CarModel.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 07.12.2021.
//

import UIKit

final class CarMVCModel
{
	let image: UIImage?
	let manufacturer: String
	let model: String
	let yearOfIssue: Int

	init(car: Car) {
		self.image = car.image
		self.manufacturer = car.manufacturer
		self.model = car.model
		self.yearOfIssue = car.yearOfIssue
	}
}
