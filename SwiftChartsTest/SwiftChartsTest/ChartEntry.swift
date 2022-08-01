//
//  ChartEntry.swift
//  SwiftChartsTest
//
//  Created by nakamori on 2022/08/01.
//

import Charts
import SwiftUI

struct ChartEntry: Identifiable {
    var title: String
    var value: Double
    var color: Color = .green
    var id: String {
        return title + String(value)
    }
}
