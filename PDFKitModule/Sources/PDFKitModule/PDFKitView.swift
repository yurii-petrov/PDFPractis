//
//  PDFKitView.swift
//
//
//  Created by Yurii Petrov on 20.10.2024.
//

import PDFKit
import SwiftUI

public struct PDFKitView: UIViewRepresentable {
    public let document: PDFDocument
    
    public init(_ document: PDFDocument) {
        self.document = document
    }

    public func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.document = document
        return pdfView
    }

    public func updateUIView(_ pdfView: PDFView, context: Context) {
    }
}
