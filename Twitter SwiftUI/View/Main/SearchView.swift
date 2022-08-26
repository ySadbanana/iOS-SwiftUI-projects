//
//  SearchView.swift
//  Twitter SwiftUI
//
//  Created by Yerlan Nurumov on 22.01.2021.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            VStack (alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)){ user in
                    HStack(){
                        Spacer()
                    }
                    NavigationLink(
                        destination: LazyView(UserProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                        })
                }
            }.padding(.leading)
        }
        .navigationTitle("Search")
    }
}


