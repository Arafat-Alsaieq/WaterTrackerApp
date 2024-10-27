//
//  SwiftUIView.swift
//  WaterTrackerApp
//
//  Created by Arafat on 23/10/2024.
//

import SwiftUI

struct WaterTrackerView: View {
    @State private var weight: String = ""
    @State private var waterIntake: Double? = nil
    
    var body: some View {
        VStack {
            Spacer()
            
            // App logo (water drop) and title
            Image(systemName: "drop.fill")
                .foregroundColor(Color.blue)
                .font(.system(size: 80))
                .padding(.bottom, 20)
            
            Text("Hydrate")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
            
            // Body weight input field
            HStack {
                Text("Body weight")
                    .font(.headline)
                TextField("Value", text: $weight)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
            }
            .padding(.bottom, 20)
            
            // Display calculated water intake if available
            if let intake = waterIntake {
                Text("You should drink \(String(format: "%.2f", intake)) liters of water daily.")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
            }
            
            // Next button
            Button(action: calculateWaterIntake) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding()
    }
    
    // Function to calculate water intake based on weight
    func calculateWaterIntake() {
        if let weightInKg = Double(weight) {
            // The formula to calculate water intake: 35 ml per kg of body weight
            waterIntake = (weightInKg * 35) / 1000 // Convert to liters
        }
    }
}

struct WaterTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerView()
    }
}

