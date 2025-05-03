//
//  SplashScreen.swift
//  taskMana
//
//  Created by Billie H on 03/05/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var show = false
    var body: some View {
        if show{
            ContentView()
        }else{
            Image(.photoWallpaper)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .transition(.move(edge: .bottom))
                .onTapGesture {
                    withAnimation(.easeInOut.speed(0.3)){
                        show = true
                    }
                }
                .onAppear{
                    Task{
                        do{
                            try await Task.sleep(for: .seconds(3))
                            withAnimation(.easeInOut.speed(0.3)){
                                show = true
                            }
                        }catch{
                            print(error.localizedDescription)
                        }
                    }
                }
        }
    }
}

#Preview {
    SplashScreen()
}
