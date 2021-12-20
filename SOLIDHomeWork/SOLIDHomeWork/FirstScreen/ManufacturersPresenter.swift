//
//  CarsPresenter.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 05.12.2021.
//
protocol IManufacturersPresenter: AnyObject
{
	func loadView()
}

final class ManufacturersPresenter
{
	private weak var view: IManufacturersView?
	
	private let router: IManufacturersRouter
	private let model: IManufacturersModel
	
	struct Dependencies
	{
		let router: IManufacturersRouter
		let model: IManufacturersModel
		let view: IManufacturersView
	}
	
	init(dependencies: Dependencies) {
		self.router = dependencies.router
		self.model = dependencies.model
		self.view = dependencies.view
	}
	
	private func configureCell(index: Int) -> IManufacturerTableCell {
		
		let manufacturer = self.model.getManufacturer(index: index)
		
		let cell = ManufacturerCellAssembly.build(manufacturer: manufacturer)

		return cell
	}
}

extension ManufacturersPresenter: IManufacturersPresenter
{
	func loadView() {
		self.view?.configureCellHandler = { [weak self] index in
			guard let cell = self?.configureCell(index: index) else { return ManufacturerTableViewCell(frame: .zero)}
			return cell
		}
		
		self.view?.countHandler = { [weak self] in
			return self?.model.getCount() ?? 0
		}
		
		self.view?.tapCellHandler = { [weak self] index in
			guard let manufacturer = self?.model.getManufacturer(index: index) else { return }
			self?.router.next(with: manufacturer)
		}
		
		self.view?.configure()
	}
}
