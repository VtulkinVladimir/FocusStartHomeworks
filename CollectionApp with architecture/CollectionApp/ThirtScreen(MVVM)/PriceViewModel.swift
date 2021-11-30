//
//  PriceViewModel.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 01.12.2021.
//
final class ListnersManager
{
	private var listners = [IListerPrice]()
	
	func add(listner: IListerPrice) {
		self.listners.append(listner)
	}
	
	func notify(price: Int?) {
		guard let price = price else { return }
		self.listners.forEach { $0.notify(price: price) }
	}
}

final class PriceViewModel
{
	private var price: Int? {
		didSet {
			self.listnerManager.notify(price: self.price)
		}
	}
	private var listnerManager = ListnersManager()
	
	func set(price: Int) {
		self.price = price
	}
	
	func load(view: IListerPrice) {
		self.listnerManager.add(listner: view)
		self.listnerManager.notify(price: self.price)
	}
}
