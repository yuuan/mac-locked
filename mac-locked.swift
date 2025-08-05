import ApplicationServices
import Foundation

func isLocked() -> Bool {
    guard let dict = CGSessionCopyCurrentDictionary() as? [String: Any],
          let locked = dict["CGSSessionScreenIsLocked"] as? Bool
    else {
        return false
    }
    return locked
}

let args = CommandLine.arguments
let isQuiet = args.contains("-q") || args.contains("--quiet")

if isLocked() {
    if !isQuiet { print("Locked") }
    exit(0)
} else {
    if !isQuiet { print("Unlocked") }
    exit(1)
}
