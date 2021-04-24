//
//  AirportsListView.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import UIKit

class AirportsListView: UIViewController {
    let tableView = UITableView.getDefault()
    let notResultsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViews()
        setupConstraints()
        setupNavigation()
    }
    
    // MARK: Properties
    var presenter: AirportsListPresenterProtocol?
    
    // MARK: Private
    private let airportTableCellId = "AirportTableCell"

}

extension AirportsListView: AirportsListViewProtocol {
    func showAirportsList(withAirports airports: Airports) {
        if airports.response.count == 0 {
            tableView.isHidden = true
            notResultsLabel.isHidden = false
        } else {
            tableView.isHidden = false
            notResultsLabel.isHidden = true
            tableView.reloadData()
        }
    }
    
}

extension AirportsListView: UITableViewDelegate {

}

extension AirportsListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getAirportsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: airportTableCellId, for: indexPath) as? AirportTableCell,
              let airport = presenter?.getAirport(withAiportIndex: indexPath.row) else { fatalError("TableCell Class not found") }
        
        cell.nameLabel.text = airport.place.name
        cell.distanceLabel.text = airport.relativeTo.getDistanceKM()
        cell.addressLabel.text = airport.place.getAddress()
        cell.airportSizeLabel.text = airport.profile.typeENG
        
        return cell
    }
}

extension AirportsListView {
    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Strings.airportList
    }
    
    private func setupViews() {
        setupContentView()
        setupTableView()
        setupNotResultsLabel()
    }
    
    private func setupNotResultsLabel() {
        notResultsLabel.translatesAutoresizingMaskIntoConstraints = false
        notResultsLabel.font = .systemFont(ofSize: 18)
        notResultsLabel.textColor = .darkGray
        notResultsLabel.text = Strings.notResultsFound
        notResultsLabel.textAlignment = .center
        self.view.addSubview(notResultsLabel)
    }
    
    private func setupContentView() {
        self.view.backgroundColor = .white
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(AirportTableCell.self, forCellReuseIdentifier: airportTableCellId)
        self.view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        // tableView
        tableView.topAnchor.constraint(equalTo: view.getTopAnchor()).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.getBottomAnchor()).isActive = true
        
        // notResultsLabel
        notResultsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        notResultsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        notResultsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        notResultsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}
