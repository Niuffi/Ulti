import SwiftUI
import UltiPackage

@available(iOS 13.0, *)
@available(macOS 10.15, *)

struct MainView: View {
    @EnvironmentObject var team: Team
    
    
    var body: some View {
        TabView {
            GamesView()
                .badge(0)
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }
            TeamView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Team")
                }
            StatsView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Stats")
                }
            WallView()
                .tabItem {
                    Image(systemName: "bubble.right.fill")
                    Text("Wall")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        let team = try! Team(name: "Fantasma")
        MainView()
            .preferredColorScheme(.dark)
            .environmentObject(team)
    }
}
