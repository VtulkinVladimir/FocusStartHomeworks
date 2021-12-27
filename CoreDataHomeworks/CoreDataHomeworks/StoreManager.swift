//
//  StoreManager.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 18.12.2021.
//

import Foundation
import CoreData

protocol IStoreManager {
	func addCity(city: CityModel)
//	func removeCompany()
	func retriveCity() -> [CityModel]?
	var notify: (() -> Void)? { get set }
	func updateCity(in city: CityModel)
	func removeCity(_ city: CityModel)
//	func save()
}


final class StoreManager
{
	var notify: (() -> Void)?
	
	private lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "CoreDataHomeworks")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
	
	func saveContext () {
		let context = persistentContainer.viewContext
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
		self.notify?()
	}
	
	private func findCity(with id: UUID) -> City? {
		do {
			let predicate = NSPredicate(format: "id == %@", id as CVarArg)
			let request = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
			request.predicate = predicate
			let citys = try self.viewContext.fetch(request)
			if let cityDB = citys.first as? City {
				return cityDB
			}
		} catch {
			assertionFailure("Error \(error.localizedDescription)")
		}
		return nil
	}
	
	private lazy var viewContext = self.persistentContainer.viewContext
	private lazy var backgroundContext = self.persistentContainer.newBackgroundContext()
}

extension StoreManager: IStoreManager
{
	func retriveCity() -> [CityModel]? {
		if let citys: [City] = try? self.viewContext.fetch(City.fetchRequest()) as? [City] {
			let citysModels: [CityModel] = citys.map { city in
				CityModel(city: city)
			}
			return citysModels
		}
		return nil
	}
	
	func addCity(city: CityModel) {
		let newCity = City(context: self.viewContext)
		newCity.name = city.name
		newCity.woeId = Int64(city.woeId)
		newCity.id = city.id
		self.saveContext()
	}
	
	func removeCompany() {
		//
	}
	
	func updateCity(in city: CityModel) {
		guard let newTemp = city.lastTemp else { return }
		guard let weatherImage = city.lastWeatherImage else { return }
		guard let city = self.findCity(with: city.id) else { return }
		
		city.lastTemp = NSNumber(value: newTemp)
		city.weatherImage = weatherImage
//		print("тут запомнилась погода \(weatherImage)")
		self.saveContext()
	}
	
	func removeCity(_ city: CityModel) {
		guard let city = self.findCity(with: city.id) else { return }
		self.viewContext.delete(city)
		self.saveContext()
	}
}
