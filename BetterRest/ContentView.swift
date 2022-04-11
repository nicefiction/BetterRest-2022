// MARK: - LIBRARIES
/// `STEP 1`: Import the `CoreML` framework;
import CoreML
import SwiftUI



// MARK: - ContentView.swift
struct ContentView: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var sleepAmount: Double = 9.00
    @State private var wakeUpTime: Date = Date.now
    @State private var amountOfCoffeeCups: Int = 1
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var isShowingAlert: Bool = false
    
    
    
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
                        step: 0.25)
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
            .alert(alertTitle,
                   isPresented: $isShowingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    
    
    // MARK: METHODS
    // MARK: HELPER METHODS
    func calculateBedtime()
    -> Void {
        
        print("Calculating the wake-up time.")
        /// We need to use a do/catch block,
        /// because using Core ML can throw errors in two places:
        /// 1. loading the model as seen above,
        /// 2. but also when we ask for predictions.
        /// Honestly, I can’t think I’ve ever had a prediction fail in my life, but there’s no harm being safe!
        do {
            /// `STEP 2`:
            /// Create an instance of the `SleepCalculator` class;
            let mlModelConfigurator = MLModelConfiguration.init()
            /// That  instance is the thing that reads in all our data, and will output a prediction.
            /// The configuration is there in case you need to enable a handful of what are fairly obscure options
            /// — perhaps folks working in machine learning full time need these;
            let sleepCalculator = try SleepCalculator.init(configuration: mlModelConfigurator)
            
            /// `STEP 3`:
            /// Convert the `wakeUpTime`to a `Double`
            /// so that we can calculate the wake up time:
            let wakeUpTimeComponents = Calendar.current.dateComponents([.minute, .hour],
                                                                       from: wakeUpTime)
            let hourToSeconds = (wakeUpTimeComponents.hour ?? 0) * 60 * 60
            let minuteToSeconds = (wakeUpTimeComponents.minute ?? 0) * 60
            
            /// `STEP 4`
            /// The next step is to feed our values into Core ML and see what comes out.
            /// This is done using the `prediction() `method of our model,
            /// which wants the wake time, estimated sleep, and coffee amount values required
            /// to make a prediction, all provided as `Double` values.
            let prediction = try sleepCalculator.prediction(wake: Double(hourToSeconds + minuteToSeconds),
                                                            estimatedSleep: sleepAmount,
                                                            coffee: Double(amountOfCoffeeCups))
            /// Thanks to Apple’s powerful APIs
            /// you can subtract a value in seconds directly from a `Date`,
            /// and you’ll get back a new `Date`:
            let timeToGoToBed = wakeUpTime - prediction.actualSleep
            let formattedTimeToGoToBed = timeToGoToBed.formatted(date: .omitted,
                                                                 time: .shortened)
            alertTitle = "Your calculated bedtime is..."
            alertMessage = "\(formattedTimeToGoToBed)"
            
        } catch let error {
            alertTitle = "Error"
            alertMessage = error.localizedDescription
        }
        
        isShowingAlert.toggle()
    }
}





// MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
