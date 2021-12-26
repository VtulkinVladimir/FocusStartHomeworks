//
//  NetworkServices.swift
//  URLTableView
//
//  Created by Владимир Втулкин on 14.12.2021.
//

import Foundation

protocol INetworkServices
{
	var onProgress: ((Float) -> Void)? { get set }
	var downloadingData: ((Data) -> Void)? { get set }
	func resumeDownload()
	func pause()
	func downloadImage(with url: URL)
}

final class NetworkServices: NSObject
{
	var onProgress: ((Float) -> Void)?
	var downloadingData: ((Data) -> Void)?
	
	private lazy var urlBackgroundSession: URLSession = {
		let configuration = URLSessionConfiguration.background(withIdentifier: "backgroundSession")
		configuration.sessionSendsLaunchEvents = true
		configuration.shouldUseExtendedBackgroundIdleMode = true
		return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
	}()
	
	private var currentDownloadTask: URLSessionDownloadTask?

	private func startDownload() {
		self.currentDownloadTask?.resume()
	}

	private func configureTask(with url: URL) {
		let request = URLRequest(url: url)
		let task = self.urlBackgroundSession.downloadTask(with: request)
		task.countOfBytesClientExpectsToSend = 512
		task.countOfBytesClientExpectsToReceive = 1000000
		
		self.currentDownloadTask = task
	}
}

extension NetworkServices: INetworkServices
{
	func pause() {
		self.currentDownloadTask?.suspend()
		
	}
	func resumeDownload() {
		self.startDownload()
	}
	
	func downloadImage(with url: URL) {
		self.configureTask(with: url)
		self.startDownload()
	}
}

extension NetworkServices: URLSessionDownloadDelegate
{
	func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
		
		if let data = try? Data(contentsOf: location) {
			self.downloadingData?(data)
		}
		
	}
	
	func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {

		guard totalBytesExpectedToWrite != NSURLSessionTransferSizeUnknown else { return }
		let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
		self.onProgress?(progress)
	}
}
