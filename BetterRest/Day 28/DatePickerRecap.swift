/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/selecting-dates-and-times-with-datepicker
/// SwiftUI gives us a dedicated picker type
/// called `DatePicker`
/// that can be bound to a date property.
/// Swift has a dedicated type for working with dates,
/// and it is called – unsurprisingly – `Date`.

import SwiftUI



struct DatePickerRecap: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var todayTime: Date = Date.now
    
    
    
    // MARK: - PROPERTIES
//    static var tomorrow: Date {
//
//        return wakeUpTime + 86_400
//    }
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Form {
            DatePicker("Select a date...",
                       selection: $todayTime)
            .labelsHidden()
            
            DatePicker("Select a date...",
                       selection: $todayTime,
                       displayedComponents: .date)
            
            DatePicker("Select a time...",
            selection: $todayTime,
                       displayedComponents: .hourAndMinute)
            
            DatePicker("Select a future date...",
                       selection: $todayTime,
                       in: todayTime...,
                       displayedComponents: .date)
        }
    }
    
    
    
    // MARK: - METHODS
    func createRangeFromTodayToTomorrow()
    -> ClosedRange<Date> {
        
        // let tomorrow = Date.now + 86_400
        let tomorrow = Date.now.addingTimeInterval(86_400)
        let range = Date.now...tomorrow
        return range
    }
    
    
    
    // MARK: - HELPERMETHODS
}





// MARK: - PREVIEWS

struct DatePickerRecap_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DatePickerRecap()
    }
}
