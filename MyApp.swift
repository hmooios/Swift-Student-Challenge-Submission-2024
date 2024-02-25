import SwiftUI

@main
struct MyApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                FirstScreenView()
            }.navigationViewStyle(.stack)
                .accentColor(Colors.themeColor)
        }
    }
}
