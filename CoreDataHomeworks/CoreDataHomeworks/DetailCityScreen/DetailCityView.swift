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
//	func set(weatherImage: Data?)
}

final class DetailCityView: UIView
{
	private let nameLabel = UILabel()
	private let weatherImage = UIImageView()
	private let tempLabel = UILabel()
	private let sunRise = UILabel()
	private let sunSet = UILabel()
	private let windDerection = UILabel()
	private let wind = UILabel()
	private let date = UILabel()
	private let weatherName = UILabel()
	private let maxTemp = UILabel()
	private let minTemp = UILabel()
	
	private let textColor = UIColor.white
}

extension DetailCityView: IDetailCityView
{
	func configure() {
		self.backgroundColor = .systemBlue
		
		self.addSubview(self.nameLabel)
		self.nameLabel.font = .boldSystemFont(ofSize: 45)
		self.nameLabel.textColor = self.textColor
		self.nameLabel.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalToSuperview().offset(100)
		}
		
		self.addSubview(self.weatherImage)
		self.weatherImage.contentMode = .scaleAspectFit
		self.weatherImage.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalTo(self.nameLabel.snp.bottom).offset(20)
			maker.width.equalTo(200)
		}
		
		self.addSubview(self.weatherName)
		self.weatherName.textColor = self.textColor
		self.weatherName.snp.makeConstraints { maker in
			maker.top.equalTo(self.weatherImage.snp.bottom).offset(10)
			maker.centerX.equalToSuperview()
		}
		
		self.addSubview(self.tempLabel)
		self.tempLabel.font = .boldSystemFont(ofSize: 55)
		self.tempLabel.textColor = self.textColor
		self.tempLabel.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalTo(self.weatherName.snp.bottom).offset(20)
		}
		
		self.addSubview(self.minTemp)
		self.minTemp.textColor = self.textColor
		self.minTemp.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.tempLabel.snp.centerY)
			maker.leading.equalToSuperview().offset(16)
		}
		
		self.addSubview(self.maxTemp)
		self.maxTemp.textColor = self.textColor
		self.maxTemp.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.minTemp.snp.centerY)
			maker.trailing.equalToSuperview().inset(16)
		}
		
		self.addSubview(self.sunRise)
		self.sunRise.font = .systemFont(ofSize: 20)
		self.sunRise.textColor = self.textColor
		self.sunRise.snp.makeConstraints { maker in
			maker.leading.equalToSuperview().offset(16)
			maker.top.equalTo(self.tempLabel.snp.bottom).offset(20)
		}
		
		self.addSubview(self.sunSet)
		self.sunSet.font = .systemFont(ofSize: 20)
		self.sunSet.textColor = self.textColor
		self.sunSet.snp.makeConstraints { maker in
			maker.centerY.equalTo(self.sunRise.snp.centerY)
			maker.trailing.equalToSuperview().inset(16)
		}
		
		self.addSubview(self.wind)
		self.wind.textColor = self.textColor
		self.wind.snp.makeConstraints { maker in
			maker.top.equalTo(self.sunSet.snp.bottom).offset(20)
			maker.leading.equalToSuperview().offset(16)
		}
		
		self.addSubview(self.windDerection)
		self.windDerection.textColor = self.textColor
		self.windDerection.snp.makeConstraints { maker in
			maker.top.equalTo(self.sunSet.snp.bottom).offset(20)
			maker.leading.equalTo(self.wind.snp.trailing).offset(10)
		}
		
	
		
		self.addSubview(self.date)
		self.date.font = .systemFont(ofSize: 25)
		self.date.textColor = self.textColor
		self.date.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.bottom.equalToSuperview().inset(50)
		}
	}
	
	private func cuteString(str: String?) -> String? {
		guard let string = str else { return nil}
		let cutString = String(string.dropFirst(11))
		let resultString = String(cutString.dropLast(13))
		return resultString
	}
	
	func set(city: CityModel) {
		guard let todayWeather = city.weather?.consolidatedWeather.first else { return }
		
		self.nameLabel.text = city.name
		
		guard let temp = city.lastTemp else { return }
		self.tempLabel.text = String(temp)
		
		guard let sunRise = self.cuteString(str: city.weather?.sunRise)  else { return }
//		let sunRise = self.cuteString(str: string)
		self.sunRise.text = "Sunrise: \(sunRise)"
		
		guard let sunSet = self.cuteString(str: city.weather?.sunSet)  else { return }
		self.sunSet.text = "Sunset: \(sunSet)"
		
		self.wind.text = "Wind: " + String(todayWeather.windSpeed) + " mph "
		self.windDerection.text = todayWeather.windDirectionCompass
		
		guard let data = city.lastWeatherImage else { return }
		guard let image = UIImage(data: data) else { return }
		self.weatherImage.image = image
		
		self.date.text = todayWeather.applicableDate
		self.weatherName.text = todayWeather.weatherStateName
		self.minTemp.text = "min: \(todayWeather.minTemp)"
		self.maxTemp.text = "max: \(todayWeather.maxTemp)"
		
		todayWeather.airPressure
	}
	
//	func set(weatherImage: Data?) {
//		guard let data = weatherImage else { return }
//		guard let image = UIImage(data: data) else { return }
//		self.weatherImage.image = image
//	}
}
