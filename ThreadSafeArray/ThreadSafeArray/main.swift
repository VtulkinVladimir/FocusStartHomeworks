//
//  main.swift
//  ThreadSafeArray
//
//  Created by Владимир Втулкин on 09.11.2021.
//

import Foundation

var safeArray  = ThreadSafeArray<String>()

let queue = DispatchQueue.global(qos: .userInteractive)

let group = DispatchGroup()

group.enter()
queue.async {
	for number in 0...1000 {
		safeArray.append("one \(number)")
	}
	group.leave()
}

group.enter()
queue.async {
	for number in 0...1000 {
		safeArray.append("two \(number)")
	}
	group.leave()
}

group.wait()

print(safeArray.count) // выводит 2002

group.enter()
queue.async {
	safeArray.remove(at: 2001)
	group.leave()
}

group.enter()
queue.async {
	safeArray.remove(at: 2001)
	group.leave()
}

group.wait()
print(safeArray.count) // выводит 2001

let subScript = safeArray[200]
print(subScript) // выводит элемент

if let string = subScript {
	print(safeArray.contains(string))
}
 // выводит true
