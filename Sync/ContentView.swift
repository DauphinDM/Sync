import SwiftUI
import iUXiOS

struct ContentView: View {
    let lyrics = [
        "The silence is so loud tonight",
        "Wait for the light to fade",
        "In the shadow of the melody"
    ]
    
    var body: some View {
        ZStack {
            // Gloomy theme base
            Color(red: 0.05, green: 0.05, blue: 0.07)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // Using iUXiOS's FlowLayout to wrap lyric fragments if needed
                FlowLayout(spacing: 12, lineSpacing: 20) {
                    ForEach(0..<lyrics.count, id: \.self) { index in
                        LyricLine(text: lyrics[index], opacity: index == 0 ? 1.0 : (index == 1 ? 0.6 : 0.3))
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
                
                // Simple Player Controls
                HStack(spacing: 60) {
                    Image(systemName: "backward.fill")
                    Image(systemName: "play.fill")
                        .font(.system(size: 44))
                    Image(systemName: "forward.fill")
                }
                .foregroundColor(.white.opacity(0.8))
                
                Spacer()
                    .frame(height: 50)
            }
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
            .blur(radius: (1.0 - opacity) * 2.5)
            .animation(.easeInOut, value: opacity)
    }
}
