//
//  DetailCompanyView.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit
import SnapKit

protocol IDetailCityView: AnyObject
{
	func configure()
	func set(city: CityModel)
	func set(weatherImage: Data?)
}

final class DetailCityView: UIView
{
	private let nameLabel = UILabel()
	private let sunRise = UILabel()
	private let sunSet = UILabel()
	private let windDerection = UILabel()
	private let wind = UILabel()
	private let weatherImage = UIImageView()
}

extension DetailCityView: IDetailCityView
{
	func configure() {
		self.backgroundColor = .white
		
		self.addSubview(self.nameLabel)
		self.nameLabel.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalToSuperview().offset(100)
		}
		
		self.addSubview(self.sunRise)
		self.sunRise.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalTo(self.nameLabel.snp.bottom).offset(20)
		}
		
		self.addSubview(self.sunSet)
		self.sunSet.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalTo(self.sunRise.snp.bottom).offset(20)
		}
		
		self.addSubview(self.wind)
		self.wind.snp.makeConstraints { maker in
			maker.top.equalTo(self.sunSet.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(16)
		}
		
		self.addSubview(self.windDerection)
		self.windDerection.snp.makeConstraints { maker in
			maker.top.equalTo(self.sunSet.snp.bottom).offset(20)
			maker.leading.equalTo(self.wind.snp.trailing).offset(10)
		}
		
		self.addSubview(self.weatherImage)
		self.weatherImage.contentMode = .scaleAspectFit
		self.weatherImage.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalTo(self.windDerection.snp.bottom).offset(20)
			maker.width.equalTo(100)
		}
	}
	
	func set(city: CityModel) {
		self.nameLabel.text = city.name
		self.sunRise.text = city.weather?.sunRise
		self.sunSet.text = city.weather?.sunSet
		
		self.wind.text = String(city.weather?.consolidatedWeather.first?.windSpeed ?? 0) + " mph "
		self.windDerection.text = city.weather?.consolidatedWeather.first?.windDirectionCompass
	}
	
	func set(weatherImage: Data?) {
		guard let data = weatherImage else { return }
		guard let image = UIImage(data: data) else { return }
		self.weatherImage.image = image
	}
}
