//
//  HobbysView.swift
//  MyCV
//
//  Created by Владимир Втулкин on 12.11.2021.
//

import UIKit

class HobbysView: UIView
{
	private let imageView = UIImageView()
	private let hobby1Label = UILabel()
	private let hobby2Label = UILabel()
	
	init() {
		super.init(frame: .zero)
		self.configureInfo()
		self.configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureInfo() {
		let storegeHobbys = MyHobbys()
		self.imageView.image = storegeHobbys.image
		
		self.hobby1Label.text = storegeHobbys.hobby1
		self.hobby1Label.lineBreakMode = .byWordWrapping
		self.hobby1Label.numberOfLines = 0

		self.hobby2Label.text = storegeHobbys.hobby2
		self.hobby2Label.lineBreakMode = .byWordWrapping
		self.hobby2Label.numberOfLines = 0
	}
	
	func configureView() {
		self.backgroundColor = .white
		let screenSize = UIScreen.main.bounds.height
		
		self.addSubview(self.imageView)
		self.imageView.topAnchor.constraint(equalTo: self.topAnchor,
											constant: 40).isActive = true
		self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor,
											   multiplier: 0.3).isActive = true
		self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		self.imageView.contentMode = .scaleAspectFit
		self.imageView.translatesAutoresizingMaskIntoConstraints = false
		
		let hobbysStackView = UIStackView(arrangedSubviews: [hobby1Label, hobby2Label])
		hobbysStackView.distribution = .fillProportionally
		hobbysStackView.axis = .vertical

		self.addSubview(hobbysStackView)
		hobbysStackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor,
											 constant: 20).isActive = true
		hobbysStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
												 constant: 20).isActive = true
		hobbysStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
												constant: -(screenSize * 0.1)).isActive = true
		hobbysStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
												  constant: -20).isActive = true
		hobbysStackView.translatesAutoresizingMaskIntoConstraints = false
	}
}
