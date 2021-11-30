//
//  CarDetailView.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 29.11.2021.
//

import UIKit
import SnapKit

protocol ICarDetailView: AnyObject
{
	var infoButtonTapHandler: (() -> Void)? { get set }
	func setContent(car: CarModel)
}

final class CarDetailView: UIView
{
	var infoButtonTapHandler: (() -> Void)?
	
	private let carImageView = UIImageView()
	private let yearLabel = UILabel()
	private let powerLabel = UILabel()
	private let overlockingLabel = UILabel()
	private let priceLabel = UILabel()
	private let infoButton = UIButton(type: .infoLight)
	private var screenSize = UIScreen.main.bounds

	private func configureView() {
		self.backgroundColor = .systemBackground
		
		self.addSubview(self.carImageView)
		self.carImageView.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.height.equalTo(self.screenSize.height * 0.5)
		}

		self.addSubview(self.yearLabel)
		self.yearLabel.font = .boldSystemFont(ofSize: TextSize.carDetailTextSize)
		self.yearLabel.snp.makeConstraints { maker in
			maker.top.equalTo(carImageView.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(20)
		}

		self.addSubview(self.powerLabel)
		self.powerLabel.font = .boldSystemFont(ofSize: TextSize.carDetailTextSize)
		self.powerLabel.snp.makeConstraints { maker in
			maker.top.equalTo(yearLabel.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(20)
		}

		self.addSubview(self.overlockingLabel)
		self.overlockingLabel.font = .boldSystemFont(ofSize: TextSize.carDetailTextSize)
		self.overlockingLabel.snp.makeConstraints { maker in
			maker.leading.equalToSuperview().offset(20)
			maker.top.equalTo(powerLabel.snp.bottom).offset(20)
		}

		self.addSubview(self.priceLabel)
		self.priceLabel.font = .boldSystemFont(ofSize: TextSize.carDetailTextSize)
		self.priceLabel.snp.makeConstraints { maker in
			maker.leading.equalToSuperview().offset(20)
			maker.top.equalTo(overlockingLabel.snp.bottom).offset(20)
		}

		self.addSubview(self.infoButton)
		self.infoButton.snp.makeConstraints { maker in
			maker.leading.equalTo(priceLabel.snp.trailing).offset(10)
			maker.centerY.equalTo(priceLabel.snp.centerY)
		}
	}
	
	@objc private func infoButtonTap() {
		self.infoButtonTapHandler?()
	}
}

extension CarDetailView: ICarDetailView
{
	func setContent(car: CarModel) {
		self.carImageView.image = car.image
		self.carImageView.translatesAutoresizingMaskIntoConstraints = false
		self.carImageView.contentMode = .scaleAspectFit
		
		self.yearLabel.text = "Model year: \(car.yearOfIssue)"
		self.yearLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.powerLabel.text = "Power: \(car.power) HP"
		self.powerLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.overlockingLabel.text = "0 - 100: \(car.overlocking) s."
		self.overlockingLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.priceLabel.text = "Start price: \(car.price) $"
		self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.infoButton.addTarget(self, action: #selector(self.infoButtonTap), for: .touchDown)
		self.configureView()
	}
}
