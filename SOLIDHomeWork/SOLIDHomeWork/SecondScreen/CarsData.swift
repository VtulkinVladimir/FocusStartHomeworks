//
//  CarsModel.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 07.12.2021.
//
import UIKit

protocol ICarsData
{
	func getCar(manufacturer: Manufacturer, body: BodyType) -> CarModel?
}

final class CarsData
{
	private let cars = CarStorage.data
}

extension CarsData: ICarsData
{
	func getCar(manufacturer: Manufacturer, body: BodyType) -> CarModel? {
		var cars = [Car]()
		
		for car in self.cars {
			if car.manufacturer == manufacturer {
				cars.append(car)
			}
		}
				
		for car in cars {
			if car.body == body {
				return CarModel(car: car)
			}
		}
		return nil
	}
}

final class CarModel
{
	let image: UIImage?
	let manufacturer: String
	let price: Int
	let body: String
	
	init(car: Car) {
		self.image = car.image
		self.manufacturer = car.manufacturer.rawValue
		self.price = car.price
		self.body = car.body.rawValue
	}
}

