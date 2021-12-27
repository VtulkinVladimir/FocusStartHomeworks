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
	func reloadData()
	var searchButtonTapHandler: ((String) -> Void)? { get set }
	var configureCellHandler: ((Int) -> UITableViewCell?)? { get set }
	var numberOfRowHandler: (() -> Int?)? { get set }
	var didTapCellHandler: ((Int) -> Void)? { get set }
}

final class AddCityView: UIView
{
	var configureCellHandler: ((Int) -> UITableViewCell?)?
	var numberOfRowHandler: (() -> Int?)?
	var didTapCellHandler: ((Int) -> Void)?
	var searchButtonTapHandler: ((String) -> Void)?
	
	private let nameTextField = UITextField()
	private let searchButton = UIButton(type: .roundedRect)
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "City")
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()
	
	@objc private func addButtonTap() {
		guard let text = self.nameTextField.text, text.isEmpty == false else { return }
//		let company = CompanyModel(name: text)
		self.searchButtonTapHandler?(text)
	}
	
}

extension AddCityView: IAddCityView
{
	func reloadData() {
		self.tableView.reloadData()
	}
	
	func configure() {
		self.backgroundColor = .white
		
		self.addSubview(self.nameTextField)
		self.nameTextField.placeholder = "Пиши город сюдой"
		self.nameTextField.borderStyle = .roundedRect
		self.nameTextField.snp.makeConstraints { maker in
			maker.centerX.equalToSuperview()
			maker.top.equalToSuperview().offset(100)
		}
		
		self.addSubview(self.searchButton)
		self.searchButton.backgroundColor = .systemBlue
		self.searchButton.setTitle("Search", for: .normal)
		self.searchButton.addTarget(self, action: #selector(self.addButtonTap), for: .touchUpInside)
		self.searchButton.snp.makeConstraints { maker in
			maker.top.equalTo(self.nameTextField.snp.bottom).offset(30)
			maker.centerX.equalToSuperview()
		}
		
		self.addSubview(self.tableView)
		self.tableView.snp.makeConstraints { maker in
			maker.top.equalTo(self.searchButton.snp.bottom).offset(20)
			maker.leading.trailing.equalToSuperview().inset(20)
			maker.height.equalTo(300)
		}
	}
}


extension AddCityView: UITableViewDelegate
{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.didTapCellHandler?(indexPath.row)
	}
}

extension AddCityView: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = self.configureCellHandler?(indexPath.row) else { return UITableViewCell() }
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let count = self.numberOfRowHandler?() {
			self.tableView.isHidden = false
			return count
			
		} else {
			self.tableView.isHidden = true
			return 0
		}
	}
}
