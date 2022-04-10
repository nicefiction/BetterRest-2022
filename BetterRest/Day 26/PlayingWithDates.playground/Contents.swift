import SwiftUI


func calculateDateRange()
-> Void {
    
    let now = Date.now
    let tomorrow = now.addingTimeInterval(86_400)
    let range = now...tomorrow
    
    print(range)
}


calculateDateRange() // 2022-04-09 16:15:13 +0000...2022-04-10 16:15:13 +0000



var components = DateComponents()
components.hour = 8
components.minute = 0

let date = Calendar.current.date(from: components) ?? Date.now
print(date) // 0001-01-01 07:42:30 +0000

/// `DatePicker` is bound to a `Date`
/// giving us lots of information,
/// so we need to find a way to pull out just the `hour` and `minute` components:

let formattedComponents = Calendar.current.dateComponents([.hour, .minute],
                                                          from: Date.now)
print(formattedComponents)

let hour = formattedComponents.hour ?? 0
let minute = formattedComponents.minute ?? 0




func createDefaultWakeUpTime()
-> Void {
    
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? Date.now
    
    print("Create Default wake up time: \(date)")
}



func readTheHourAndMinute()
-> Void {
    
    let components = DateComponents()
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    
    print("Hour: \(hour)\nMinute: \(minute)")
}


createDefaultWakeUpTime()
readTheHourAndMinute()

