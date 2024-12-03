//
//  WeatherView.swift
//  WeatherApp
//
//  Created by KağanKAPLAN on 3.12.2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading ,spacing: 10){
                    Text("  " + weather.name)
                        .bold().font(.title)
                    
                    Text("   Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud.heavyrain")
                                .font(.system(size : 50))
                            
                            Text(" " + weather.weather[0].main)
                            
                        }
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()

                }
                Spacer()
                    .frame(height: 80)
            }
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing:20){
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min Temperature", value: (weather.main.tempMin.roundDouble() + "°"))
                        
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max Temparature", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity              ", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.608, saturation: 0.919, brightness: 0.357))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            
        }.edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.608, saturation: 0.919, brightness: 0.357))
            .preferredColorScheme(.dark)
        
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
