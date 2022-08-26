//
//  FeedView.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 21.01.2021.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView: Bool = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(viewModel.tweets) { tweet in
                        NavigationLink(
                            destination: TweetDetailView(tweet: tweet)){
                            TweetCell(tweet: tweet)
                        }
                    }
                }
                .padding()
            }
            
            Button(action: {
                    isShowingNewTweetView.toggle()                
            }, label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView){
                NewTweetsView(isPresented: $isShowingNewTweetView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
