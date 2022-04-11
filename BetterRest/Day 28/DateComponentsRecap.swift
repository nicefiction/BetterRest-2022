/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates
/// `Date` encapsulates the year, month, date, hour, minute, second, timezone, and more.
/// However, we don’t want to think about most of that.
/// Swift has a slightly different type for that purpose, called `DateComponents`,
/// which lets us read or write specific parts of a date rather than the whole thing.

import SwiftUI



struct DateComponentsRecap: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var wakeUpTime: Date = Date.now
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack(spacing: 20) {
            /// OPTION 1:
            Text("\(wakeUpTime.formatted(date: .omitted, time: .shortened))")
                .font(.largeTitle)
                .bold()
            /// OPTION 2:
            Text("\(wakeUpTime)")
                .font(.subheadline)
            Text("\(wakeUpTime, format: .dateTime.day().month().year())")
                .font(.largeTitle)
            Text("\(wakeUpTime, format: .dateTime.hour().minute())")
                .font(.largeTitle)
        }
    }

    
    
    // MARK: - METHODS
    func createRangeBetweenTodayAndTomorrow()
    -> ClosedRange<Date> {
        
        let today = Date.now
        let tomorrow = today.addingTimeInterval(86_400)
        let range = today...tomorrow
        
        return range
    }
    
    
    
    // MARK: - HELPERMETHODS
}





// MARK: - PREVIEWS

struct DateComponentsRecap_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DateComponentsRecap()
    }
}
