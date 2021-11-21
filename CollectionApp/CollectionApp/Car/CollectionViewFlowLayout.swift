//
//  CollectionViewLayout.swift
//  CollectionApp
//
//  Created by Владимир Втулкин on 18.11.2021.
//

import UIKit

final class CollectionViewFlowLayout: UICollectionViewFlowLayout
{
	override func prepare() {
		super.prepare()
		
		guard let collectionView = self.collectionView else { return }
		
		let width = collectionView.bounds.inset(by: collectionView.layoutMargins).size.width
		
		let screen = UIScreen.main.bounds
		
		let minColumnWidth = (screen.height > screen.width) ? width : width / 2
		let maxNumColumns = Int(width / minColumnWidth)
		let cellWidth = (width / CGFloat(maxNumColumns)).rounded(.down)
		
		self.itemSize = CGSize(width: cellWidth, height: 150)
		self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: self.minimumInteritemSpacing, bottom: 0, right: self.minimumInteritemSpacing)
		self.sectionInsetReference = .fromSafeArea
	}
}
