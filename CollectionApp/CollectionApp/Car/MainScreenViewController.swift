//
//  ViewController.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 18.11.2021.
//

import UIKit

final class MainScreenViewController: UIViewController
{
	private var cars: [Car]?
	
	private lazy var collectionView: UICollectionView = {
		let flowLayout = CollectionViewFlowLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.alwaysBounceVertical = true
		collectionView.register(CarCollectionCell.self, forCellWithReuseIdentifier: CarCollectionCell.identifier)
		collectionView.delegate = self
		collectionView.dataSource = self
		
		return collectionView
	}()
	
	override func loadView() {
		self.addCars()
		self.view = self.collectionView
		self.navigationItem.title = "Garage"
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.view.backgroundColor = .systemBackground
	}
	
	private func addCars() {
		let honda = Car(image: UIImage(named: "HondaCivic6"),
						manufacturer: "Honda",
						model: "Civic",
						yearOfIssue: 1996,
						power: 160,
						price: 17000,
						overlocking: 6.6)
		
		let lada = Car(image: UIImage(named: "Lada"),
					   manufacturer: "Lada",
					   model: "2108",
					   yearOfIssue: 1986,
					   power: 53,
					   price: 500,
					   overlocking: 12.3)
		
		let lambo = Car(image: UIImage(named: "murcielago"),
						manufacturer: "Lamborghini",
						model: "Murcielago",
						yearOfIssue: 2001,
						power: 580,
						price: 205000,
						overlocking: 3.9)
		
		let sky32 = Car(image: UIImage(named: "NissanSkyline32"),
						manufacturer: "Nissan",
						model: "Skyline",
						yearOfIssue: 1989,
						power: 280,
						price: 35000,
						overlocking: 5.3)
		
		let sky34 = Car(image: UIImage(named: "NissanSkyline34"),
						manufacturer: "Nissan",
						model: "Skyline",
						yearOfIssue: 1998,
						power: 280,
						price: 40000,
						overlocking: 4.9)
		
		let p964 = Car(image: UIImage(named:"Porsche911(964)"),
					   manufacturer: "Porsche",
					   model: "911(964)",
					   yearOfIssue: 1989,
					   power: 250,
					   price: 70000,
					   overlocking: 6.4)
		
		let p996 = Car(image: UIImage(named:"Porsche911(996)"),
					   manufacturer: "Porsche",
					   model: "911(996)",
					   yearOfIssue: 1998,
					   power: 270,
					   price: 75000,
					   overlocking: 6.0)
		
		let panamera = Car(image: UIImage(named: "PorschePanamera"),
						   manufacturer: "Porsche",
						   model: "Panamera",
						   yearOfIssue: 2018,
						   power: 330,
						   price: 130000,
						   overlocking: 4.0)
		
		let range = Car(image: UIImage(named: "RangeRover4"),
						manufacturer: "Land Rover",
						model: "Range Rover",
						yearOfIssue: 2017,
						power: 350,
						price: 200000,
						overlocking: 8.5)
		
		let bmw = Car(image: UIImage(named: "BmwF30"),
					  manufacturer: "BMW",
					  model: "330",
					  yearOfIssue: 2014,
					  power: 250,
					  price: 70000,
					  overlocking: 6.0)

		self.cars = [honda, lada, lambo, sky32, sky34, p964, p996, panamera, range, bmw]
	}
}

extension MainScreenViewController: UICollectionViewDelegate
{
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let car = self.cars?[indexPath.row] else { return }
		let vc = CarDetailViewController(car: car)
		self.navigationController?.pushViewController(vc, animated: false)
	}
}

extension MainScreenViewController: UICollectionViewDataSource
{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let cars = self.cars else { return 0 }
		return cars.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarCollectionCell.identifier, for: indexPath) as! CarCollectionCell
		cell.car = self.cars?[indexPath.row]
		return cell
	}
}
