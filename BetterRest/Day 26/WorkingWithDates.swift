/// Source:
/// https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates

import SwiftUI





struct WorkingWithDates: View {
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack(spacing: 20) {
            /// The first option is to rely on the `format` parameter:
            Text(Date.now,
                 format: .dateTime.hour().minute())
            Text(Date.now,
                 format: .dateTime.day().month().year())
            /// As an alternative,
            /// we can use the `formatted()` method directly on dates,
            /// passing in configuration options for
            /// how we want both the `date` and the `time` to be formatted, like this:
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .font(.title)
    }
    
    
    
    // MARK: METHODS
    // MARK: HELPER METHODS
    /// CHALLENGE 1:
    func createDefaultWakeUpTime()
    -> Void {
        
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        
        print(date)
    }
    
    /// CHALLENGE 2:
    func readTheHourAndMinute()
    -> Void {
        
        let components = DateComponents()
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        print("Hour: \(hour)\nMinute: \(minute)")
    }
}





// MARK: - PREVIEWS

struct WorkingWithDates_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WorkingWithDates()
    }
}
