//
//  ContentView.swift
//  DeepLinkingPoC
//
//  Created by Kasper Spychala on 08/08/2023.
//

import SwiftUI
import DeepLinkingApp

struct ContentView: View {

    @Environment(\.deepLink) var deepLink

    @State private var isShowingNewPayment = false
    @State private var isShowingPaymentDetails = false
    @State private var isShowingPaymentHistory = false

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello PoC Deep Linking!")
            }
            .padding()
            .navigationDestination(
                isPresented: $isShowingNewPayment) {
                    EmptyView()
                }
            .navigationDestination(
                isPresented: $isShowingPaymentDetails) {
                    EmptyView()
                }
            .navigationDestination(
                isPresented: $isShowingPaymentHistory) {
                    EmptyView()
                }
            .onChange(of: deepLink, perform: { deepLink in
                guard let deepLink = deepLink else { return }
                switch deepLink {
                case .newPayment:
                    isShowingNewPayment.toggle()
                case .paymentDetails:
                    isShowingPaymentDetails.toggle()
                case .paymentHistory:
                    isShowingPaymentHistory.toggle()
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
