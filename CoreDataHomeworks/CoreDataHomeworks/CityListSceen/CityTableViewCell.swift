//
//  CityTableViewCell.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 28.12.2021.
//

import Foundation
import UIKit
import SnapKit

final class CityTableViewCell: UITableViewCell
{
	private let nameLabel = UILabel()
	private let lastTempLabel = UILabel()
	private let weatherImageView = UIImageView()
	
	
	func configure() {
        self.backgroundColor = .systemBlue
		self.addSubview(self.nameLabel)
        self.nameLabel.textColor = .white
		self.nameLabel.snp.makeConstraints { maker in
			maker.leading.equalToSuperview().offset(16)
			maker.centerY.equalToSuperview()
		}
		
		self.addSubview(self.weatherImageView)
		self.weatherImageView.contentMode = .scaleAspectFit
		self.weatherImageView.snp.makeConstraints { maker in
			maker.trailing.equalToSuperview().inset(16)
			maker.height.equalTo(40)
			maker.centerY.equalToSuperview()
		}
		
		self.addSubview(self.lastTempLabel)
        self.lastTempLabel.textColor = .white
		self.lastTempLabel.snp.makeConstraints { maker in
			maker.trailing.equalTo(self.weatherImageView.snp.leading).offset(-20)
			maker.centerY.equalToSuperview()
		}
	}
	
	func set(name: String, lastTemp: Int? = nil, weatherImage: Data? = nil) {
		self.nameLabel.text = name
		
		guard let lastTemp = lastTemp else { return }
		let str = "\(lastTemp) °C"
		self.lastTempLabel.text = str
		
		guard let weatherData = weatherImage, let image = UIImage(data: weatherData) else { return }
		self.weatherImageView.image = image
	}
}
