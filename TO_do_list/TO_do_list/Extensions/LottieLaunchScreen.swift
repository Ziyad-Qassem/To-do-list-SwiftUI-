//
//  LottieLaunchScreen.swift
//  TO_do_list
//
//  Created by Ziyad Qassem on 08/09/2024.
//

import SwiftUI
import Lottie
struct LottieLaunchScreen: View {
    @State private var showMainView = false
    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.system(size: 70))
                .bold()
                .foregroundStyle(.red)
            LottieView(animation:  .named("LottieAnimation"))
                .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                .animationDidFinish { completed in
                    self.showMainView = completed
                   
                }
            
                .fullScreenCover(isPresented: $showMainView, content: {
                    MainView()
                })
            
        }
        
    }
}

#Preview {
    LottieLaunchScreen()
}
