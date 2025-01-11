//
//  ContentView.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import SwiftUI

struct ContentView: View {

    @ObserveInjection private var inject

    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.largeTitle.bold())
                .foregroundStyle(.pink)
            Text("Hello, world!")
        }
        .padding()
        .enableInjection()
    }
}

#Preview {
    ContentView()
}
