//
//  CarsView.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 07.12.2021.
//
import UIKit
import SnapKit

protocol ICarsView: AnyObject
{
	func setContent(car: CarModel)
	func configure()
	func startLoading()
	var rebuildViewHandler:((String) -> Void)? {get set}
}

final class CarsView: UIView
{
	var rebuildViewHandler:((String) -> Void)?
	
	private let imageView = UIImageView()
	private let priceLabel = UILabel()
	private let priceNumberLabel = UILabel()
	
	private let calculateButton = UIButton()
	
	private let sedanButton = UIButton()
	private let sedanLabel = UILabel()
	
	private let coupeButton = UIButton()
	private let coupeLabel = UILabel()
	
	private let universalButton = UIButton()
	private let universalLabel = UILabel()
	
	private let hatchbackButton = UIButton()
	private let hatchbackLabel = UILabel()
	
	private let activityIndicator = UIActivityIndicatorView()

	private lazy var buttons = [self.sedanButton, self.coupeButton, self.universalButton, self.hatchbackButton]
	
	private enum Names
	{
		static let calculateButtonTitle = "Рассчитать стоимость"
		static let priceLabelTitle = "Цена"
		static let sedanTitle = BodyType.sedan.rawValue
		static let coupeTitle = BodyType.coupe.rawValue
		static let universalTitle = BodyType.universal.rawValue
		static let hatchbackTitle = BodyType.hatchback.rawValue
	}
	
	private enum Metrics
	{
		static let fontSize: CGFloat = 30
		static let leadingOrTrailingMargin: CGFloat = 16
		static let buttonWidthAndHight: CGFloat = 16
		static let imageHeight: CGFloat = 200
		static let imageTopMargin: CGFloat = 80
		static let fromImageToPriceMargin: CGFloat = 25
		static let fromPriceToNumberMargin: CGFloat = 8
		static let fromPriceToBodysMargin: CGFloat = 70
		static let betweenBodyMargin: CGFloat = 30
		static let cornerRadius: CGFloat = 19
		static let calculateButtonBottom: CGFloat = 95
	}
	
	private func setStrongOptions() {
		self.calculateButton.setTitle(Names.calculateButtonTitle, for: .normal)
		self.calculateButton.backgroundColor = .systemGreen
		self.calculateButton.layer.cornerRadius = Metrics.cornerRadius
		self.calculateButton.clipsToBounds = true
		self.calculateButton.addTarget(self, action: #selector(self.calculateButtonTap), for: .touchUpInside)

		self.priceLabel.text = Names.priceLabelTitle
		self.priceLabel.font = .systemFont(ofSize: Metrics.fontSize)
		
		self.sedanLabel.text = Names.sedanTitle
		self.coupeLabel.text = Names.coupeTitle
		
		self.universalLabel.text = Names.universalTitle
		self.hatchbackLabel.text = Names.hatchbackTitle
		
		self.upgrade(button: self.sedanButton)
		self.sedanButton.setTitle(Names.sedanTitle, for: .normal)

		self.upgrade(button: self.coupeButton)
		self.coupeButton.setTitle(Names.coupeTitle, for: .normal)
		
		self.upgrade(button: hatchbackButton)
		self.hatchbackButton.setTitle(Names.hatchbackTitle, for: .normal)
		
		self.upgrade(button: self.universalButton)
		self.universalButton.setTitle(Names.universalTitle, for: .normal)
		
		self.imageView.contentMode = .scaleAspectFit
		
	}
	private func addSubviews() {
		self.addSubview(self.imageView)
		self.addSubview(self.priceLabel)
		self.addSubview(self.priceNumberLabel)
		self.addSubview(self.sedanLabel)
		self.addSubview(self.sedanButton)
		self.addSubview(self.coupeLabel)
		self.addSubview(self.coupeButton)
		self.addSubview(self.hatchbackLabel)
		self.addSubview(self.hatchbackButton)
		self.addSubview(self.universalLabel)
		self.addSubview(self.universalButton)
		self.addSubview(self.activityIndicator)
		self.addSubview(self.calculateButton)
	}
	
	private func makeConstraints() {
		self.imageView.snp.makeConstraints { maker in
			maker.leading.trailing.equalToSuperview().inset(Metrics.leadingOrTrailingMargin)
			maker.top.equalToSuperview().offset(Metrics.imageTopMargin)
			maker.height.equalTo(Metrics.imageHeight)
			maker.centerX.equalToSuperview()
		}
		
		self.priceLabel.snp.makeConstraints { maker in
			maker.leading.trailing.equalToSuperview().inset(Metrics.leadingOrTrailingMargin)
			maker.top.equalTo(self.imageView.snp.bottom).offset(Metrics.fromImageToPriceMargin)
		}
		
		self.priceNumberLabel.snp.makeConstraints { maker in
			maker.leading.trailing.equalToSuperview().inset(Metrics.leadingOrTrailingMargin)
			maker.top.equalTo(self.priceLabel.snp.bottom).offset(Metrics.fromPriceToNumberMargin)
		}
		
		self.sedanLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.priceNumberLabel.snp.bottom).offset(Metrics.fromPriceToBodysMargin)
			maker.leading.equalToSuperview().offset(Metrics.leadingOrTrailingMargin)
		}
		
