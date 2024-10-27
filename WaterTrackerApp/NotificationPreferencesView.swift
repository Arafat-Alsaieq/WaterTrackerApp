//
//  SwiftUIView.swift
//  WaterTrackerApp
//
//  Created by Arafat on 23/10/2024.
//

import SwiftUI

struct NotificationPreferencesView: View {
    // State variables to hold the selected times and interval
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var selectedInterval: Int = 15 // Default to 15 minutes
    
    // Available intervals in minutes
    let intervals = [15, 30, 60, 90, 120, 180, 240, 300]
    
    var body: some View {
        VStack {
            Spacer()
            
            // Title and description
            Text("Notification Preferences")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text("The start and End hour")
                .font(.headline)
                .padding(.bottom, 2)
            
            Text("Specify the start and end time to receive the notifications")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            // Time pickers for start and end times
            HStack {
                VStack(alignment: .leading) {
                    Text("Start hour")
                        .font(.headline)
                    DatePicker("", selection: $startTime, displayedComponents: [.hourAndMinute])
                        .labelsHidden()
                }
                
                VStack(alignment: .leading) {
                    Text("End hour")
                        .font(.headline)
                    DatePicker("", selection: $endTime, displayedComponents: [.hourAndMinute])
                        .labelsHidden()
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
            
            // Notification interval section
            Text("Notification interval")
                .font(.headline)
                .padding(.bottom, 2)
            
            Text("How often would you like to receive notifications within the specified time interval")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            // Grid for selecting intervals
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(intervals, id: \.self) { interval in
                    Button(action: {
                        selectedInterval = interval
                    }) {
                        Text("\(interval / 60 > 0 ? "\(interval / 60) Hours" : "\(interval) Mins")")
                            .padding()
                            .frame(width: 80, height: 50)
                            .background(selectedInterval == interval ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedInterval == interval ? .white : .blue)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
            
            // Start button
            Button(action: {
                // Implement logic to start notifications here
                startNotifications()
            }) {
                Text("Start")
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
    
    // Function to handle starting notifications
    func startNotifications() {
        // Logic to schedule notifications between startTime and endTime
        // and repeat based on the selectedInterval (in minutes)
        print("Start Time: \(startTime)")
        print("End Time: \(endTime)")
        print("Interval: \(selectedInterval) minutes")
    }
}

struct NotificationPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreferencesView()
    }
}

