//
//  CarsAssembly.swift
//  SOLIDHomeWork
//
//  Created by Владимир Втулкин on 07.12.2021.
//

import Foundation

final class CarsAssembly
{
	static func build() -> CarsViewController {
		
		let view = CarsView()
		let model = CarsData()
		
		let presenter = CarsPresenter(dependencies: .init(view: view, model: model))
		
		let vc = CarsViewController(dependencies: .init(view: view, presenter: presenter))
		
		return vc
	}
}
