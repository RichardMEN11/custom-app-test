//
//  ViewRouter.swift
//  playground_nova
//
//  Created by Richard Menning on 03.12.21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .wiki
    
}

enum Page {
    case wiki
    case leifaden
    case search
    case favorites
    case settings
}
