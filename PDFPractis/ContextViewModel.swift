//
//  ContextViewModel.swift
//  PDFPractis
//
//  Created by Yurii Petrov on 19.10.2024.
//

import SwiftUI
import PDFKit
import Combine

class ContextViewModel: ObservableObject {
    @Published var pdfData: Data?
    @Published var isLoading: Bool = false
    
    private let pdfURL = URL(string: "https://ontheline.trincoll.edu/images/bookdown/sample-local-pdf.pdf")!
    
    func loadPDF() {
        isLoading = true
        URLSession.shared.dataTask(with: pdfURL) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    self.pdfData = data
                } else {
                    print("Failed to load PDF: \(error?.localizedDescription ?? "Unknown error")")
                }
                self.isLoading = false
            }
        }.resume()
    }
}
