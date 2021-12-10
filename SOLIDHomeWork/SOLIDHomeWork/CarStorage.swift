//
//  CarStorage.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//

import UIKit

final class CarStorage
{
	static let data = [
		Car(image: UIImage(named: "FordSedan"), manufacturer: .ford, price: 1000, body: .sedan),
		Car(image: UIImage(named: "FordCoupe"), manufacturer: .ford, price: 1500, body: .coupe),
		Car(image: UIImage(named: "FordHatchback"), manufacturer: .ford, price: 1200, body: .hatchback),
		Car(image: UIImage(named: "FordUniversal"), manufacturer: .ford, price: 1400, body: .universal),
		
		Car(image: UIImage(named: "AudiSedan"), manufacturer: .audi, price: 2000, body: .sedan),
		Car(image: UIImage(named: "AudiCoupe"), manufacturer: .audi, price: 2500, body: .coupe),
		Car(image: UIImage(named: "AudiHatchback"), manufacturer: .audi, price: 2200, body: .hatchback),
		Car(image: UIImage(named: "AudiUniversal"), manufacturer: .audi, price: 2400, body: .universal),
		
		Car(image: UIImage(named: "MercedesSedan"), manufacturer: .mercedes, price: 3000, body: .sedan),
		Car(image: UIImage(named: "MercedesCoupe"), manufacturer: .mercedes, price: 3500, body: .coupe),
		Car(image: UIImage(named: "MercedesHatchback"), manufacturer: .mercedes, price: 3200, body: .hatchback),
		Car(image: UIImage(named: "MercedesUniversal"), manufacturer: .mercedes, price: 3400, body: .universal),
		
		Car(image: UIImage(named: "BmwSedan"), manufacturer: .bmw, price: 4000, body: .sedan),
		Car(image: UIImage(named: "BmwCoupe"), manufacturer: .bmw, price: 4500, body: .coupe),
		Car(image: UIImage(named: "BmwHatchback"), manufacturer: .bmw, price: 4200, body: .hatchback),
		Car(image: UIImage(named: "BmwUniversal"), manufacturer: .bmw, price: 4400, body: .universal),
		
		Car(image: UIImage(named: "HondaSedan"), manufacturer: .honda, price: 1500, body: .sedan),
		Car(image: UIImage(named: "HondaCoupe"), manufacturer: .honda, price: 1900, body: .coupe),
		Car(image: UIImage(named: "HondaHatchback"), manufacturer: .honda, price: 1800, body: .hatchback),
		Car(image: UIImage(named: "HondaUniversal"), manufacturer: .honda, price: 1700, body: .universal),
]
}
