//
//  ClipboardItem.swift
//  ClipboardFlow
//
//  Created by Rahul on 30/03/25.
//

import Foundation

enum ClipboardItem: Identifiable, Equatable {
    case text(String, UUID)
    case image(Data, UUID)

    var id: UUID {
        switch self {
        case .text(_, let id), .image(_, let id):
            return id
        }
    }

    static func == (lhs: ClipboardItem, rhs: ClipboardItem) -> Bool {
        lhs.id == rhs.id
    }
}

enum PasteMode: String, CaseIterable {
    case fifo = "FIFO"
    case lifo = "LIFO"
}
