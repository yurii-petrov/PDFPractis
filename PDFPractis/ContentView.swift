//
//  ContentView.swift
//  PDFPractis
//
//  Created by Yurii Petrov on 17.10.2024.
//

import SwiftUI
import PDFKit
import PDFKitModule

struct ContentView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = ContextViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let documentData = viewModel.pdfData {
                   PDFViewerView(data: documentData)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    Text("PDF not loaded")
                }
                
                if viewModel.isLoading {
                    ProgressView()
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
            .onAppear(perform: viewModel.loadPDF)
        }
//        .searchable(text: $searchText, prompt: "Enter text to search")
    }
//}

#Preview {
    ContentView()
}
