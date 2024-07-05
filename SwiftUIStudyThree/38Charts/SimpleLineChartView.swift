//
//  SimpleLineChartView.swift
//  SwiftUICharts
//
//  Created by Simon Ng on 25/7/2023.
//

import SwiftUI
import Charts

struct SimpleLineChartView: View {
    
    let chartData = [ (city: "Hong Kong", data: hkWeatherData),
                      (city: "London", data: londonWeatherData),
                      (city: "Taipei", data: taipeiWeatherData) ]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(chartData, id: \.city) { series in
                    ForEach(series.data) { item in
                        LineMark(
                            x: .value("Month", item.date),
                            y: .value("Temp", item.temperature)
                        )
                        .interpolationMethod(.stepStart)
                    }
                    .foregroundStyle(by: .value("City", series.city))
                    .symbol(by: .value("City", series.city))
                }
            }
            .frame(height: 300)
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.defaultDigits))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartPlotStyle { plotArea in
                plotArea
                    .background(.blue.opacity(0.1))
            }
        }
    }
}

struct SimpleLineChartView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleLineChartView()
    }
}
