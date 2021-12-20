//
//  ManufacturerTableViewCell.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//

import UIKit
import SnapKit

protocol IManufacturerTableCell
{
	func set(view: UIView)
}

final class ManufacturerTableViewCell: UITableViewCell {
}

extension ManufacturerTableViewCell: IManufacturerTableCell
{
	func set(view: UIView) {
		self.contentView.addSubview(view)
		view.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
		}
	}
}
