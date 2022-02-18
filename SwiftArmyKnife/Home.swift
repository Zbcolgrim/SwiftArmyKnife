//
//  ContentView.swift
//  SwiftArmyKnife
//
//  Created by Zachary Buffington on 2/16/22.
//

import SwiftUI

struct Home: View {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    DeemoAppIcon(name: "Image Fetcher", color: .blue, destination: ImageFetcher())
                    DeemoAppIcon(name: "PokeDex", color: .orange, destination: PokeDex())
                    DeemoAppIcon(name: "Journal", color: .green, destination: Journal())
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Swift Army Knife")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct DeemoAppIcon<Destination: View>: View {
    let name: String
    let color: Color
    let destination: Destination
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                if let firstLetter = name.first {
                    Image(systemName: "\(firstLetter.lowercased()).square")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundColor(color)
                    Text(name)
                        .font(.caption)
                        .lineLimit(1)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}
