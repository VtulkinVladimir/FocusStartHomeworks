//
//  ManufacturerCellAssembly.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 06.12.2021.
//

final class ManufacturerCellAssembly
{
	static func build(manufacturer: Manufacturer) -> ManufacturerTableViewCell {
		let cellView = ManufacturerCellView(manufacturer: manufacturer)
		let cell = ManufacturerTableViewCell()
		cell.set(view: cellView)
		
		return cell
	}
}
