//
//  ContentView.swift
//  swiftyapp
//
//  Created by Daichi Ishida on 2024/11/20.
//

import SwiftUI
import Pendo

struct ContentView: View {
    

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Tap Me") {
                     print("Button tapped!")
                 }
            .accessibilityLabel("Tap me label")
        }
        .padding()
        TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    
                    SearchView()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                }
    }
    
}
struct HomeView: View {
    @State private var showModal = false
    var body: some View {
        Button("Hey, what's up?") {
            showModal.toggle()
        }
        .font(.title)
        .padding()
        .sheet(isPresented: $showModal) {
            ModalView(showModal: $showModal)
        }
    }
}


struct SearchView: View {
    var body: some View {
        Text("Search Screen")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
    }
}

struct ModalView: View {
    @Binding var showModal: Bool
    var body: some View {
        VStack {
            Text("Hello from the Modal!")
                .font(.largeTitle)
                .padding()
            Button("Close") {
                showModal.toggle()
            }
            .font(.title2)
        }
    }
}


#Preview {
    ContentView()
    
}
