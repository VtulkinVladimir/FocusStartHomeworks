//
//  main.swift
//  homework-1
//
//  Created by Владимир Втулкин on 28.10.2021.
//
import Foundation
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

func start() {
	switch strongReadLine("""
	1) Добавление нового автомобиля
	2) Вывод списка добавленных автомобилей
	3) Вывод списка автомобилей с использованием фильтра по типу кузова
	0) Выход
	""") {
	case "1" : addCar()
	case "2": printAllInfo()
	case "3": sorting()
	case "0" : run = false
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

func choiseBody() -> Body? {
	let response = strongReadLine("""
	Выберите тип кузова из предложенных ниже:
	1) Седан
	2) Купе
	3) Универсал
	4) Джип
	5) Хэтчбэк
	""")
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

func sorting() {
	if let body = choiseBody() {
		sort(body: body)
	}
}

func sort(body: Body) {
	for car in cars {
		if car.body == body {
			printInfo(car: car)
		}
	}
}

greeting()
func work() {
	while run {
		start()
	}
}
