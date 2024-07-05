//
//  ShareLinkView.swift
//  SwiftUIStudyThree
//
//  Created by andy on 2024/7/5.
//

import SwiftUI

struct ShareLinkView: View {
    private let url = URL(string: "https://www.appcoda.com")!

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ShareLink(item: url, subject: Text("Check out this link"), message: Text("If you want to learn Swift, take a look at this website.")) {
                Image(systemName: "square.and.arrow.up")
            }
        }
        .padding(.horizontal)
    }
}

struct ShareLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkView()
    }
}
