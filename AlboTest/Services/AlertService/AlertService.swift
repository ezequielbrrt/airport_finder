//
//  AlertService.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//

import UIKit

class AlertService {
    static var shared: AlertService = AlertService()
    
    private let backgroundView: UIView = UIView()
    
    func showError() {
        let alertView = setupBackground()
        
        let errorImageView = UIImageView(image: UIImage(systemName: "xmark"))
        errorImageView.translatesAutoresizingMaskIntoConstraints = false
        errorImageView.contentMode = .scaleToFill
        
        alertView.addSubview(errorImageView)
        
        errorImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        errorImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        errorImageView.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
        errorImageView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
    }
    
    func showLoader() {
        let alertView = setupBackground()
        
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        loader.hidesWhenStopped = true
        loader.color = .systemBlue
        loader.style = .large
        alertView.addSubview(loader)
        
        loader.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
        loader.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
    }
    
    func hideLoader() {
        backgroundView.removeFromSuperview()
    }
    
    private init() {}
    
    private func setupBackground() -> UIView {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first!
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .clear
        window.addSubview(backgroundView)
        
        backgroundView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        
        let alertView = UIView()
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.backgroundColor = .white
        alertView.layer.cornerRadius = 10
        backgroundView.addSubview(alertView)
        
        alertView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        alertView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        alertView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return alertView
    }
}
