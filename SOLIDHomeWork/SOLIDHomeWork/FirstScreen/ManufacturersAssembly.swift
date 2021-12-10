//
//  CarsAssembly.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//



final class ManufacturersAssembly
{
	static func build() -> ManufacturersViewController {
		let router = ManufacturersRouter()
		let model = ManufacturersModel()
		let view = ManufacturersView()
		let presenter = ManufacturersPresenter(dependencies: .init(router: router, model: model, view: view))
		let viewController = ManufacturersViewController(dependencies: .init(presenter: presenter, view: view))
		
		let targetController = CarsAssembly.build()
		router.set(currentViewController: viewController)
		router.set(targetViewController: targetController)
		
		return viewController
	}
	
}
