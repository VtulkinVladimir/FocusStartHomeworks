//
//  CarDetailViewController.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 20.11.2021.
//

import UIKit
import SnapKit

final class CarDetailViewController: UIViewController
{
	private let carImageView = UIImageView()
	private let yearLabel = UILabel()
	private let powerLabel = UILabel()
	private let overlockingLabel = UILabel()
	private let priceLabel = UILabel()
	private let infoButton = UIButton(type: .infoLight)
	private let textSize: CGFloat = TextSize.carDetailTextSize
	private var screenSize = UIScreen.main.bounds
	
	
	private var car: Car
	
	init(car: Car) {
		self.car = car
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		self.navigationItem.title = "\(self.car.manufacturer) \(self.car.model)"
		self.setContent()
		self.configureView()
	}
	
	@objc func presentPriceDetailViewController() {
		let vc = PriceDetailViewController(price: self.car.price)
		self.navigationController?.present(vc, animated: true, completion: nil)
	}
	
	private func setContent() {
		self.carImageView.image = self.car.image
		self.carImageView.translatesAutoresizingMaskIntoConstraints = false
		self.carImageView.contentMode = .scaleAspectFit
		
		self.yearLabel.text = "Model year: \(self.car.yearOfIssue)"
		self.yearLabel.font = .boldSystemFont(ofSize: self.textSize)
		self.yearLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.powerLabel.text = "Power: \(self.car.power) HP"
		self.powerLabel.font = .boldSystemFont(ofSize: self.textSize)
		self.powerLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.overlockingLabel.text = "0 - 100: \(self.car.overlocking) s."
		self.overlockingLabel.font = .boldSystemFont(ofSize: self.textSize)
		self.overlockingLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.priceLabel.text = "Start price: \(self.car.price) $"
		self.priceLabel.font = .boldSystemFont(ofSize: self.textSize)
		self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.infoButton.addTarget(self, action: #selector(self.presentPriceDetailViewController), for: .allTouchEvents)
	}
	
	private func configureView() {
		self.view.backgroundColor = .systemBackground
		
		if self.screenSize.height > self.screenSize.width {
			self.configureVerticalView()
		} else {
			self.configureHorizontalView()
		}
	}
	
	private func configureVerticalView() {

		self.view.addSubview(self.carImageView)
		self.carImageView.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.height.equalTo(self.screenSize.height * 0.5)
		}

		self.view.addSubview(self.yearLabel)
		self.yearLabel.snp.makeConstraints { maker in
			maker.top.equalTo(carImageView.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(20)
		}

		self.view.addSubview(self.powerLabel)
		self.powerLabel.snp.makeConstraints { maker in
			maker.top.equalTo(yearLabel.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(20)
		}

		self.view.addSubview(self.overlockingLabel)
		self.overlockingLabel.snp.makeConstraints { maker in
			maker.leading.equalToSuperview().offset(20)
			maker.top.equalTo(powerLabel.snp.bottom).offset(20)
		}

		self.view.addSubview(self.priceLabel)
		self.priceLabel.snp.makeConstraints { maker in
			maker.leading.equalToSuperview().offset(20)
			maker.top.equalTo(overlockingLabel.snp.bottom).offset(20)
		}

		self.view.addSubview(self.infoButton)
		self.infoButton.snp.makeConstraints { maker in
			maker.leading.equalTo(priceLabel.snp.trailing).offset(10)
			maker.centerY.equalTo(priceLabel.snp.centerY)
		}
	}
	
	private func configureHorizontalView() {

		self.view.addSubview(self.carImageView)
		self.carImageView.snp.makeConstraints { maker in
			maker.height.equalTo(self.screenSize.height * 0.5)
			maker.centerX.equalToSuperview()
			maker.top.equalToSuperview().offset(40)
		}

		self.view.addSubview(self.yearLabel)
		self.yearLabel.font = .boldSystemFont(ofSize: self.textSize + 15)
		self.yearLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.carImageView.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(20)
		}

		self.view.addSubview(self.powerLabel)
		self.powerLabel.font = .boldSystemFont(ofSize: self.textSize + 15)
		self.powerLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.yearLabel.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(20)
		}

		self.view.addSubview(self.overlockingLabel)
		self.overlockingLabel.font = .boldSystemFont(ofSize: self.textSize + 15)
		self.overlockingLabel.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.yearLabel.snp.centerY)
			maker.trailing.equalToSuperview().offset(-30)
		}

		self.view.addSubview(self.infoButton)
		self.infoButton.snp.makeConstraints { maker in
			maker.trailing.equalToSuperview().offset(-10)
			maker.centerY.equalTo(self.powerLabel.snp.centerY)
		}

		self.view.addSubview(self.priceLabel)
		self.priceLabel.font = .boldSystemFont(ofSize: self.textSize + 15)
		self.priceLabel.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.powerLabel.snp.centerY)
			maker.trailing.equalTo(self.infoButton.snp.leading).offset(-10)
		}
	}
}
