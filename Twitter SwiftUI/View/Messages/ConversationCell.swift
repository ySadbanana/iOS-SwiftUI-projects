//
//  ConverstationCell.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 25.01.2021.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message: Message
    var body: some View {
        VStack (alignment: .leading){
            HStack (spacing: 12) {
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56 / 2)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.user.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    Text(message.text)
                        .font(.system(size: 15))
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                   
                }
                .foregroundColor(.black)
//                .frame(height: 56)
                .padding(.trailing)
            }
            Divider()
        }
    }
}

