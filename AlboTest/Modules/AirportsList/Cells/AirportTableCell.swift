//
//  AirportTableCell.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 22/04/21.
//

import UIKit

class AirportTableCell: UITableViewCell {
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let distanceLabel = UILabel()
    let airportSizeLabel = UILabel()
    let lineSeparator = UIView()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AirportTableCell {
    private func setupLabel(withLabel label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
    }
}

extension AirportTableCell {
    private func setupViews() {
        setupContentView()
        setupNameLabel()
        setupAddressLabel()
        setupDistanceLabel()
        setupAirportSizeLabel()
        setupLineSeparator()
    }
    
    private func setupLineSeparator() {
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.backgroundColor = .lightGray
        self.contentView.addSubview(lineSeparator)
    }
    
    private func setupAirportSizeLabel() {
        setupLabel(withLabel: airportSizeLabel)
        airportSizeLabel.font = .systemFont(ofSize: 12)
        airportSizeLabel.textColor = .darkGray
        airportSizeLabel.textAlignment = .right
        self.contentView.addSubview(airportSizeLabel)
    }
    
    private func setupDistanceLabel() {
        setupLabel(withLabel: distanceLabel)
        distanceLabel.font = .systemFont(ofSize: 12)
        distanceLabel.textColor = .darkGray
        distanceLabel.textAlignment = .right
        self.contentView.addSubview(distanceLabel)
    }
    
    private func setupAddressLabel() {
        setupLabel(withLabel: addressLabel)
        addressLabel.font = .systemFont(ofSize: 16)
        addressLabel.textColor = .gray
        addressLabel.textAlignment = .left
        self.contentView.addSubview(addressLabel)
    }
    
    private func setupNameLabel() {
        setupLabel(withLabel: nameLabel)
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left
        self.contentView.addSubview(nameLabel)
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
    }
    
    private func setupConstraints() {
        // nameLabel
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: distanceLabel.leadingAnchor, constant: -15).isActive = true
        
        // distanceLabel
        distanceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        distanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        distanceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // addressLabel
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: airportSizeLabel.leadingAnchor, constant: -15).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: contentView.getBottomAnchor(), constant: -10).isActive = true
        
        // airportSizeLabel
        airportSizeLabel.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 10).isActive = true
        airportSizeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        airportSizeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // lineSeparator
        lineSeparator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        lineSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        lineSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        lineSeparator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

    }
}
