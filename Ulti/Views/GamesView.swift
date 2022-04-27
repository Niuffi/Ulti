import SwiftUI

struct GamesView: View {
    var body: some View {
        VStack{
            GamesViewTitle(teamName: "RJP")
            GamesViewNextGame()
            Spacer()
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
            .preferredColorScheme(.dark)
    }
}
