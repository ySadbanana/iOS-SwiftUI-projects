//
//  UserProfileView.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 30.01.2021.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter: TweetsFilterOptions = .tweets
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
                
                ForEach (viewModel.tweets(forFilter: selectedFilter)) { tweet in
                    TweetCell(tweet: tweet)
                }.padding()
                .padding(.horizontal, 10)
            }
            .navigationTitle(user.username)
        }
    }
}

