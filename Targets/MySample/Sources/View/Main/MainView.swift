//
//  MainView.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    
    let store: StoreOf<MainFeature>
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, world!")
            List {
                LazyVStack(alignment: .leading, spacing: 5) {
                    ForEach(store.notes, id: \.noteId) { model in
                        Text("\(model.content)")
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 8)
                    }
                    Spacer(minLength: 8)
                }
            }
            Spacer(minLength: 8)
            Button("Next Page") {
                store.send(.nextPage)
            }
            Spacer()
        }
        .padding()
        .onAppear {
            store.send(.loadNotes)
        }
    }
}

#Preview {
    MainView(
        store: Store(initialState: MainFeature.State(), reducer: {
            MainFeature()
        })
    )
}

