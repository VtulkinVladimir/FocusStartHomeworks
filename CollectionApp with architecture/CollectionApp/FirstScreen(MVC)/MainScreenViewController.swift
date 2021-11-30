//
//  ViewController.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 18.11.2021.
//

import UIKit

final class MainScreenViewController: UIViewController
{
	private var cars = CarModel.data
	
	private lazy var ui: MainScreenView = {
		let view = MainScreenView()
		view.didTapHandler = {[weak self] index in
			self?.goToSecondScreen(index: index)
		}
		return view
	}()

	override func loadView() {
		let carsM = self.transformationCar(cars: self.cars)
		self.ui.setCars(carsM)
		self.view = self.ui
		self.navigationItem.title = "Garage"
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.view.backgroundColor = .systemBackground
	}
	
	private func transformationCar(cars:[CarModel]) -> [MainScreenCarModel] {
		var viewCars = [MainScreenCarModel]()
		cars.forEach { car in
			let car = MainScreenCarModel(car: car)
			viewCars.append(car)
		}
		return viewCars
	}
	
	private func goToSecondScreen(index: Int) {
		let car = self.cars[index]
		let vc = CarDetailViewController(car: car)
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
