//
//  chart.swift
//  FitFolio..
//
//  Created by Yuga Suzuki on 11/25/23.
//

import SwiftUI
import Charts

struct SimpleLineChartView: View {
    var body: some View {
        VStack {
            Chart {
                LineMark(
                    x: .value("Day", Calendar.current.date(from: .init(year: 2023, month: 1, day: 1)) ?? Date()),
                    y: .value("Calories", 2000.0)
                )
                LineMark(
                    x: .value("Day", Calendar.current.date(from: .init(year: 2023, month: 1, day: 2)) ?? Date()),
                    y: .value("Calories", 1800.0)
                )
                LineMark(
                    x: .value("Day", Calendar.current.date(from: .init(year: 2023, month: 1, day: 3)) ?? Date()),
                    y: .value("Calories", 2300.0)
                )
            }
        }
    }
}
#Preview {
    SimpleLineChartView()
}
