//
//  CarDetailViewController.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 20.11.2021.
//

import UIKit

protocol ICarDetailViewController: AnyObject
{
	func presentPriceDetailViewController(price: Int)
}

final class CarDetailViewController: UIViewController
{
	private lazy var presenter: ICarDetailPresenter = CarDetailPresenter()
	private lazy var ui: ICarDetailView = CarDetailView()
		
	init(car: CarMVPModel) {
		super.init(nibName: nil, bundle: nil)
		self.presenter.set(car: car)
		self.set(title:"\(car.manufacturer) \(car.model)")
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		self.view = self.ui as? UIView
		self.presenter.didLoad(view: self.ui, controller: self)
	}
	
	private func set(title: String) {
		self.navigationItem.title = title
	}
}

extension CarDetailViewController : ICarDetailViewController
{
	func presentPriceDetailViewController(price: Int) {
		let vc = PriceDetailViewController(price: price)
		self.navigationController?.present(vc, animated: true, completion: nil)
	}
}
