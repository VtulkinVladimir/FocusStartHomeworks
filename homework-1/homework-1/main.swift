//
//  main.swift
//  homework-1
//
//  Created by Владимир Втулкин on 28.10.2021.
//
var cars = [Car]()
var run = true

func strongReadLine(_ text: String) -> String {
	print(text)
	if let input = readLine() {
		return input
	} else {
		print("Ошибка ввода данных")
		return strongReadLine(text)
	}
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
	
	guard let body = choiseBody() else { return }
	
	let year = Int(strongReadLine("Введите год выпуска"))
	
	let number = strongReadLine("Введите гос. номер автомобиля")
	
	let newCar = Car(manufacturer: manufacturer, model: model, body: body, yearOfIssue: year, number: number)
	cars.append(newCar)
}

func choiseBody() -> Body? {
	switch strongReadLine("""
	Выберите тип кузова из предложенных ниже:
	1) Седан
	2) Купе
	3) Универсал
	4) Джип
	5) Хэтчбэк
	0) Выход
	""") {
	case "1": return .sedan
	case "2": return .coupe
	case "3": return .universal
	case "4": return .suv
	case "5": return .hatcBack
	case "0": return nil
	default: print("ошибка ввода данных")
		return nil
	}
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

