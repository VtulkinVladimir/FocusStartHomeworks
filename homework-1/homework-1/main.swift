//
//  main.swift
//  homework-1
//
//  Created by Владимир Втулкин on 28.10.2021.
//
import Foundation

enum Commands: String, CaseIterable
{
	case add = "Добавление нового автомобиля"
	case print = "Вывод списка добавленных автомобилей"
	case filtered = "Вывод списка автомобилей с использованием фильтра по типу кузова"
	case exit = "Выход"
}

var cars = [Car]()
var run = true

func strongReadLine(_ text: String) -> String {
	print(text)
	if let input = readLine(), input.isEmpty == false {
		return input
	} else {
		print("Ошибка ввода данных")
		return strongReadLine(text)
	}
}

func weakReadLine(_ text: String) -> String? {
	print(text)
	return readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
}

func greeting() {
	switch strongReadLine("""
	Добро пожаловать, выберите желаемое действие:
	1) Старт
	0) Выход
	""") {
	case "1": work()
	case "0": run = false
	default:
		print("Ошибка ввода, введите цифру")
		greeting()
	}
}

func buildMenu() -> String {
	var result = "\n Выберите действие"
	for (index, command) in Commands.allCases.enumerated() {
		result += "\n\(index) - \(command.rawValue)"
	}
	return result
}

func start() {
	let menuString = buildMenu()
	switch strongReadLine(menuString) {
	case "0" : addCar()
	case "1" : printAllInfo()
	case "2" : filtration()
	case "3" : run = false
	default: start()
	}
}

func addCar() {
	let manufacturer = strongReadLine("Введите имя производителя")
	
	let model = strongReadLine("Введите название модели")
	
	guard let body = choiseBody() else {
		print("Ошибка ввода данных")
		return
	}
	
	let year = getYear()
	
	let number = weakReadLine("Введите гос. номер автомобиля")
	
	let newCar = Car(manufacturer: manufacturer, model: model, body: body, yearOfIssue: year, number: number)
	cars.append(newCar)
}

func getYear() -> Int? {
	if let year = weakReadLine("Введите год выпуска"), let yearOfIssue = Int(year) {
		return yearOfIssue
	} else {
		return nil
	}
}

func buildBodyList() -> String {
	var resultString = "\n Выберите тип кузова:"
	for (index, body) in Body.allCases.enumerated() {
		resultString += "\n\(index) - \(body.rawValue)"
	}
	return resultString
}

func choiseBody() -> Body? {
	let text = buildBodyList()
	let response = strongReadLine(text)
	guard let index = Int(response) else { return nil }
	return Body(index: index)
}

func printAllInfo() {
	if cars.isEmpty {
		print("Нет данных. Добавьте новый автомобиль")
	} else {
		for car in cars {
			printInfo(car: car)
		}
	}
}

func printInfo(car: Car) {
	var info = "manufacturer: \(car.manufacturer), model: \(car.model), body: \(car.body.rawValue), "
	if let year = car.yearOfIssue {
		info += "year of issue: \(year)"
	} else {
		info += "year of issue: -"
	}
	if let number = car.number {
		if !number.isEmpty {
			info += ", number: \(number)"
		}
	}
	print(info)
}

func filtration() {
	if let body = choiseBody() {
		cars.filter { $0.body == body }.forEach { printInfo(car: $0) }
	}
}

greeting()
func work() {
	while run {
		start()
	}
}
