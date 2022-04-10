// MARK: - LIBRARIES
import SwiftUI



// MARK: - ContentView.swift
struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var sleepAmount: Double = 9.00
    @State private var wakeUpTime: Date = Date.now
    @State private var amountOfCoffeeCups: Int = 1
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        NavigationView {
            VStack {
                DatePicker("Wake me up at",
                           selection: $wakeUpTime,
                           displayedComponents: .hourAndMinute)
                Text("Amount of sleep:")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours of sleep",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.10)
                Text("Amount of coffee cups:")
                    .font(.headline)
                Stepper("\(amountOfCoffeeCups) \(amountOfCoffeeCups == 1 ? "cup" : "cups")",
                        value: $amountOfCoffeeCups,
                        in: 1...10)
            }
            .padding()
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate Bedtime",
                       action: calculateBedtime)
            }
        }
    }
    
    
    
    // MARK: METHODS
    // MARK: HELPER METHODS
    func calculateBedtime()
    -> Void {
        
        print("Calculating the wake-up time.")
    }
}





// MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
