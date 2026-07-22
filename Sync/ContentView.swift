import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.12)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                // Lyric lines with different opacities for 'gloomy' effect
                LyricLine(text: "The silence is so loud tonight", opacity: 1.0)
                LyricLine(text: "Wait for the light to fade", opacity: 0.6)
                LyricLine(text: "In the shadow of the melody", opacity: 0.3)
                
                Spacer()
                
                // Simple Player Controls
                HStack(spacing: 50) {
                    Image(systemName: "backward.fill")
                    Image(systemName: "play.fill")
                        .font(.system(size: 44))
                    Image(systemName: "forward.fill")
                }
                .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct LyricLine: View {
    let text: String
    let opacity: Double
    
    var body: some View {
        Text(text)
            .font(.system(size: 28, weight: .bold, design: .rounded))
            .foregroundColor(.white.opacity(opacity))
            .multilineTextAlignment(.center)
            .blur(radius: (1.0 - opacity) * 3)
    }
}
