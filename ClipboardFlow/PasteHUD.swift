//
//  PasteHUD.swift
//  ClipboardFlow
//
//  Created by Rahul on 30/03/25.
//
import SwiftUI

struct PasteHUD: View {
    let message: String

    @State private var isVisible = true

    var body: some View {
        if isVisible && !message.isEmpty {
            Text(message)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(Color.black.opacity(0.85))
                .cornerRadius(12)
                .shadow(radius: 10)
                .transition(.opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isVisible = false
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, 32)
        }
    }
}
