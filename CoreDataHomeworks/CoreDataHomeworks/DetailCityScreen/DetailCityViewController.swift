//
//  DetailCompanyViewController.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit

protocol IDetailCityVC: UIViewController
{
	func set(city: CityModel)
}

final class DetailCityViewController: UIViewController
{
	private let ui: IDetailCityView
	private let presenter: IDetailCityPresenter
	
	struct Dependencies
	{
		let view: IDetailCityView
		let presenter: IDetailCityPresenter
	}
	
	init(dependencies: Dependencies) {
		self.ui = dependencies.view
		self.presenter = dependencies.presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func loadView() {
		self.view = self.ui as? UIView
		self.presenter.loadView()
        self.navigationItem.largeTitleDisplayMode = .never
	}
    
    private func setTitle(title: String) {
        self.navigationItem.title = title
    }
    
    
    private func formatString(str: String?) -> String? {
        guard let string = str else { return nil}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let printerDate = DateFormatter()
        printerDate.dateFormat = "EEEE, MMM d"

        guard let date = dateFormatter.date(from: string) else { return nil}
        return (printerDate.string(from: date))
    }
}

extension DetailCityViewController: IDetailCityVC
{
	func set(city: CityModel) {
		self.presenter.set(city)
        guard let title = self.formatString(str: city.weather?.consolidatedWeather.first?.applicableDate)  else { return }
        self.setTitle(title: title)
	}
}
