//
//  Car.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 18.11.2021.
//
import UIKit

struct CarModel
{
	static let data = [
		CarModel(image: UIImage(named: "HondaCivic6"),
				 manufacturer: "Honda",
				 model: "Civic",
				 yearOfIssue: 1996,
				 power: 160,
				 price: 17000,
				 overlocking: 6.6),
		CarModel(image: UIImage(named: "Lada"),
				 manufacturer: "Lada",
				 model: "2108",
				 yearOfIssue: 1986,
				 power: 53,
				 price: 500,
				 overlocking: 12.3),
		CarModel(image: UIImage(named: "murcielago"),
				 manufacturer: "Lamborghini",
				 model: "Murcielago",
				 yearOfIssue: 2001,
				 power: 580,
				 price: 205000,
				 overlocking: 3.9),
		CarModel(image: UIImage(named: "NissanSkyline32"),
				 manufacturer: "Nissan",
				 model: "Skyline",
				 yearOfIssue: 1989,
				 power: 280,
				 price: 35000,
				 overlocking: 5.3),
		CarModel(image: UIImage(named: "NissanSkyline34"),
				 manufacturer: "Nissan",
				 model: "Skyline",
				 yearOfIssue: 1998,
				 power: 280,
				 price: 40000,
				 overlocking: 4.9),
		CarModel(image: UIImage(named:"Porsche911(964)"),
				 manufacturer: "Porsche",
				 model: "911(964)",
				 yearOfIssue: 1989,
				 power: 250,
				 price: 70000,
				 overlocking: 6.4),
		CarModel(image: UIImage(named:"Porsche911(996)"),
				 manufacturer: "Porsche",
				 model: "911(996)",
				 yearOfIssue: 1998,
				 power: 270,
				 price: 75000,
				 overlocking: 6.0),
		CarModel(image: UIImage(named: "PorschePanamera"),
				 manufacturer: "Porsche",
				 model: "Panamera",
				 yearOfIssue: 2018,
				 power: 330,
				 price: 130000,
				 overlocking: 4.0),
		CarModel(image: UIImage(named: "RangeRover4"),
				 manufacturer: "Land Rover",
				 model: "Range Rover",
				 yearOfIssue: 2017,
				 power: 350,
				 price: 200000,
				 overlocking: 8.5),
		CarModel(image: UIImage(named: "BmwF30"),
				 manufacturer: "BMW",
				 model: "330",
				 yearOfIssue: 2014,
				 power: 250,
				 price: 70000,
				 overlocking: 6.0)]
	
	let image: UIImage?
	let manufacturer: String
	let model: String
	let yearOfIssue: Int
	let power: Int
	let price: Int
	let overlocking: Double
}
