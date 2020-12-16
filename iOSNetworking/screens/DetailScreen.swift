
import SwiftUI

struct DetailScreen: View {
    var body: some View {
        VStack {
            Text("Second View")
        }.onAppear {
            print("DetailScreen appeared!")
        }.onDisappear {
            print("DetailScreen disappeared!")
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
