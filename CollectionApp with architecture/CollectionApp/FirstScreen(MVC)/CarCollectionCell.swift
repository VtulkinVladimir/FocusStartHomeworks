//
//  CarCollectionCell.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 19.11.2021.
//

import UIKit
import SnapKit

final class CarCollectionCell: UICollectionViewCell
{
	static let identifier = "CarCell"
	
	private let imageView = UIImageView()
	private let manufacturer = UILabel()
	private let model = UILabel()
	private let yearOfIssue = UILabel()
	
	var car: CarMVCModel? {
		didSet {
			self.setContent()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override var isHighlighted: Bool {
		didSet {
			UIView.animate(withDuration: 0.25) {
				self.alpha = self.isHighlighted ? 0.5 : 1.0
			}
		}
	}
	
	private func setContent() {
		guard let car = self.car else { return }
		self.imageView.image = car.image
		self.imageView.contentMode = .scaleAspectFit
		self.imageView.translatesAutoresizingMaskIntoConstraints = false

		self.manufacturer.text = car.manufacturer
		self.manufacturer.font = .boldSystemFont(ofSize: TextSize.carCollectionCellTextSize)
		self.manufacturer.shadowColor = .lightText
		self.manufacturer.translatesAutoresizingMaskIntoConstraints = false

		self.model.text = car.model
		self.model.font = .boldSystemFont(ofSize: TextSize.carCollectionCellTextSize)
		self.model.shadowColor = .lightText
		self.model.translatesAutoresizingMaskIntoConstraints = false

		self.yearOfIssue.text = String(car.yearOfIssue)
		self.yearOfIssue.font = .boldSystemFont(ofSize: TextSize.carCollectionCellTextSize)
		self.yearOfIssue.shadowColor = .lightText
		self.yearOfIssue.translatesAutoresizingMaskIntoConstraints = false
	}

	private func configureView() {
		self.backgroundColor = .systemFill
		
		self.addSubview(self.imageView)
		self.imageView.snp.makeConstraints { maker in
			maker.height.equalToSuperview().offset(-10)
			maker.width.equalTo(self.imageView.snp.height)
			maker.leading.equalToSuperview().offset(5)
			maker.centerY.equalToSuperview()
		}

		self.addSubview(self.manufacturer)
		self.manufacturer.snp.makeConstraints { maker in
			maker.leading.equalTo(self.imageView.snp.trailing).offset(10)
			maker.centerY.equalTo(self.imageView.snp.centerY).offset(-50)
		}

		self.addSubview(self.model)
		self.model.snp.makeConstraints { maker in
			maker.leading.equalTo(self.manufacturer.snp.trailing).offset(10)
			maker.centerY.equalTo(self.manufacturer.snp.centerY)
		}

		self.addSubview(self.yearOfIssue)
		self.yearOfIssue.snp.makeConstraints { maker in
			maker.top.equalTo(self.manufacturer.snp.bottom).offset(20)
			maker.leading.equalTo(self.imageView.snp.trailing).offset(10)
		}
	}
}
