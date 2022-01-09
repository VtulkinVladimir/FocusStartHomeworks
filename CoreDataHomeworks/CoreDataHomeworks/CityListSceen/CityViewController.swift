//
//  ViewController.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 18.12.2021.
//

import UIKit

protocol ICityViewController
{

}

class CityViewController: UIViewController {
	
	private let ui: ICityView
	private let presenter: ICityPresenter

	override func loadView() {
		self.view = self.ui as? UIView
		self.presenter.loadView()
        self.navigationItem.title = "Weather"
        self.navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.didTapAdd))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
	}
	struct Dependencies
	{
		let view: ICityView
		let presenter: ICityPresenter
	}
	
	init(dependencies: Dependencies) {
		self.ui = dependencies.view
		self.presenter = dependencies.presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func didTapAdd() {
		self.presenter.didTapAdd()
	}
}

extension CityViewController: ICityViewController
{
	
}
