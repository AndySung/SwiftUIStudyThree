//
//  LiveTextView.swift
//  SwiftUIStudyThree
//
//  Created by andy on 2024/7/5.
//

import SwiftUI
import VisionKit

struct LiveTextView: View {
    @State private var startScanning = false
    @State private var scanText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            DataScanner(startScanning: $startScanning, scanText: $scanText)
                .frame(height: 400)
            
            Text(scanText)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                .background(in: Rectangle())
                .backgroundStyle(Color(uiColor: .systemGray6))
                
        }
        .task {
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning.toggle()
            }
        }
    }
}

struct LiveTextView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTextView()
    }
}
