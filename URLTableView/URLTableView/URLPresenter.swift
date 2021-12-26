//
//  Presenter.swift
//  URLTableView
//
//  Created by Владимир Втулкин on 13.12.2021.
//

import Foundation

protocol IURLPresenter
{
	func load(view: IURLView)
	func set(network: INetworkServices)
}

final class URLPresenter
{
	private var networkServices: INetworkServices?
	private weak var view: IURLView?
	private var dataImage = [Data?]()
	
	private func configureCell(index: Int) -> ImageTableViewCell? {
		let cell = ImageTableViewCell()
		cell.confugire(data: self.dataImage[index])
		return cell
	}
	
	private func downloadImage(url: String) {
		guard let url = URL(string: url) else { return }
		print("download started with url: \(url)")
		self.networkServices?.downloadImage(with: url)
	}
	
	private func pauseDownload() {
		self.networkServices?.pause()
	}
	
	private func continueDownload() {
		self.networkServices?.resumeDownload()
	}
}

extension URLPresenter: IURLPresenter
{
	func set(network: INetworkServices) {
		self.networkServices = network
		
		self.networkServices?.onProgress = {[weak self] progress in
			DispatchQueue.main.async {
				self?.view?.updateProgress(progress: progress)
			}
		}
		
		self.networkServices?.downloadingData = {[weak self] data in
			self?.dataImage.append(data)
			DispatchQueue.main.async {
				self?.view?.reloadTableView()
			}
		}
	}
	
	func load(view: IURLView) {
		self.view = view
		
		self.view?.configureCellhandler = {[weak self] index in
			self?.configureCell(index: index)
		}
		
		self.view?.getNumberOfRowHandler = {[weak self] in
			self?.dataImage.count
		}
		
		self.view?.searchButtonTapHandler = {[weak self] url in
			self?.downloadImage(url: url)
		}
		
		self.view?.pauseButtonTapHandler = {[weak self] in
			self?.pauseDownload()
		}
		
		self.view?.continueButtonTapHandler = {[weak self] in
			self?.continueDownload()
		}
		
		self.view?.configure()
	}
}
