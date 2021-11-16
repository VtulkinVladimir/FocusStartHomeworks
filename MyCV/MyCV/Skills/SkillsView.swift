//
//  SkillsView.swift
//  MyCV
//
//  Created by Владимир Втулкин on 12.11.2021.
//

import UIKit

final class SkillsView: UIView
{
	private let imageView = UIImageView()
	private let skillsLabel = UILabel()
	private let descriptionLabel = UILabel()
	
	init() {
		super.init(frame: .zero)
		self.configureInfo()
		self.configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureInfo() {
		self.imageView.image = MySkills.image
		
		self.skillsLabel.text = MySkills.skills
		self.skillsLabel.lineBreakMode = .byWordWrapping
		self.skillsLabel.numberOfLines = NumbersOfLineForUILabel.allLabels
		
		self.descriptionLabel.text = MySkills.description
		self.descriptionLabel.lineBreakMode = .byWordWrapping
		self.descriptionLabel.numberOfLines = NumbersOfLineForUILabel.allLabels
	}
	
	func configureView() {
		let screenSize = UIScreen.main.bounds.height

		self.backgroundColor = .white
		self.addSubview(self.imageView)
		self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		self.imageView.topAnchor.constraint(equalTo: self.topAnchor,
											constant: 40).isActive = true
		self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor,
											   multiplier: 0.3).isActive = true
		self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor,
											  multiplier: 0.9).isActive = true
		self.imageView.contentMode = .scaleAspectFit
		self.imageView.translatesAutoresizingMaskIntoConstraints = false
		
		let skillsStackView = UIStackView(arrangedSubviews: [skillsLabel, descriptionLabel])
		skillsStackView.distribution = .fillProportionally
		skillsStackView.axis = .vertical

		self.addSubview(skillsStackView)
		skillsStackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor,
											 constant: 20).isActive = true
		skillsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
												 constant: 20).isActive = true
		skillsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
												constant: -(screenSize * 0.1)).isActive = true
		skillsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
												  constant: -20).isActive = true
		skillsStackView.translatesAutoresizingMaskIntoConstraints = false
	}
}
