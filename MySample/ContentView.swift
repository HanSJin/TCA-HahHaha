//
//  ContentView.swift
//  MySample
//
//  Created by 한승진 on 7/31/24.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    
    let store: StoreOf<ContentFeature>
    
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, world!")
            List {
                LazyVStack(alignment: .center, spacing: 5) {
                    ForEach(store.notes, id: \.noteId) { model in
                        Text("\(model.content)")
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

//#Preview {
//    ContentView(
//        store: Store(initialState: ContentFeature.State(, reducer: <#T##() -> Reducer#>)
////        store: Store(initialState: ContentFeature.State(offset: 0, notes: [])) {
////            ContentFeature(notes: { _ in [] })
////        }
//    )
//}
//
