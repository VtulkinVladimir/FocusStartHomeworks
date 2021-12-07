//
//  MainScreenView.swift
//  CollectionAppArchitecture
//
//  Created by Владимир Втулкин on 27.11.2021.
//

import UIKit
import SnapKit

final class MainScreenView: UIView
{
	var didTapCellHandler: ((Int)->Void)?
	var needCarOnIndexHandler: ((Int) -> CarMVCModel?)?
	var needCountHandler: (() -> Int?)?

	private lazy var collectionView: UICollectionView = {
		let flowLayout = CollectionViewFlowLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.alwaysBounceVertical = true
		collectionView.register(CarCollectionCell.self, forCellWithReuseIdentifier: CarCollectionCell.identifier)
		collectionView.delegate = self
		collectionView.dataSource = self
		
		return collectionView
	}()
	
	init() {
		super.init(frame: .zero)
		self.configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		self.addSubview(self.collectionView)
		self.collectionView.snp.makeConstraints { maker in
			maker.edges.equalToSuperview()
		}
	}
}

extension MainScreenView: UICollectionViewDataSource
{
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarCollectionCell.identifier, for: indexPath) as! CarCollectionCell
		cell.car = self.needCarOnIndexHandler?(indexPath.row)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let count = self.needCountHandler?() else { return 0 }
		return count
	}
}

extension MainScreenView: UICollectionViewDelegate
{
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.didTapCellHandler?(indexPath.row)
	}
}
