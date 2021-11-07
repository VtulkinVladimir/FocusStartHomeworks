//
//  main.swift
//  ThreadSafeArray
//
//  Created by Владимир Втулкин on 07.11.2021.
//

import Foundation

var safeArray  = ThreadSafeArray<String>()

let queue = DispatchQueue.global(qos: .userInteractive)

queue.async {
	for number in 0...1000 {
		safeArray.append("one \(number)")
	}
}

queue.async {
	for number in 0...1000 {
		safeArray.append("two \(number)")
	}
}

sleep(2)
print(safeArray.count) // выводит 2002

queue.async {
	safeArray.remove(at: 2001)
}

queue.async {
	safeArray.remove(at: 2001)
}

sleep(1)
print(safeArray.count) // выводит 2001

let subScript = safeArray[200]
print(subScript) // выводит элемент

let contains = safeArray.contains("one 187")
print(contains) // выводит true
