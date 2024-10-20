//
//  SwiftUIView.swift
//  
//
//  Created by Yurii Petrov on 20.10.2024.
//

import SwiftUI
import PDFKit

public struct PDFViewerView: View {
    public let pdfDocument: PDFDocument?
    
    public init(data: Data) {
        self.pdfDocument = PDFDocument(data: data)
    }
    
    public init(url: URL) {
        self.pdfDocument = PDFDocument(url: url)
    }
    
    public var body: some View {
        NavigationStack {
            VStack {
                if let document = pdfDocument {
                    PDFKitView(document)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    Text("PDF not loaded")
                }
            }
            .toolbar {
                //                ToolbarItem(placement: .navigationBarLeading) {
                //                    Picker("", selection: $viewModel.selection) {
                //                            Text("A 1")
                //                                .background(Color.yellow.opacity(0.6))
                //                                .tag(1)
                //                            Text("A 2").tag(2)
                //                            Text("A 3").tag(3)
                //                        }
                //                        .pickerStyle(.segmented)
                //                        .background(Color.accentColor.opacity(0.6), in: RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

#Preview {
    PDFViewerView(url: Bundle.main.url(forResource: "sample", withExtension: "pdf")!)
}
