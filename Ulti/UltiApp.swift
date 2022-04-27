import SwiftUI
import UltiPackage

@main
struct UltiApp: App {
    @StateObject var team = try! Team(name: "empty")
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
