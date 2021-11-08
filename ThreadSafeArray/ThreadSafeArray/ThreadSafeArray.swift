//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Владимир Втулкин on 09.11.2021.
//

import Foundation

class ThreadSafeArray<T>
{
	private var array = [T]()
	
	private let queue = DispatchQueue(label: "privateQueue", qos: .userInteractive, attributes: .concurrent)
	
	var isEmpty: Bool {
		var result = false
		self.queue.sync {
			result = self.array.isEmpty
		}
		return result
	}

	var count: Int {
		var result = 0
		queue.sync {
			result = self.array.count
		}
		return result
	}

	func append(_ item: T) {
		self.queue.async (flags: .barrier) {
			self.array.append(item)
		}
	}

	func remove(at index: Int) -> Void {
		self.queue.async (flags: .barrier) {
			guard index < self.array.count else { return }
			self.array.remove(at: index)
		}
	}

	subscript(index: Int) -> T? {
		var item: T? = nil
		self.queue.sync {
			guard index >= 0 && index < self.count else { return }
			item = self.array[index]
		}
		return item
	}
}

extension ThreadSafeArray where T: Equatable
{
	func contains(_ element: T) -> Bool {
		var result = false
		self.queue.sync {
			result = self.array.contains(element)
		}
		return result
	}
}
