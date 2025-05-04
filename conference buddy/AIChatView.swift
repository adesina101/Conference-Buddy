import SwiftUI

struct AIChatView: View {
    @State private var userMessage: String = ""
    @State private var chatMessages: [String] = [
        "Welcome to Nexora! How can I assist you at this conference?"
    ]

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(chatMessages, id: \.self) { msg in
                        HStack {
                            Text(msg)
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                        }
                    }

                    if !userMessage.isEmpty {
                        HStack {
                            Spacer()
                            Text(userMessage)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                }
                .padding()
            }

            HStack {
                TextField("Ask something...", text: $userMessage)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button(action: {
                    if !userMessage.isEmpty {
                        // Simulate sending message
                        chatMessages.append(userMessage)
                        userMessage = ""
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            .padding()
        }
        .navigationTitle("AI Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//  AiChatView.swift
//  conference buddy
//
//  Created by Abdussalam Adesina on 4/30/25.
//

