//
//  CompanyRouter.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 19.12.2021.
//

import Foundation
import UIKit

protocol ICityRouter
{
	func setCurrentViewController(_ vc: UIViewController)
	func setNextViewController(_ vc: IDetailCityVC)
	func setAddCompanyViewController(_ vc: IAddCityViewController)
	func next(with: CityModel)
	func nextToAddCompany()
}

final class CityRouter
{
	private var currentViewvController: UIViewController?
	private var nextViewController: IDetailCityVC?
	private var addCompanyViewControler: IAddCityViewController?
}

extension CityRouter: ICityRouter
{
	func setCurrentViewController(_ vc: UIViewController) {
		self.currentViewvController = vc
	}
	
	func setNextViewController(_ vc: IDetailCityVC) {
		self.nextViewController = vc
	}
	
	func setAddCompanyViewController(_ vc: IAddCityViewController) {
		self.addCompanyViewControler = vc
	}
	
	func next(with city: CityModel) {
		self.nextViewController?.set(city: city)
		guard let nextVC = self.nextViewController as? UIViewController else { return }

		self.currentViewvController?.navigationController?.pushViewController(nextVC, animated: true)
	}
	
	func nextToAddCompany() {
		guard let addVC = self.addCompanyViewControler as? UIViewController else { return }
		
		self.currentViewvController?.navigationController?.pushViewController(addVC, animated: true)
	}
}
