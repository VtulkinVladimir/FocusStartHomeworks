//
//  PriceDetailViewController.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 20.11.2021.
//

import UIKit
import SnapKit

final class PriceDetailViewController: UIViewController
{
	private let price: Int
	private let textSize: CGFloat = TextSize.priceDetailTextSize
	private let dollarPricelabel = UILabel()
	private let rubPriceLabel = UILabel()
	private let eurPriceLabel = UILabel()
	private let closeButton = UIButton(type: .close)

	init(price: Int) {
		self.price = price
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		self.setContent()
		self.configureView()
	}

	private func setContent() {

		self.dollarPricelabel.text = "Dollars: \(Double(self.price))"
		self.dollarPricelabel.font = .boldSystemFont(ofSize: self.textSize)
		self.dollarPricelabel.translatesAutoresizingMaskIntoConstraints = false

		self.rubPriceLabel.text = "Rubles: \(Double(self.price) * ExchengeRates.usdToRub)"
		self.rubPriceLabel.font = .boldSystemFont(ofSize: self.textSize)
		self.rubPriceLabel.translatesAutoresizingMaskIntoConstraints = false

		self.eurPriceLabel.text = "Euros: \(Double(self.price) * ExchengeRates.usdToEuro)"
		self.eurPriceLabel.font = .boldSystemFont(ofSize: self.textSize)
		self.eurPriceLabel.translatesAutoresizingMaskIntoConstraints = false

		let action = UIAction { [weak self] _ in
			self?.dismiss(animated: true, completion: nil)
		}
		self.closeButton.addAction(action, for: .allTouchEvents)
		self.closeButton.translatesAutoresizingMaskIntoConstraints = false
	}
	
	private func configureView() {
		self.view.backgroundColor = .systemBackground

		self.view.addSubview(self.dollarPricelabel)
		self.dollarPricelabel.snp.makeConstraints { maker in
			maker.centerY.equalToSuperview().offset(-50)
			maker.centerX.equalToSuperview()
		}

		self.view.addSubview(self.rubPriceLabel)
		self.rubPriceLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.dollarPricelabel.snp.bottom).offset(20)
			maker.centerX.equalToSuperview()
		}

		self.view.addSubview(self.eurPriceLabel)
		self.eurPriceLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.rubPriceLabel.snp.bottom).offset(20)
			maker.centerX.equalToSuperview()
		}

		self.view.addSubview(self.closeButton)
		self.closeButton.snp.makeConstraints { maker in
			maker.top.equalToSuperview().offset(20)
			maker.leading.equalToSuperview().offset(20)
		}
	}
}
