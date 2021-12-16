//
// View.swift
//  URLTableView
//
//  Created by Владимир Втулкин on 13.12.2021.
//

import UIKit
import SnapKit

protocol IURLView: AnyObject
{
	func configure()
	func reloadTableView()
	var pauseButtonTapHandler: (()->Void)? { get set }
	var configureCellhandler: ((Int) -> ImageTableViewCell?)? { get set }
	var getNumberOfRowHandler: (() -> Int?)? { get set }
	var searchButtonTapHandler: ((String) -> Void)? { get set}
	var continueButtonTapHandler: (() -> Void)? { get set }
}

final class URLView: UIView
{
	var continueButtonTapHandler: (() -> Void)?
	var pauseButtonTapHandler: (()->Void)?
	var configureCellhandler: ((Int) -> ImageTableViewCell?)?
	var getNumberOfRowHandler: (() -> Int?)?
	var searchButtonTapHandler: ((String) -> Void)? 
	
	let urlTextField = UITextField()
	let searchButton = UIButton()
	let pauseButton = UIButton()
	let continueButton = UIButton()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "Cell")
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()

}

extension URLView: IURLView
{
	func reloadTableView() {
		self.tableView.reloadData()
	}
	func configure() {
		self.backgroundColor = .white
		
		self.urlTextField.placeholder = "Paste your URL"
		self.urlTextField.borderStyle = .roundedRect
		self.addSubview(self.urlTextField)
		self.urlTextField.snp.makeConstraints { maker in
			maker.top.equalToSuperview().offset(110)
			maker.leading.equalToSuperview().offset(16)
			maker.width.equalTo(300)
		}
		
		
		self.searchButton.setTitle("Search", for: .normal)
//		self.searchButton.isUserInteractionEnabled = true
		self.searchButton.setTitleColor(.systemBlue, for: .normal)
		self.searchButton.addTarget(self, action: #selector(self.searchButtonTap), for: .touchUpInside)
		self.addSubview(self.searchButton)
		self.searchButton.snp.makeConstraints { maker in
			maker.leading.equalTo(self.urlTextField.snp.trailing).offset(10)
			maker.centerY.equalTo(self.urlTextField.snp.centerY)
			maker.width.equalTo(70)
		}
		
		self.addSubview(self.tableView)
		self.tableView.snp.makeConstraints { maker in
			maker.width.equalToSuperview()
			maker.top.equalTo(self.urlTextField.snp.bottom).offset(20)
			maker.centerX.equalToSuperview()
			maker.height.equalTo(800)
		}
		
		self.addSubview(self.pauseButton)
		self.pauseButton.backgroundColor = .blue
		self.pauseButton.setTitle("Pause", for: .normal)
		self.pauseButton.setTitle("Continue", for: .selected)
		self.pauseButton.addTarget(self, action: #selector(self.pauseButtonTap(sender:)), for: .touchUpInside)
		self.pauseButton.snp.makeConstraints { maker in
			maker.top.equalToSuperview().offset(70)
			maker.centerX.equalToSuperview()
		}

	}

	
	@objc private func pauseButtonTap(sender: UIButton) {
		if sender.isSelected == false {
			sender.isSelected.toggle()
			sender.backgroundColor = .systemGreen
			self.pauseButtonTapHandler?()
		} else {
			sender.isSelected.toggle()
			sender.backgroundColor = .systemBlue
			self.continueButtonTapHandler?()
		}
		
	}
	
	@objc private func searchButtonTap() {
		guard let text = self.urlTextField.text else { return }
		guard text.isEmpty == false else { return }
		self.searchButtonTapHandler?(text)
	}
}

extension URLView: UITableViewDelegate
{
	
}

extension URLView: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = self.configureCellhandler?(indexPath.row) else { return UITableViewCell() }
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.getNumberOfRowHandler?() ?? 1
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 150
	}
}
