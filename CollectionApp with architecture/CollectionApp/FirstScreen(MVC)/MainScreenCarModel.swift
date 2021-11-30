//
//  MainScreenCarModel.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 29.11.2021.
//
import UIKit

final class MainScreenCarModel
{
	let image: UIImage?
	let manufacturer: String
	let model: String
	let yearOfIssue: Int
	
	init(car: CarModel) {
		self.image = car.image
		self.manufacturer = car.manufacturer
		self.model = car.model
		self.yearOfIssue = car.yearOfIssue
	}
}
