
import Foundation

let reminderDataURL = URL(fileURLWithPath: "Reminders", relativeTo: FileManager.documentDirectoryURL)

let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("String").appendingPathExtension("txt")


stringURL.path


let challengeString: String = "To Do List"
let challengeURL = URL(fileURLWithPath: challengeString, relativeTo: FileManager.documentDirectoryURL).appendingPathExtension("txt")


challengeURL.lastPathComponent
