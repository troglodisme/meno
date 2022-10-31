//
//  BagSelection.swift
//  Meno
//
//  Created by Giulio Ammendola on 24/10/2022.
//

import SwiftUI
import CoreLocation
import MapKit

struct TripDetailView: View {
    
    @ObservedObject var tripViewModel: TripViewModel
    
    var trip: Trip

    @State private var selection: String? = nil
        
    var body: some View {
                
        VStack{
            
            MapView(coordinate: trip.coordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 180)

            VStack() {
                                        
                trip.image
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFit()
                    .overlay {
                        Circle().stroke(.white, lineWidth: 2)
                    }
                    .shadow(radius: 6)
                    .offset(y: -100)
                    
                HStack{
                    
                    VStack(alignment: .leading) {
                        Text(trip.destination)
                            .font(.title)
                            .foregroundColor(.black)
                        
                        VStack(alignment: .leading) {
                            
                            Text("\(trip.departureDate.formatted(.dateTime.day().month())) - \(trip.returnDate.formatted(.dateTime.day().month()))")
                            
                            HStack{
                                Text("\(trip.icon.capitalized)")
                                Image(systemName: trip.icon)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("")
                        Text("17°C")
                        Image(systemName: "cloud.sun")
                    }
                    
                }
                Divider()
                Spacer()
                
                Button {
                    print("test")
                } label: {
                    BackpackView(trip: trip)

                }
                
            }
            .padding()

            
            NavigationLink(destination: ItemsList(), label: {
                Text("Items List")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            

        
        }
        .navigationBarTitle("\(trip.destination)", displayMode: .inline)
    }
}


struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailView(tripViewModel: TripViewModel(), trip:
                        Trip(icon: "tram",
                             destination: "Florence",
                             departureDate: Date.distantPast,
                             returnDate: Date.distantFuture,
                             bagSize: "15L",
                             isArchived: false,
                             coordinate: CLLocationCoordinate2D(latitude: 43.769, longitude: 11.255),
                             image: Image("Firenze")
                             
         )
        )
    }
}


 
