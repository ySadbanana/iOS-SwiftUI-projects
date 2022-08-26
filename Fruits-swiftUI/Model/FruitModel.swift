//
//  FruitModel.swift
//  Fruits
//
//  Created by Yerlan Nurumov on 01.04.2021.
//

import SwiftUI

// MARK: - FRUITS DATA MODEL

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColor: [Color]
    var description: String
    var nutrition: [String]
}

