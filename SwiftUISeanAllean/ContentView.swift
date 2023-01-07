//
//  ContentView.swift
//  SwiftUISeanAllean
//
//  Created by MohamedOsama on 01/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    var body: some View {
        ZStack {
            WeatherBackgroundView(isNight: $isNight)
            VStack {
                VStack(spacing: 5) {
                    TopWeatherCity()
                    TopView()
                }
                Spacer()
                VStack(spacing: 5) {
                    WeatherView()
                    Button {
                        isNight.toggle()
                    } label: {
                        Text("Chage My Day!!")
                            .foregroundColor(Color("customcolor"))
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                            .padding()
                            .padding(.horizontal)
                            .background(.white)
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeatherDayView: View {
    var dayName: String
    var temp: Double
    var weatherImage: String
    
    init(dayName: String, temp: Double, weatherImage: String) {
        self.dayName = dayName
        self.temp = temp
        self.weatherImage = weatherImage
    }
    var body: some View {
        VStack(spacing: 10) {
            Text(dayName)
                .font(.system(size: 25, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
            VStack {
                Image(systemName: weatherImage)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text(String(describing: temp.self))
                    .foregroundColor(.white)
            }.font(.system(size: 28, weight: .bold, design: .default))
        }
    }
}

struct WeatherBackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .blue : .black , isNight ? .yellow : Color("customcolor")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct TopView: View {
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("70˚")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherView: View {
    var body: some View {
        HStack(spacing: 30) {
            WeatherDayView(dayName: "Tue", temp: -10, weatherImage: "cloud.sun.bolt.fill")
            WeatherDayView(dayName: "Wed", temp: 10, weatherImage: "cloud.sun.bolt.fill")
            WeatherDayView(dayName: "Thurs", temp: 50, weatherImage: "cloud.sun.bolt.fill")
            WeatherDayView(dayName: "Friday", temp: 30, weatherImage: "cloud.sun.bolt.fill")
        }.padding([.bottom], 50)
    }
}

struct ReusableButton: View {
    @State var isNight: Bool = false
    var body: some View {
        Button {
            isNight.toggle()
        } label: {
            Text("Chage My Day!!")
                .foregroundColor(Color("customcolor"))
                .font(.system(size: 15, weight: .bold, design: .monospaced))
                .padding()
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(10)
        }
    }
}

struct TopWeatherCity: View {
    var body: some View {
        Text("California, USA")
            .font(.system(size: 20, weight: .bold, design: .monospaced))
            .foregroundColor(.white)
            .padding()
    }
}
