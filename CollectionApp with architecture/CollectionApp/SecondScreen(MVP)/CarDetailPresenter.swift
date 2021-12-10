//
//  CarDetailPresenter.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 29.11.2021.
//
protocol ICarDetailPresenter
{
	func set(car: CarMVPModel)
	func didLoad(view: ICarDetailView, controller: ICarDetailViewController)
}

final class CarDetailPresenter
{
	private var car: CarMVPModel?
	private weak var view: ICarDetailView?
	private weak var controller: ICarDetailViewController?

	private func configureView() {
		guard let car = self.car else { return }
		self.view?.setContent(car: car)
		self.view?.infoButtonTapHandler = {[weak self] in
			self?.goToThirdScreen()
		}
	}
	
	private func goToThirdScreen() {
		guard let car = self.car else { return }
		self.controller?.presentPriceDetailViewController(price: car.price)
	}
}

extension CarDetailPresenter: ICarDetailPresenter
{
	func set(car: CarMVPModel) {
		self.car = car
	}
	
	func didLoad(view: ICarDetailView, controller: ICarDetailViewController) {
		self.view = view
		self.controller = controller
		self.configureView()
	}
}
