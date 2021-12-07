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
	func setContent(car: CarMVPModel)
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
		self.addSubviews()
		self.configureSubview()
		self.makeConstraintsSubviews()
	}
	
	private func addSubviews() {
		self.addSubview(self.carImageView)
		self.addSubview(self.yearLabel)
		self.addSubview(self.powerLabel)
		self.addSubview(self.overlockingLabel)
		self.addSubview(self.priceLabel)
		self.addSubview(self.infoButton)
	}
	
	private func configureSubview() {
		self.yearLabel.font = .boldSystemFont(ofSize: TextSize.carDetailTextSize)
		self.powerLabel.font = .boldSystemFont(ofSize: TextSize.carDetailTextSize)
		self.overlockingLabel.font = .boldSystemFont(ofSize: TextSize.carDetailTextSize)
		self.priceLabel.font = .boldSystemFont(ofSize: TextSize.carDetailTextSize)
	}
	
	private func makeConstraintsSubviews() {
		self.carImageView.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.height.equalTo(self.screenSize.height * 0.5)
		}

		self.yearLabel.snp.makeConstraints { maker in
			maker.top.equalTo(carImageView.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(20)
		}

		self.powerLabel.snp.makeConstraints { maker in
			maker.top.equalTo(yearLabel.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(20)
		}
		
		self.overlockingLabel.snp.makeConstraints { maker in
			maker.leading.equalToSuperview().offset(20)
			maker.top.equalTo(powerLabel.snp.bottom).offset(20)
		}

		self.priceLabel.snp.makeConstraints { maker in
			maker.leading.equalToSuperview().offset(20)
			maker.top.equalTo(overlockingLabel.snp.bottom).offset(20)
		}

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
	func setContent(car: CarMVPModel) {
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
