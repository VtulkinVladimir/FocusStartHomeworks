//
//  InfoView.swift
//  MyCV
//
//  Created by Владимир Втулкин on 12.11.2021.
//
import UIKit

final class InfoView: UIView
{
	private let avatarImageView = UIImageView()
	private let nameLabel = UILabel()
	private let lastNameLabel = UILabel()
	private let cityLabel = UILabel()
	private let ageLabel = UILabel()

	init() {
		super.init(frame: .zero)
		self.configureInfo()
		self.configureView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureInfo() {
		self.avatarImageView.image = MyInfo.avatar
		
		self.nameLabel.text = MyInfo.name
		self.nameLabel.font = .systemFont(ofSize: InfoViewFontSize.fullName)
		
		self.lastNameLabel.text = MyInfo.lastName
		self.lastNameLabel.font = .systemFont(ofSize: InfoViewFontSize.fullName)
		
		self.cityLabel.text = MyInfo.city
		self.cityLabel.font = .systemFont(ofSize: InfoViewFontSize.city)
		
		self.ageLabel.text = MyInfo.age
		self.ageLabel.font = .systemFont(ofSize: InfoViewFontSize.age)
	}
	
	private func configureView() {
		self.backgroundColor = .white
		
		self.addSubview(self.avatarImageView)
		self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor,
												  constant: 40).isActive = true
		self.avatarImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		self.avatarImageView.heightAnchor.constraint(equalTo: self.heightAnchor,
													 multiplier: 0.5).isActive = true
		self.avatarImageView.contentMode = .scaleAspectFit
		self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(self.nameLabel)
		self.nameLabel.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor,
											constant: 20).isActive = true
		self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
												constant: 20).isActive = true
		self.nameLabel.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(self.lastNameLabel)
		self.lastNameLabel.centerYAnchor.constraint(equalTo: self.nameLabel.centerYAnchor).isActive = true
		self.lastNameLabel.leadingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor,
													constant: 16).isActive = true
		self.lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(self.ageLabel)
		self.ageLabel.topAnchor.constraint(equalTo: self.lastNameLabel.bottomAnchor,
										   constant: 20).isActive = true
		self.ageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
											   constant: 20).isActive = true
		self.ageLabel.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(self.cityLabel)
		self.cityLabel.bottomAnchor.constraint(equalTo: self.ageLabel.bottomAnchor,
											   constant: 40) .isActive = true
		self.cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		self.cityLabel.translatesAutoresizingMaskIntoConstraints = false
	}
}
