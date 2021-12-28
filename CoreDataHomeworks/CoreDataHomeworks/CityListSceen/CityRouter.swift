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
//	func setNextViewController(_ vc: IDetailCityVC)
//	func setAddCompanyViewController(_ vc: IAddCityViewController)
	func next(with: CityModel)
	func nextToAddCompany()
}

final class CityRouter
{
	private var currentViewvController: UIViewController?
//	private weak var nextViewController: IDetailCityVC?
//	private var addCompanyViewControler: IAddCityViewController?
    private let storemanager: IStoreManager
    
    init(storemanager: IStoreManager) {
        self.storemanager = storemanager
    }
}

extension CityRouter: ICityRouter
{
	func setCurrentViewController(_ vc: UIViewController) {
		self.currentViewvController = vc
	}
	
//	func setNextViewController(_ vc: IDetailCityVC) {
//		self.nextViewController = vc
//	}
	
//	func setAddCompanyViewController(_ vc: IAddCityViewController) {
//		self.addCompanyViewControler = vc
//	}
	
	func next(with city: CityModel) {
        let nextViewController: IDetailCityVC = DetailCityAssembly.build(storeManager: self.storemanager)
		nextViewController.set(city: city)
//		guard let nextVC = self.nextViewController as? UIViewController else { return }
        self.currentViewvController?.navigationController?.pushViewController(nextViewController, animated: true)
//		self.currentViewvController?.navigationController?.pushViewController(nextVC, animated: true)
	}
	
	func nextToAddCompany() {
        let addCompanyVC = AddCityAssembly.build(storeManager: self.storemanager)
        self.currentViewvController?.navigationController?.pushViewController(addCompanyVC, animated: true)
//		guard let addVC = self.addCompanyViewControler as? UIViewController else { return }
//		
//		self.currentViewvController?.navigationController?.pushViewController(addVC, animated: true)
	}
}
