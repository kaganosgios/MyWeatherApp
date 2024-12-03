//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by KağanKAPLAN on 2.12.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the Weather App")
                    .bold()
                    .fontWeight(.bold)
                    .font(.largeTitle)
                
                Text("Please share your current location to get tge weather in your area")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(25.00)
                .symbolVariant(.fill)
                .foregroundColor(.yellow)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
