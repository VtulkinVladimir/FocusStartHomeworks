//
//  City+CoreDataProperties.swift
//  CoreDataHomeworks
//
//  Created by Владимир Втулкин on 20.12.2021.
//

import Foundation
import CoreData

extension City
{
	@nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
		return NSFetchRequest<City>(entityName: "City")
	}
	
	@NSManaged public var name: String
	@NSManaged public var woeId: Int64
	@NSManaged public var id: UUID
	@NSManaged public var lastTemp: NSNumber?
	@NSManaged public var weatherImage: Data?

}
