//
//  AddCompanyRouter.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit

protocol IAddCityRouter
{
	func setCurrencyViewController(_ vc: UIViewController)
	func setTargetViewController(_ vc: UIViewController)
	func close()
}


final class AddCityRouter
{
	private var currencyViewController: UIViewController?
	private var targetViewController: UIViewController?
}


extension AddCityRouter: IAddCityRouter
{
	func setCurrencyViewController(_ vc: UIViewController) {
		self.currencyViewController = vc
	}
	
	func setTargetViewController(_ vc: UIViewController) {
		self.targetViewController = vc
	}
	
	func close() {
		self.currencyViewController?.navigationController?.popViewController(animated: true)
	}
}
