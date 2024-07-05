//
//  Article.swift
//  SearchableDemo
//
//  Created by Simon Ng on 2/8/2023.
//

import Foundation

struct Article {
    var id: UUID = UUID()
    var title: String
    var imageURL: String
}

extension Article: Identifiable {}

let sampleArticles = [
    Article(title: "Using AsyncImage in SwiftUI", imageURL: "https://pic.song0123.com/blog_img/2024/06/7NwsYJ20240613170753.png"),
    Article(title: "SwiftUI for iOS 15: How to Add Swipe Actions and Hide Line Separators in List View", imageURL: "https://pic.song0123.com/blog_img/2024/06/7NbonQ20240605170324.png"),
    Article(title: "Introduction to UI Testing in SwiftUI Using XCTest Framework", imageURL: "https://pic.song0123.com/blog_img/2024/06/7NLJaO20240603153848.png"),
    Article(title: "Using matchedGeometryEffect to Create View Animations in iOS 14", imageURL: "https://pic.song0123.com/blog_img/2024/06/7NmO2E20240605173429.png"),
    Article(title: "Adding a Launch Screen in SwiftUI Projects", imageURL: "https://pic.song0123.com/blog_img/2024/06/7NzJIJ20240603162146.png"),
    Article(title: "How to Record Videos and Animated Gifs in Xcode 12.5", imageURL: "https://pic.song0123.com/blog_img/2024/06/7NUMM820240611100329.png"),
    Article(title: "Working with Toolbar in SwiftUI", imageURL: "http://pic.song0123.com/blog_img/2024/05/7NI6Jt20240531162717.png"),
    Article(title: "Building 3D AR Apps Using Reality Composer and RealityKit", imageURL: "https://pic.song0123.com/blog_img/2024/05/7NN25r20240531162549.png"),
    Article(title: "How to Hide Disclosure Indicator in SwiftUI List", imageURL: "https://pic.song0123.com/blog_img/2024/05/7NMnsv20240531162957.png"),
    Article(title: "How to Use ScrollViewReader to Perform Programmatic Scrolling", imageURL: "https://pic.song0123.com/blog_img/2024/05/7NSPKb20240531132540.png")
]
