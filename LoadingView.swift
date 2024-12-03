//
//  LoadingView.swift
//  WeatherApp
//
//  Created by KağanKAPLAN on 2.12.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
