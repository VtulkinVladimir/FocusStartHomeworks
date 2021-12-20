//
//  CarsModel.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//

protocol IManufacturersModel
{
	func getManufacturer(index: Int) -> Manufacturer
	func getCount() -> Int
}

final class ManufacturersModel
{
	private let cars = CarStorage.data
	private var manufacturers: [Manufacturer]
	
	init() {
		var manufacturers = [Manufacturer]()
		self.cars.forEach { car in
			let brand = car.manufacturer
			if manufacturers.contains(brand) == false {
				manufacturers.append(brand)
			}
		}
		self.manufacturers = manufacturers
	}
}

extension ManufacturersModel: IManufacturersModel
{
	func getManufacturer(index: Int) -> Manufacturer {
		self.manufacturers[index]
	}
	
	func getCount() -> Int {
		return self.manufacturers.count
	}
}
