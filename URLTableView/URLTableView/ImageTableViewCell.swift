//
//  ImageTableViewCell.swift
//  URLTableView
//
//  Created by Владимир Втулкин on 14.12.2021.
//

import UIKit
import SnapKit

final class ImageTableViewCell: UITableViewCell
{
//	func confugire(image: UIImage?) {
//		let imageView = UIImageView(image: image)
//		imageView.contentMode = .scaleAspectFit
//
//		self.addSubview(imageView)
//		imageView.snp.makeConstraints { maker in
//			maker.centerY.equalToSuperview()
//			maker.centerX.equalToSuperview()
//			maker.height.equalTo(150)
//		}
//	}
	
	func confugire(data: Data?) {
		guard let data = data else { return }
		guard let image = UIImage(data: data) else { return }
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFit
		
		self.addSubview(imageView)
		imageView.snp.makeConstraints { maker in
			maker.centerY.equalToSuperview()
			maker.centerX.equalToSuperview()
			maker.height.equalTo(150)
		}
	}
}
