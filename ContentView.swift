//
//  ContentView.swift
//  WeatherApp
//
//  Created by KağanKAPLAN on 2.12.2024.
//

import SwiftUI

struct ContentView: View {
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack{
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }else{
                if locationManager.isLoading {
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                    
                }
            }
            
        }.background(Color(hue: 0.608, saturation: 0.919, brightness: 0.357))
            .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
