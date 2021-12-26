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
	func updateProgress(progress: Float)
	var pauseButtonTapHandler: (()->Void)? { get set }
	var configureCellhandler: ((Int) -> ImageTableViewCell?)? { get set }
	var getNumberOfRowHandler: (() -> Int?)? { get set }
	var searchButtonTapHandler: ((String) -> Void)? { get set }
	var continueButtonTapHandler: (() -> Void)? { get set }
}

final class URLView: UIView
{
	var continueButtonTapHandler: (() -> Void)?
	var pauseButtonTapHandler: (()->Void)?
	var searchButtonTapHandler: ((String) -> Void)?
	var configureCellhandler: ((Int) -> ImageTableViewCell?)?
	var getNumberOfRowHandler: (() -> Int?)?
	
	private let urlTextField = UITextField()
	private let searchButton = UIButton()
	private let pauseButton = UIButton()
	private let progressBar = UIProgressView()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: "Cell")
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()
	
	private enum Titles
	{
		static let urlTextField = "Paste your URL"
		static let searchButton = "Search"
		static let pauseButton = "Pause"
		static let continueButton = "Continue"
	}
	
	private enum Metrics
	{
		static let progressBarTopOffset: CGFloat = 60
		static let pauseButtonTopOffset: CGFloat = 10
		static let textFieldTopOffset: CGFloat = 20
		static let textFieldLeading: CGFloat = 16
		static let textFieldWidth: CGFloat = 300
		static let searchButtonLeadingOffset: CGFloat = 10
		static let searchButtonWidth: CGFloat = 70
		static let tableViewHeight: CGFloat = 800
		static let tableViewTopOffset: CGFloat = 20
		static let tableCellHeight: CGFloat = 150
	}
	
	private func configureTitles() {
		self.urlTextField.placeholder = Titles.urlTextField
		self.searchButton.setTitle(Titles.searchButton, for: .normal)
		self.pauseButton.setTitle(Titles.pauseButton, for: .normal)
		self.pauseButton.setTitle(Titles.continueButton, for: .selected)
	}
	
	private func configureButtons() {
		self.searchButton.setTitleColor(.systemBlue, for: .normal)
		self.searchButton.addTarget(self, action: #selector(self.searchButtonTap), for: .touchUpInside)
		
		self.pauseButton.backgroundColor = .systemBlue
		self.pauseButton.addTarget(self, action: #selector(self.pauseButtonTap(sender:)), for: .touchUpInside)
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

extension URLView: IURLView
{
	func updateProgress(progress: Float) {
		self.progressBar.isHidden = false
		self.progressBar.progress = progress
	}
	
	func reloadTableView() {
		self.tableView.reloadData()
		self.progressBar.isHidden = true
	}

	func configure() {
		self.backgroundColor = .white
		self.configureTitles()
		self.configureButtons()
		
		self.addSubview(self.progressBar)
		self.progressBar.isHidden = true
		self.progressBar.snp.makeConstraints { maker in
			maker.top.equalToSuperview().offset(Metrics.progressBarTopOffset)
			maker.width.equalToSuperview()
		}
		
		self.addSubview(self.pauseButton)
		self.pauseButton.snp.makeConstraints { maker in
			maker.top.equalTo(self.progressBar.snp.bottom).offset(Metrics.pauseButtonTopOffset)
			maker.centerX.equalToSuperview()
		}
		
		self.urlTextField.borderStyle = .roundedRect
		self.addSubview(self.urlTextField)
		self.urlTextField.snp.makeConstraints { maker in
			maker.top.equalTo(self.pauseButton.snp.bottom).offset(Metrics.textFieldTopOffset)
			maker.leading.equalToSuperview().offset(Metrics.textFieldLeading)
			maker.width.equalTo(Metrics.textFieldWidth)
		}

		self.addSubview(self.searchButton)
		self.searchButton.snp.makeConstraints { maker in
			maker.leading.equalTo(self.urlTextField.snp.trailing).offset(Metrics.searchButtonLeadingOffset)
			maker.centerY.equalTo(self.urlTextField.snp.centerY)
			maker.width.equalTo(Metrics.searchButtonWidth)
		}
		
		self.addSubview(self.tableView)
		self.tableView.snp.makeConstraints { maker in
			maker.width.equalToSuperview()
			maker.top.equalTo(self.urlTextField.snp.bottom).offset(Metrics.tableViewTopOffset)
			maker.centerX.equalToSuperview()
			maker.height.equalTo(Metrics.tableViewHeight)
		}
	}
}

extension URLView: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = self.configureCellhandler?(indexPath.row) else { return UITableViewCell() }
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.getNumberOfRowHandler?() ?? 0
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Metrics.tableCellHeight
	}
}

extension URLView: UITableViewDelegate
{}
