//
//  SettingsRowView.swift
//  Fruits
//
//  Created by Yerlan Nurumov on 04.04.2021.
//

import SwiftUI

struct SettingsRowView: View {
    var settingName: String
    var settingContent: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(settingName).foregroundColor(Color.gray)
                Spacer()
                if (settingContent != nil) {
                    Text(settingContent!)
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }
                else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(settingName: "Developer", settingContent: "Yerlan")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsRowView(settingName: "Developer", linkLabel: "test", linkDestination: "test.kz")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
