import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            GamesView()
                .badge(10)
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }
            Text("Team")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Team")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Stats")
                }
            Text("The Last Tab")
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
