//
//  CarsView.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//

import UIKit
import SnapKit

protocol IManufacturersView: AnyObject
{
	func configure()
	var configureCellHandler: ((Int) -> IManufacturerTableCell)? { get set }
	var countHandler: (() -> Int)? { get set }
	var tapCellHandler: ((Int) -> Void)? { get set }
}

final class ManufacturersView: UIView {
	
	var configureCellHandler: ((Int) -> IManufacturerTableCell)?
	var countHandler: (() -> Int)?
	var tapCellHandler: ((Int) -> Void)?
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		tableView.delegate = self
		tableView.dataSource = self
		
		return tableView
	}()
}

extension ManufacturersView: IManufacturersView
{
	func configure() {
		self.addSubview(self.tableView)
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		self.tableView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
		}
	}

}

extension ManufacturersView: UITableViewDelegate
{
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
		self.tapCellHandler?(indexPath.row)
	}
}

extension ManufacturersView: UITableViewDataSource
{
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = self.configureCellHandler?(indexPath.row) as? UITableViewCell else { return UITableViewCell() }
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.countHandler?() ?? 0
	}
}
