//
//  PriceView.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 01.12.2021.
//

import UIKit
import SnapKit

protocol ISubscriberPrice
{
	func notify(price: Int)
}

final class PriceView: UIView
{
	var closeButtonTapHandler: (() -> Void)?
	private let dollarPricelabel = UILabel()
	private let rubPriceLabel = UILabel()
	private let eurPriceLabel = UILabel()
	private let closeButton = UIButton(type: .close)
	
	init() {
		super.init(frame: .zero)
		self.configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setContent(price: Int) {

		self.dollarPricelabel.text = "Dollars: \(Double(price))"
		self.dollarPricelabel.font = .boldSystemFont(ofSize: TextSize.priceDetailTextSize)
		self.dollarPricelabel.translatesAutoresizingMaskIntoConstraints = false

		self.rubPriceLabel.text = "Rubles: \(Double(price) * ExchengeRates.usdToRub)"
		self.rubPriceLabel.font = .boldSystemFont(ofSize: TextSize.priceDetailTextSize)
		self.rubPriceLabel.translatesAutoresizingMaskIntoConstraints = false

		self.eurPriceLabel.text = "Euros: \(Double(price) * ExchengeRates.usdToEuro)"
		self.eurPriceLabel.font = .boldSystemFont(ofSize: TextSize.priceDetailTextSize)
		self.eurPriceLabel.translatesAutoresizingMaskIntoConstraints = false

		self.closeButton.addTarget(self, action: #selector(self.tapCloseButton), for: .touchUpInside)
		self.closeButton.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func configureView() {
		self.backgroundColor = .systemBackground

		self.addSubview(self.dollarPricelabel)
		self.dollarPricelabel.snp.makeConstraints { maker in
			maker.centerY.equalToSuperview().offset(-50)
			maker.centerX.equalToSuperview()
		}

		self.addSubview(self.rubPriceLabel)
		self.rubPriceLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.dollarPricelabel.snp.bottom).offset(20)
			maker.centerX.equalToSuperview()
		}

		self.addSubview(self.eurPriceLabel)
		self.eurPriceLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.rubPriceLabel.snp.bottom).offset(20)
			maker.centerX.equalToSuperview()
		}

		self.addSubview(self.closeButton)
		self.closeButton.snp.makeConstraints { maker in
			maker.top.equalToSuperview().offset(20)
			maker.leading.equalToSuperview().offset(20)
		}
	}
	
	@objc private func tapCloseButton() {
		self.closeButtonTapHandler?()
	}
}

extension PriceView: ISubscriberPrice
{
	func notify(price: Int) {
		self.setContent(price: price)
	}
}
