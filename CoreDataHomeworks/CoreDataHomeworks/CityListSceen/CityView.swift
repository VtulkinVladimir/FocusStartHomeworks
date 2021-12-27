//
//  CompanyView.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 19.12.2021.
//

import UIKit
import SnapKit

protocol ICityView: AnyObject
{
	func configure()
	func reloadData()
	var configureCellHandler: ((Int) -> UITableViewCell?)? { get set }
	var numberOfRowHandler: (() -> Int?)? { get set }
	var didTapCellHandler: ((Int) -> Void)? { get set }
	var didDeleteCellHandler: ((Int) -> Void)? { get set }
	
//	var didTapAddHandler: (() -> Void)? { get set}
}

final class CityView: UIView
{
	var configureCellHandler: ((Int) -> UITableViewCell?)?
	var numberOfRowHandler: (() -> Int?)?
	var didTapCellHandler: ((Int) -> Void)?
	var didTapAddHandler: (() -> Void)?
	var didDeleteCellHandler: ((Int) -> Void)?
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "City")
		tableView.delegate = self
		tableView.dataSource = self
		return tableView
	}()
	
}

extension CityView: ICityView
{
	func configure() {
		self.backgroundColor = .red
		self.addSubview(self.tableView)
		self.tableView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
		}
		
	}
	
	func reloadData() {
		self.tableView.reloadData()
	}
}

extension CityView: UITableViewDelegate
{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.didTapCellHandler?(indexPath.row)
	}
}

extension CityView: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = self.configureCellHandler?(indexPath.row) else { return UITableViewCell() }
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.numberOfRowHandler?() ?? 0
	}
	
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
			self.didDeleteCellHandler?(indexPath.row)
			complete(true)
		}
		let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
		configuration.performsFirstActionWithFullSwipe = true
		return configuration
	}
}
