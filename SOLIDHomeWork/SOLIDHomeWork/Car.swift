//
//  Car.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//
import UIKit

struct Car
{
	let image: UIImage?
	let manufacturer: Manufacturer
	let price: Int
	let body: BodyType
}

enum BodyType: String
{
	case sedan = "Седан"
	case coupe = "Купе"
	case hatchback = "Хэтчбэк"
	case universal = "Универсал"
}

enum Manufacturer: String
{
	case ford = "Ford"
	case audi = "Audi"
	case mercedes = "Mercedes"
	case bmw = "Bmw"
	case honda = "Honda"
}
