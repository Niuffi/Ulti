import SwiftUI
import UltiPackage

@main
struct UltiApp: App {
    
    
    @StateObject var team = try! Team(name: "Fantasma")
    @StateObject private var dataController = DataContoroller()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(team)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
