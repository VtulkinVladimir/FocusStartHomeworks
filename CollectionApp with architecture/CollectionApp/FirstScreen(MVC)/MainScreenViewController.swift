//
//  ViewController.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 18.11.2021.
//

import UIKit

final class MainScreenViewController: UIViewController
{
	private var cars = CarStorage()
	
	private lazy var ui: MainScreenView = {
		let view = MainScreenView()
		view.didTapCellHandler = {[weak self] index in
			self?.goToSecondScreen(index: index)
		}
		view.needCarOnIndexHandler = {[weak self] index in
			self?.returnCarOn(index: index)
		}
		
		view.needCountHandler = {[weak self] in
			return self?.cars.getCount()
		}
		return view
	}()

	override func loadView() {
		self.view = self.ui
		self.navigationItem.title = "Garage"
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.view.backgroundColor = .systemBackground
	}
	
	private func goToSecondScreen(index: Int) {
		let car = self.cars.getCarOn(index: index)
		let mvpCar = CarMVPModel(car: car)
		let vc = CarDetailViewController(car: mvpCar)
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	private func returnCarOn(index: Int) -> CarMVCModel {
		let car = self.cars.getCarOn(index: index)
		let carModel = CarMVCModel(car: car)
		return carModel
	}
}
