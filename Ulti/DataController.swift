import Foundation
import CoreData

class DataContoroller: ObservableObject {
    let container = NSPersistentContainer(name: "Games")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data filed to load: \(error.localizedDescription)")
            }
        }
    }
}


