//
//  FilterButtonView.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 30.01.2021.
//

import SwiftUI

enum TweetsFilterOptions: Int, CaseIterable {
    case tweets
//    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
//        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption: TweetsFilterOptions
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetsFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetsFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 24
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetsFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underlineWidth)
                    })
                }
            }
            
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.tweets))
    }
}
