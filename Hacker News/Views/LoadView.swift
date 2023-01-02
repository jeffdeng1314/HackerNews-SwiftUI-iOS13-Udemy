//
//  LoadView.swift
//  Hacker News
//
//  Created by Jeff Deng on 12/31/22.
//

import Foundation
import SwiftUI

struct LoadView: View {
    @State private var downloadAmount = 0.0

    var body: some View {
        VStack {
            ProgressView("Loading…", value: downloadAmount, total: 100)
        }
    }
}
