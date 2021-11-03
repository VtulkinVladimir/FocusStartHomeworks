//
//  Car.swift
//  homework-1
//
//  Created by Владимир Втулкин on 28.10.2021.
//
enum Body: String, CaseIterable
{
	case sedan
	case coupe
	case universal
	case suv
	case hatcBack
	
	init?(index: Int) {
		for (indexEnumerated, value) in Self.allCases.enumerated() {
			if (indexEnumerated + 1) == index {
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
