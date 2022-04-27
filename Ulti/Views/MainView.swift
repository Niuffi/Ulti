import SwiftUI

struct MainView: View {
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
        .font(.headline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
