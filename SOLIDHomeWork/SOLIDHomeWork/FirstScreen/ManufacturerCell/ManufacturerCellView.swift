//
//  ManufacturerCellView.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//

import UIKit
import SnapKit

final class ManufacturerCellView: UIView
{
	private enum Metrics
	{
		static let leadingMargins: CGFloat = 16
		static let circleHight: CGFloat = 16
	}
	init(manufacturer: Manufacturer) {
		super.init(frame: .zero)
		self.configure(manufacturer)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure(_ manufacturer: Manufacturer) {
		let circle = UIImageView(image: UIImage(named: "greenCircle"))
		circle.contentMode = .scaleAspectFit
		self.addSubview(circle)
		circle.snp.makeConstraints { maker in
			maker.leading.equalTo(Metrics.leadingMargins)
			maker.centerY.equalToSuperview()
			maker.height.width.equalTo(Metrics.circleHight)
		}
		
		let label = UILabel()
		label.text = manufacturer.rawValue
		self.addSubview(label)
		label.snp.makeConstraints { maker in
			maker.centerY.equalToSuperview()
			maker.leading.equalTo(circle.snp.trailing).offset(Metrics.leadingMargins)
		}
	}
}
