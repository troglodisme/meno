//
//  TripView.swift
//  Meno
//
//  Created by Giulio Ammendola on 25/10/2022.
//

import SwiftUI
import CoreLocation

//This view is used on the home page to visualise the key information about a trip in the list
struct TripRowView: View {
    
    var trip: Trip
    
    var body: some View {
            
            HStack{
                
                //this should be a parameter that can be changed for each trip
                Image(systemName: trip.icon)
                    .font(Font.system(.largeTitle))
                
                VStack (alignment: .leading){
                    Text(trip.destination)
                        .font(.headline)
                    
                    Text(trip.departureDate.formatted())
                        .font(.subheadline)
                    
                    Text(trip.bagSize.capitalized)
                        .font(.subheadline)
                    
                }
                .padding()
            }

    }

    
}

struct TripRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        TripRowView(trip: Trip(icon: "questionmark",
                               destination: "Which City?",
                               departureDate: Date.distantPast,
                               returnDate: Date.now,
                               bagSize: "Which Size?",
                               isArchived: true,
                               coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141),
                               image: Image("Firenze")

            )
        )
    }
}
