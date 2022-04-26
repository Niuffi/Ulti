import SwiftUI

struct GamesView: View {
    var body: some View {
        VStack{
            HStack{
                Text("RJP")
                    .font(.title)
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 20.0)
                Spacer()
            }
            Spacer()
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
