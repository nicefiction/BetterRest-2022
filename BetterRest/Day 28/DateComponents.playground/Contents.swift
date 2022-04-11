/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/working-with-dates
/// `Date` encapsulates the year, month, date, hour, minute, second, timezone, and more.
/// However, we don’t want to think about most of that.
/// Swift has a slightly different type for that purpose, called `DateComponents`,
/// which lets us read or write specific parts of a date rather than the whole thing.

import Foundation

/// So, if we wanted a date that represented 8am today,
/// we could write code like this:
var dateComponents = DateComponents()
dateComponents.hour = 8
dateComponents.minute = 0

let date = Calendar.current.date(from: dateComponents) ?? Date.now // Jan 1, 1 at 8:00 AM
date // 0001-01-01 07:42:30 +0000
date.formatted() // 1/1/1, 8:00 AM
date.formatted(date: .omitted, time: .shortened) // 8:00 AM
date.formatted(date: .omitted, time: .complete) // 8:00:00 AM GMT+0:17:30
date.formatted(date: .omitted, time: .standard) // 8:00:00 AM


/// `DatePicker` is bound to a `Date`
/// giving us lots of information,
/// so we need to find a way to pull out just the `hour` and `minute` components.
var wakeUpTimeComponents = Calendar.current.dateComponents([.hour, .minute],
                                                           from: Date.now)
let wakeUpHoursInSeconds = (wakeUpTimeComponents.hour ?? 0) * 60 * 60
let wakeUpMinutesInSeconds = (wakeUpTimeComponents.minute ?? 0) * 60

let wakeUpHours = wakeUpTimeComponents.hour ?? 0
let wakeUpMinutes = wakeUpTimeComponents.minute ?? 0
