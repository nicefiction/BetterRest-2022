/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/entering-numbers-with-stepper

import SwiftUI



struct EnteringNumbersWithStepper: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var sleepAmount: Double = 0.00
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Form {
            Stepper("\(sleepAmount.formatted()) hours",
                    value: $sleepAmount,
                    in: 4...12,
                    step: 0.25)
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
