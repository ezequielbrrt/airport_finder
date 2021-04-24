//
//  InitialView.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import Foundation
import UIKit

class InitialView: UIViewController {
    private let titleLabel = UILabel()
    private let radiusLabel = UILabel()
    private let radiusSlider = UISlider()
    private let radiusKMDescription = UILabel()
    private let searchButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK: Properties
    var presenter: InitialPresenterProtocol?
    
    // MARK: Private
    @objc private func sliderValueDidChange(_ sender: UISlider) {
        presenter?.userSlideRadius(withValue: sender.value)
    }
    
    @objc private func userTapOnSearchButton() {
        presenter?.userTapOnSearch()
    }
}

extension InitialView: InitialViewProtocol {
    func showInformation(withValue value: String, isButtonEnable: Bool) {
        radiusLabel.text = value
        searchButton.isEnabled = isButtonEnable
        searchButton.backgroundColor = isButtonEnable ? .systemBlue : .lightGray
    }
}

extension InitialView {
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViews() {
        setupContentView()
        setupTitleLabel()
        setupRadiusLabel()
        setupRadiusSlider()
        setupRadiusKMDescription()
        setupSearchButton()
    }
    
    private func setupSearchButton() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.layer.cornerRadius = 10
        searchButton.setTitle(Strings.search, for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.addTarget(self, action: #selector(userTapOnSearchButton), for: .touchUpInside)
        self.view.addSubview(searchButton)
    }
    
    private func setupRadiusKMDescription() {
        radiusKMDescription.translatesAutoresizingMaskIntoConstraints = false
        radiusKMDescription.font = .systemFont(ofSize: 15)
        radiusKMDescription.textColor = .gray
        radiusKMDescription.text = Strings.radiusKm
        self.view.addSubview(radiusKMDescription)
    }
    
    private func setupRadiusSlider() {
        radiusSlider.translatesAutoresizingMaskIntoConstraints = false
        radiusSlider.minimumValue = 0
        radiusSlider.maximumValue = 100
        radiusSlider.isContinuous = true
        radiusSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        self.view.addSubview(radiusSlider)
    }
    
    private func setupRadiusLabel() {
        radiusLabel.translatesAutoresizingMaskIntoConstraints = false
        radiusLabel.font = .systemFont(ofSize: 70)
        radiusLabel.textColor = .black
        self.view.addSubview(radiusLabel)
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints =  false
        titleLabel.font = .boldSystemFont(ofSize: 40)
        titleLabel.text = Strings.airportFinder
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .darkGray
        self.view.addSubview(titleLabel)
    }
    
    private func setupContentView() {
        self.view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        // titleLabel
        titleLabel.topAnchor.constraint(equalTo: view.getTopAnchor(), constant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // radiusLabel
        radiusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        radiusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        
        // radiusSlider
        radiusSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        radiusSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        radiusSlider.topAnchor.constraint(equalTo: radiusLabel.bottomAnchor, constant: 10).isActive = true
        
        // radiusKMDescription
        radiusKMDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        radiusKMDescription.topAnchor.constraint(equalTo: radiusSlider.bottomAnchor, constant: 10).isActive = true
        
        // searchButton
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: view.getBottomAnchor(), constant: -30).isActive = true
    }
}
