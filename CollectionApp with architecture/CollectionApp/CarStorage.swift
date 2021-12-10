//
//  CarStorage.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 07.12.2021.
//
import UIKit

final class CarStorage
{
	private let data = [
		Car(image: UIImage(named: "HondaCivic6"),
				 manufacturer: "Honda",
				 model: "Civic",
				 yearOfIssue: 1996,
				 power: 160,
				 price: 17000,
				 overlocking: 6.6),
		Car(image: UIImage(named: "Lada"),
				 manufacturer: "Lada",
				 model: "2108",
				 yearOfIssue: 1986,
				 power: 53,
				 price: 500,
				 overlocking: 12.3),
		Car(image: UIImage(named: "murcielago"),
				 manufacturer: "Lamborghini",
				 model: "Murcielago",
				 yearOfIssue: 2001,
				 power: 580,
				 price: 205000,
				 overlocking: 3.9),
		Car(image: UIImage(named: "NissanSkyline32"),
				 manufacturer: "Nissan",
				 model: "Skyline",
				 yearOfIssue: 1989,
				 power: 280,
				 price: 35000,
				 overlocking: 5.3),
		Car(image: UIImage(named: "NissanSkyline34"),
				 manufacturer: "Nissan",
				 model: "Skyline",
				 yearOfIssue: 1998,
				 power: 280,
				 price: 40000,
				 overlocking: 4.9),
		Car(image: UIImage(named:"Porsche911(964)"),
				 manufacturer: "Porsche",
				 model: "911(964)",
				 yearOfIssue: 1989,
				 power: 250,
				 price: 70000,
				 overlocking: 6.4),
		Car(image: UIImage(named:"Porsche911(996)"),
				 manufacturer: "Porsche",
				 model: "911(996)",
				 yearOfIssue: 1998,
				 power: 270,
				 price: 75000,
				 overlocking: 6.0),
		Car(image: UIImage(named: "PorschePanamera"),
				 manufacturer: "Porsche",
				 model: "Panamera",
				 yearOfIssue: 2018,
				 power: 330,
				 price: 130000,
				 overlocking: 4.0),
		Car(image: UIImage(named: "RangeRover4"),
				 manufacturer: "Land Rover",
				 model: "Range Rover",
				 yearOfIssue: 2017,
				 power: 350,
				 price: 200000,
				 overlocking: 8.5),
		Car(image: UIImage(named: "BmwF30"),
				 manufacturer: "BMW",
				 model: "330",
				 yearOfIssue: 2014,
				 power: 250,
				 price: 70000,
				 overlocking: 6.0)]
	
	func getCarOn(index: Int) -> Car {
		return self.data[index]
	}
	
	func getCount() -> Int {
		return self.data.count
	}
}
