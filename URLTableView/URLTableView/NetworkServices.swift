//
//  NetworkServices.swift
//  URLTableView
//
//  Created by Владимир Втулкин on 14.12.2021.
//

import Foundation

final class NetworkServices
{
	private let urlSession = URLSession(configuration: .default)
	var currentData: Data?
	
	var currentDownloadTask: URLSessionDownloadTask?
		
	func resumeDownload() {
		self.currentDownloadTask?.resume()
	}
	
	func startDownload() {
		self.currentDownloadTask?.resume()
	}
	
	func pause() {
		self.currentDownloadTask?.suspend()
	}
	
	func downloadImage(with url: URL, completion: @escaping(Result<Data, Error>) -> Void) {
		let request = URLRequest(url: url)
		
		self.currentDownloadTask = {
			self.urlSession.downloadTask(with: request) { url, response, error in
				
				if let error = error {
					completion(.failure(error))
				}
				
				if let url = url {
					do {
						let data = try Data(contentsOf: url)
						completion(.success(data))
					}
					catch {
						completion(.failure(error))
					}
				}
			} }()
		
		self.startDownload()		
	}
		
	
}