		self.sedanButton.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.sedanLabel.snp.centerY)
			maker.trailing.equalToSuperview().inset(Metrics.leadingOrTrailingMargin)
			maker.height.width.equalTo(Metrics.buttonWidthAndHight)
		}
		
		self.coupeLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.sedanLabel.snp.bottom).offset(Metrics.betweenBodyMargin)
			maker.leading.equalToSuperview().offset(Metrics.leadingOrTrailingMargin)
		}
		
		self.coupeButton.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.coupeLabel.snp.centerY)
			maker.trailing.equalToSuperview().inset(Metrics.leadingOrTrailingMargin)
			maker.height.width.equalTo(Metrics.buttonWidthAndHight)
		}
		
		self.hatchbackLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.coupeLabel.snp.bottom).offset(Metrics.betweenBodyMargin)
			maker.leading.equalToSuperview().offset(Metrics.leadingOrTrailingMargin)
		}
		
		self.hatchbackButton.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.hatchbackLabel.snp.centerY)
			maker.trailing.equalToSuperview().inset(Metrics.leadingOrTrailingMargin)
			maker.height.width.equalTo(Metrics.buttonWidthAndHight)
		}
		
		self.universalLabel.snp.makeConstraints { maker in
			maker.top.equalTo(self.hatchbackLabel.snp.bottom).offset(Metrics.betweenBodyMargin)
			maker.leading.equalToSuperview().offset(Metrics.leadingOrTrailingMargin)
		}
		
		self.universalButton.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.universalLabel.snp.centerY)
			maker.trailing.equalToSuperview().inset(Metrics.leadingOrTrailingMargin)
			maker.height.width.equalTo(Metrics.buttonWidthAndHight)
		}
		
		self.activityIndicator.snp.makeConstraints { maker in
			maker.centerX.centerY.equalToSuperview()
		}
		
		self.calculateButton.snp.makeConstraints { maker in
			maker.bottom.equalToSuperview().inset(Metrics.calculateButtonBottom)
			maker.centerX.equalToSuperview()
			maker.leading.trailing.equalToSuperview().inset(Metrics.leadingOrTrailingMargin)
		}
	}
	
	private func upgrade(button: UIButton) {
		button.setImage(UIImage(named: "uncheck"), for: .normal)
		button.setImage(UIImage(named: "greenCircle"), for: .selected)
		button.addTarget(self, action: #selector(self.selectedTap(sender:)), for: .touchUpInside)
	}
	
	@objc private func selectedTap(sender: UIButton) {
		sender.isSelected.toggle()
		for button in self.buttons {
			if button != sender {
				button.isSelected = false
			}
		}
	}
	
	@objc private func calculateButtonTap() {
		self.startLoading()
		
		for button in buttons {
			if button.isSelected == true {
				guard let body = button.currentTitle else { return }
				self.rebuildViewHandler?(body)
			}
		}
	}
}

extension CarsView: ICarsView
{
	func startLoading() {
		self.activityIndicator.isHidden = false
		self.activityIndicator.startAnimating()
	}

	func setContent(car: CarModel) {
		self.imageView.image = car.image
		self.priceNumberLabel.text = "\(car.price) $"

		for button in self.buttons {
			if button.currentTitle == car.body {
				button.isSelected = true
			} else {
				button.isSelected = false
			}
		}
		self.activityIndicator.stopAnimating()
		self.activityIndicator.isHidden = true
	}

	func configure() {
		self.backgroundColor = .white
		self.setStrongOptions()
		self.addSubviews()
		self.makeConstraints()
	}
}

