//
//  ContentView.swift
//  SwiftChartsTest
//
//  Created by nakamori on 2022/08/01.
//

import SwiftUI
import Charts

struct ContentView: View {

    static let demoData1: [ChartEntry] = [
        .init(title: "", value: 5),
        .init(title: "B", value: 10),
        .init(title: "C", value: 8)
    ]
    static let demoData2: [ChartEntry] = [
        .init(title: "A", value: 5),
        .init(title: "A", value: 10, color: .blue),
        .init(title: "B", value: 10),
        .init(title: "C", value: 8)
    ]

    @State var data: [ChartEntry] = [
        .init(title: "A", value: 5),
        .init(title: "B", value: 10),
        .init(title: "C", value: 8)
    ]


    @State private var dataSetSelection: Int = 0

    var body: some View {

        Form {

            Picker("Dataset selection", selection: $dataSetSelection) {
                Text("Dataset 1")
                    .tag(0)
                Text("Dataset 2")
                    .tag(1)
            }
            .onChange(of: dataSetSelection) { newValue in
                withAnimation {
                    if newValue == 0 {
                        self.data = ContentView.demoData1
                    } else if newValue == 1 {
                        self.data = ContentView.demoData2
                    }
                }
            }
        }

            Chart(data) { dataPoint in
                BarMark(
                    x: .value("Value", dataPoint.value),
                    y: .value("Category", dataPoint.title)
                )
                .foregroundStyle(dataPoint.color)
            }
            .frame(height: 200)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
