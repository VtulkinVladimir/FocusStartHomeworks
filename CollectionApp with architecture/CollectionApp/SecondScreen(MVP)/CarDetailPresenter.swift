//
//  CarDetailPresenter.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 29.11.2021.
//

final class CarDetailPresenter
{
	private var car: CarModel?
	private weak var view: ICarDetailView?
	private weak var controller: CarDetailViewController?
	
	func set(car: CarModel) {
		self.car = car
	}
	
	func didLoad(view: ICarDetailView, controller: CarDetailViewController) {
		self.view = view
		self.controller = controller
		self.configureView()
	}
	
	func configureView() {
		guard let car = self.car else { return }
		self.view?.setContent(car: car)
		self.view?.infoButtonTapHandler = {[weak self] in
			self?.goToThirdScreen()
		}
	}
	
	func goToThirdScreen() {
		guard let car = self.car else { return }
		self.controller?.presentPriceDetailViewController(price: car.price)
	}
}
