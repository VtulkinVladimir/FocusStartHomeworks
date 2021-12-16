//
//  ViewController.swift
//  URLTableView
//
//  Created by Владимир Втулкин on 13.12.2021.
//

import UIKit
protocol IURLViewController
{
	
}

final class URLViewController: UIViewController {
	
	private let ui: IURLView = URLView()
	private let presenter: IURLPresenter = URLPresenter()

	override func loadView() {
		self.view = self.ui as? UIView
		self.presenter.load(view: self.ui)
	}

	init(network: NetworkServices) {
		super.init(nibName: nil, bundle: nil)
		self.presenter.set(network: network)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension URLViewController: IURLViewController
{
	
}
