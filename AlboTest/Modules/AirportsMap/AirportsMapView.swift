//
//  AirportsMapView.swift
//  AlboTest
//
//  Created by Ezequiel Barreto on 21/04/21.
//  
//

import CoreLocation
import UIKit
import MapKit

class AirportsMapView: UIViewController {
    private let mapView = MKMapView()
    private let noPermissionGrantedLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK: Properties
    var presenter: AirportsMapPresenterProtocol?
    
    // MARK: Private
    var locationManager: CLLocationManager?
}

extension AirportsMapView: AirportsMapViewProtocol {
    func showAirports(withAirports airports: Airports) {
        print(generateLocations(withAirpots: airports).count)
        mapView.addAnnotations(generateLocations(withAirpots: airports))
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    func askForLocalizationPermission() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        if locationManager!.authorizationStatus == .denied || locationManager?.authorizationStatus == .notDetermined {
            locationManager?.requestAlwaysAuthorization()
            showNotAllowdedLocalization(true)
        }
        if locationManager!.authorizationStatus == .authorizedAlways || locationManager!.authorizationStatus == .authorizedWhenInUse {
            showNotAllowdedLocalization(true)
        }
    }
}

extension AirportsMapView {
    private func generateLocations(withAirpots airports: Airports) -> [MKPointAnnotation] {
        return airports.response.compactMap { airport in
            let annotation = MKPointAnnotation()
            annotation.title = airport.place.name
            annotation.subtitle = Strings.distance + ": " + airport.relativeTo.getDistanceKM()
            annotation.coordinate = CLLocationCoordinate2D(latitude: airport.loc.lat,
                                                           longitude: airport.loc.long)
            return annotation
        }
    }
    
    private func showNotAllowdedLocalization(_ show: Bool) {
        noPermissionGrantedLabel.isHidden = !show
        mapView.isHidden = show
    }
}

extension AirportsMapView {
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViews() {
        setupView()
        setupMapView()
        setupNoPermissionGrantedLabel()
    }
    
    private func setupNoPermissionGrantedLabel() {
        noPermissionGrantedLabel.translatesAutoresizingMaskIntoConstraints = false
        noPermissionGrantedLabel.text = Strings.noLocalizationPermission
        noPermissionGrantedLabel.numberOfLines = 0
        noPermissionGrantedLabel.font = .systemFont(ofSize: 18)
        noPermissionGrantedLabel.textColor = .darkGray
        noPermissionGrantedLabel.textAlignment = .center
        noPermissionGrantedLabel.isHidden = true
        self.view.addSubview(noPermissionGrantedLabel)
    }
    
    private func setupMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        self.view.addSubview(mapView)
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        // mapView
        mapView.topAnchor.constraint(equalTo: view.getTopAnchor()).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.getBottomAnchor()).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // noPermissionGrantedLabel
        noPermissionGrantedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        noPermissionGrantedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noPermissionGrantedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        noPermissionGrantedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}

extension AirportsMapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        if annotation.title == Strings.you {
            let userAnnotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "user")
            userAnnotationView.canShowCallout = true
            return userAnnotationView
        }
        
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        annotationView.canShowCallout = true
       
        return annotationView
    }
}

extension AirportsMapView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            self.showNotAllowdedLocalization(false)
            locationManager?.startUpdatingLocation()
            
        } else {
            self.showNotAllowdedLocalization(true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        if let location = locations.last {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(region, animated: true)
            
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = locValue
            annotation.title = Strings.you
            annotation.subtitle = Strings.currentLocation
            
            mapView.addAnnotation(annotation)
        }
        
        let latitude = Double(locValue.latitude)
        let longitude = Double(locValue.longitude)
        
        locationManager?.stopUpdatingLocation()
        locationManager?.delegate = nil
        presenter?.localizationObtained(latitud: latitude, longitud: longitude)
    }
}
