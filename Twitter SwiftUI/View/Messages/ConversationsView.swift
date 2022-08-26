//
//  ConverstationsView.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 25.01.2021.
//

import SwiftUI

struct ConversationsView: View {
    @State var showChat = false
    @State var isShowingNewMessageView = false
    @State var user: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = user {
                NavigationLink(
                        destination: LazyView(ChatView(user: user)),
                        isActive: $showChat,
                        label: {})
            }

            ScrollView {
                VStack {
                    ForEach(viewModel.recentMessages) { message in
                        NavigationLink(
                            destination: LazyView(ChatView(user: message.user)),
                            label: {
                                ConversationCell(message: message)
                            })
                    }
                }
                .padding()
            }
            
            Button(action: {self.isShowingNewMessageView.toggle()}, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(startChat: $showChat, show: $isShowingNewMessageView, user: $user)
            })
        }
    }
}


