//
//  PriceDetailViewController.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 20.11.2021.
//

import UIKit
import SnapKit

final class PriceDetailViewController: UIViewController
{
	private var model = PriceViewModel()

	private lazy var ui: PriceView = {
		let view = PriceView()
		view.closeButtonTapHandler = {[weak self] in
			self?.dismiss(animated: true, completion: nil)
		}
		return view
	}()

	init(price: Int) {
		super.init(nibName: nil, bundle: nil)
		self.model.set(price: price)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		super.loadView()
		self.view = self.ui
		self.model.load(view: self.ui)
	}
}
