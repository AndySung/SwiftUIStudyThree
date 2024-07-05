//
//  UIAsyncImageView.swift
//  SwiftUIStudyThree
//
//  Created by andy on 2024/7/5.
//

import SwiftUI

struct UIAsyncImageView: View {
    let imageURL = "https://pic.song0123.com/blog_img/2024/06/7NwsYJ20240613170753.png"
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                Color.purple.opacity(0.1)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .transition(.slide)
            case .failure(_):
                Image(systemName: "exclamationmark.icloud")
                    .resizable()
                    .scaledToFit()
            @unknown default:
                Image(systemName: "exclamationmark.icloud")
            }
        }
        .frame(width: 300, height: 300)
        .cornerRadius(20)
    }
}

struct UIAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        UIAsyncImageView()
    }
}
