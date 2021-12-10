//
//  PriceViewModel.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 01.12.2021.
//
final class Notificator
{
	private var subscribers = [ISubscriberPrice]()
	
	func add(subscriber: ISubscriberPrice) {
		self.subscribers.append(subscriber)
	}
	
	func notify(price: Int?) {
		guard let price = price else { return }
		self.subscribers.forEach { $0.notify(price: price) }
	}
}

final class PriceViewModel
{
	private var notificator = Notificator()
	
	private var price: Int? {
		didSet {
			self.notificator.notify(price: self.price)
		}
	}

	func set(price: Int) {
		self.price = price
	}
	
	func load(view: ISubscriberPrice) {
		self.notificator.add(subscriber: view)
		self.notificator.notify(price: self.price)
	}
}
