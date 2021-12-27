//
//  AddCompanyView.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 21.12.2021.
//

import Foundation
import UIKit
import SnapKit

protocol IAddCityView: AnyObject
{
	func configure()
	var searchButtonTapHandler: ((String) -> Void)? { get set }
}

final class AddCityView: UIView
{
	var searchButtonTapHandler: ((String) -> Void)?
	
	private let nameTextField = UITextField()
	private let searchCompanyButton = UIButton(type: .roundedRect)
	
	@objc private func addButtonTap() {
		guard let text = self.nameTextField.text, text.isEmpty == false else { return }
//		let company = CompanyModel(name: text)
		self.searchButtonTapHandler?(text)
	}
}

extension AddCityView: IAddCityView
{
	func configure() {
		self.backgroundColor = .white
		
		self.addSubview(self.nameTextField)
		self.nameTextField.placeholder = "Пиши город сюдой"
		self.nameTextField.borderStyle = .roundedRect
		self.nameTextField.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalToSuperview().offset(100)
		}
		
		self.addSubview(self.searchCompanyButton)
		self.searchCompanyButton.backgroundColor = .systemBlue
		self.searchCompanyButton.setTitle("Search", for: .normal)
		self.searchCompanyButton.addTarget(self, action: #selector(self.addButtonTap), for: .touchUpInside)
		self.searchCompanyButton.snp.makeConstraints { maker in
			maker.top.equalTo(self.nameTextField.snp.bottom).offset(30)
			maker.centerX.equalToSuperview()
		}
	}
}
