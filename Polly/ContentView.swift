//
//  ContentView.swift
//  Polly
//
//  Created by Raj Raval on 8/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        NavigationStack {
            HomeView(viewModel: PollVM(context: context))
                .enableInjection()
        }
    }
}

#Preview {
    ContentView()
}
