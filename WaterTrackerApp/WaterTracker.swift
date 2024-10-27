//
//  SwiftUIView.swift
//  WaterTrackerApp
//
//  Created by Arafat on 23/10/2024.
//

import SwiftUI

struct WaterTracker: View {
    // State variables to hold current water intake and daily goal
    @State private var currentWaterIntake: Double = 0.0
    let dailyGoal: Double // This will be passed from the previous page, calculated from the user's weight
    
    // Images to change dynamically based on progress
    let progressImages = ["zzz", "turtle", "rabbit", "clap"] // Replace with your image asset names
    
    // Function to calculate progress percentage
    var progress: Double {
        return currentWaterIntake / dailyGoal
    }
    
    // Function to determine which image to show based on water intake
    var currentImage: String {
        switch progress {
        case 0:
            return progressImages[0] // "zzz" image when no water is consumed
        case 0.01..<0.5:
            return progressImages[1] // "turtle" image for low water intake
        case 0.5..<1.0:
            return progressImages[2] // "rabbit" image for moderate intake
        default:
            return progressImages[3] // "clap" image when the goal is met
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            // Display water intake progress text
            Text("Today's Water Intake")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.bottom, 5)
            
            Text("\(String(format: "%.1f", currentWaterIntake)) liter / \(String(format: "%.1f", dailyGoal)) liter")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(currentWaterIntake >= dailyGoal ? .green : .primary)
                .padding(.bottom, 20)
            
            // Circular progress indicator and dynamic image
            ZStack {
                // Circular progress view background
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                    .frame(width: 200, height: 200)
                
                // Circular progress overlay to show intake progress
                Circle()
                    .trim(from: 0.0, to: CGFloat(progress))
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 200, height: 200)
                
                // Image that changes based on the water intake
                Image(systemName: currentImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
            }
            .padding(.bottom, 40)
            
            // Water intake control buttons (+ and -)
            HStack {
                // Decrease button
                Button(action: {
                    if currentWaterIntake > 0 {
                        currentWaterIntake -= 0.5
                    }
                }) {
                    Image(systemName: "minus")
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                Text("\(String(format: "%.1f", currentWaterIntake)) L")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                
                // Increase button
                Button(action: {
                    if currentWaterIntake < dailyGoal {
                        currentWaterIntake += 0.5
                    }
                }) {
                    Image(systemName: "plus")
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct WaterTracker_Previews: PreviewProvider {
    static var previews: some View {
        WaterTracker(dailyGoal: 2.7)
    }
}

