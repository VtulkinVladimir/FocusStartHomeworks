//
//  CarsPresenter.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 07.12.2021.
//
import Foundation

protocol ICarsPresenter: AnyObject
{
	func loadView()
	func setManufacturer(manufacturer: Manufacturer)
}

final class CarsPresenter
{
	private weak var view: ICarsView?
	
	private let model: ICarsData
	
	private var manufacturer: Manufacturer?
	
	struct Dependencies
	{
		let view: ICarsView
		let model: ICarsData
	}
	
	init(dependencies: Dependencies) {
		self.view = dependencies.view
		self.model = dependencies.model
	}
	
	private func resetCarOnView(body: String){
		self.view?.startLoading()
		guard let manufacturer = self.manufacturer else { return }
		guard let bodyTupe = BodyType(rawValue: body) else { return }
		guard let car = self.model.getCar(manufacturer: manufacturer, body: bodyTupe) else { return }
		
		DispatchQueue.main.async {
			sleep(2)
			self.view?.setContent(car: car)
		}
	}
	
}

extension CarsPresenter: ICarsPresenter
{
	func loadView() {
		self.view?.configure()
		
		self.view?.rebuildViewHandler = {[weak self] body in
			self?.resetCarOnView(body: body)
		}
	}

	func setManufacturer(manufacturer: Manufacturer) {
		self.manufacturer = manufacturer
		self.resetCarOnView(body: BodyType.sedan.rawValue)
	}
}
