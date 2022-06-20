//
//  BusinessMap.swift
//  City Sights App
//
//  Created by мас on 09.03.2022.
//

import SwiftUI
import MapKit


struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    @Binding var selectedBusiness: Business?
    
    var locations: [MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        // Create a set of annotations from our list of businesses
        
        for business in model.restaurants + model.sights {
            
            // If the business has a lat/long
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
             
                // Create a new annotation
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
        }
        return annotations
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Make the user show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        // TODO: Set the region
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove all annotations
        
        uiView.removeAnnotations(uiView.annotations)
        
        // Add the ones based on the business
        
        uiView.showAnnotations(self.locations, animated: true)
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
        
    }
    
    // Check if there's a reusable annotation view first
    
    // MARK: - Coordinator class
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
     
        var map: BusinessMap
        
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
                // If the annotation is the user blue dot, return nil
                if annotation is MKUserLocation {
                    return nil
                }
                
                var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
                
                if annotationView == nil {
                        
                    annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                    
                    annotationView!.canShowCallout = true
                    annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                    
                    // Return it
                    
                }
                else {
                    
                    annotationView!.annotation = annotation
                    
                }
                
                return annotationView
                
    }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            // User tapped on the annotation view
            
            // Get the business object that this annotation represents
            // Loop through businesses in the model and find a match
            for business in map.model.restaurants + map.model.sights {
                
                if business.name == view.annotation?.title {
                 
                    // Set the selectedBusiness property to that business object
                    map.selectedBusiness = business
                    return
                }
            }
            
            view.annotation?.title

            // Set the selectedBusiness property to that business object
        }
    }
}
