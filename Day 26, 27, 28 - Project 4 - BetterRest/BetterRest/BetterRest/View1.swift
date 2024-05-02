//
//  ContentView.swift
//  BetterRest
//
//  Created by Ali Osman Öztürk on 1.05.2024.
//

import SwiftUI

struct View1: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)


        }
        .padding()
    }
    
}

#Preview {
    View1()
}
