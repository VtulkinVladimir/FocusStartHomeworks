//
//  Car.swift
//  homework-1
//
//  Created by Владимир Втулкин on 28.10.2021.
//
enum Body: String, CaseIterable
{
	case sedan = "Седан"
	case coupe = "Купе"
	case universal = "Универсал"
	case suv = "Джип"
	case hatcBack = "Хэтчбэк"
	
	init?(index: Int) {
		for (indexEnumerated, value) in Self.allCases.enumerated() {
			if (indexEnumerated) == index {
				self = value
				return
			}
		}
		return nil
	}
}

struct Car
{
	let manufacturer: String
	let model: String
	let body: Body
	let yearOfIssue: Int?
	let number: String?
	
}
