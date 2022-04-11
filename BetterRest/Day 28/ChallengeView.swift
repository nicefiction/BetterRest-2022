/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/betterrest-wrap-up

import CoreML
import SwiftUI



struct ChallengeView: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var wakeUpTime: Date = defaultWakeUpTime
    @State private var amountOfSleep: Double = 4.00
    @State private var amountOfCoffeeCups: Int = 1
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var isShowingAlert: Bool = false
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    static var defaultWakeUpTime: Date {
        
        var wakeUpTimeComponents = DateComponents.init()
        wakeUpTimeComponents.hour = 8
        wakeUpTimeComponents.minute = 0
        
        return Calendar.current.date(from: wakeUpTimeComponents) ?? Date.now
    }
    
    
    var body: some View {
        
        NavigationView {
            Form {
                DatePicker("I'd like to wake up at...",
                           selection: $wakeUpTime,
                           displayedComponents: .hourAndMinute)
                Section {
                    Stepper("\(amountOfSleep.formatted()) hours",
                            value: $amountOfSleep,
                            in: 4...12,
                            step: 0.25)
                } header: {
                    Text("Amount of sleep")
                }
                Section(header: Text("Total cups of coffee")) {
                    Picker("Total cups of coffee...",
                           selection: $amountOfCoffeeCups) {
                        ForEach(1...20,
                                id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("My Bedtime",
                       action: calculateBedTime)
            }
            .alert(alertTitle,
                   isPresented: $isShowingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    
    
    // MARK: - METHODS
    
    func calculateBedTime()
    -> Void {
        
        do {
            let mlModelConfigurator = MLModelConfiguration.init()
            let sleepCalculator = try SleepCalculator.init(configuration: mlModelConfigurator)
            
            let wakeUpTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
            let hoursConvertedToSeconds = (wakeUpTimeComponents.hour ?? 0) * 60 * 60
            let minutesConvertedToSeconds = (wakeUpTimeComponents.minute ?? 0) * 60
            
            let prediction = try sleepCalculator.prediction(wake: Double(hoursConvertedToSeconds + minutesConvertedToSeconds),
                                                            estimatedSleep: amountOfSleep,
                                                            coffee: Double(amountOfCoffeeCups))
            let bedtime = wakeUpTime - prediction.actualSleep
            
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = "\(bedtime.formatted(.dateTime.hour().minute()))"
            
        } catch let error {
            alertTitle = "Error"
            alertMessage = error.localizedDescription
        }
        
        isShowingAlert.toggle()
    }
    
    
    
    // MARK: - HELPERMETHODS
}





// MARK: - PREVIEWS

struct ChallengeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ChallengeView()
    }
}
