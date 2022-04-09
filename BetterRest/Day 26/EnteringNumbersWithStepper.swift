/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/entering-numbers-with-stepper

import SwiftUI



struct EnteringNumbersWithStepper: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var sleepAmount: Double = 4.00
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Form {
            Section {
                Stepper("\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.25)
            } header: {
                Text("Amount of sleep")
            }
        }
    }
    
    
    
    // MARK: METHODS
    // MARK: HELPER METHODS
}






// MARK: - PREVIEWS

struct EnteringNumbersWithStepper_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EnteringNumbersWithStepper()
    }
}
