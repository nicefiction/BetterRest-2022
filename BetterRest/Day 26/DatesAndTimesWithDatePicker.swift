// MARK: - LIBRARIES

import SwiftUI

struct DatesAndTimesWithDatePicker: View {
    
    // MARK: - PROPERTY WRAPPERS
    @State private var wakeUpTime = Date.now
    
    
    
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Form {
            Section {
                DatePicker("Date:",
                           selection: $wakeUpTime)
                DatePicker("Day only:",
                           selection: $wakeUpTime,
                           displayedComponents: .date)
                DatePicker("Hour only:",
                           selection: $wakeUpTime,
                           displayedComponents: .hourAndMinute)
            }
            
            Section {
                HStack {
                    Spacer()
                    DatePicker("Future dates only:",
                               selection: $wakeUpTime,
                               /// One-sided ranges:
                               in: Date.now... ,
                               displayedComponents: .date)
                    .labelsHidden()
                    Spacer()
                }
            }
        }
    }
    
    
    
    // MARK: METHODS
    // MARK: HELPER METHODS
    func createRangeOfDates()
    -> Void {
        
        let tomorrow = Date.now.addingTimeInterval(86_400)
        let range = Date.now...tomorrow
        print(range)
    }
}





// MARK: - PREVIEWS

struct DatesAndTimesWithDatePicker_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DatesAndTimesWithDatePicker()
    }
}
