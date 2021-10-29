//
//  Car.swift
//  homework-1
//
//  Created by Владимир Втулкин on 28.10.2021.
//
enum Body: String
{
	case sedan
	case coupe
	case universal
	case suv
	case hatcBack
}

struct Car
{
	let manufacturer: String
	let model: String
	let body: Body
	let yearOfIssue: Int?
	let number: String?
	
}
