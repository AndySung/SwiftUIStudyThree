//
//  ChartsAppView.swift
//  SwiftUIStudyThree
//
//  Created by andy on 2024/7/5.
//

import SwiftUI
import Charts

struct ChartsAppView: View {
    let weekdays = Calendar.current.shortWeekdaySymbols
    let steps = [ 10531, 6019, 7200, 8311, 7403, 6503, 9230 ]
    
    var body: some View {
        Chart {
            ForEach(weekdays.indices, id: \.self) { index in
                BarMark(
                    x: .value("Steps", steps[index]),
                    y: .value("Day", weekdays[index])
                )
                .foregroundStyle(by: .value("Day", weekdays[index]))
                .annotation {
                    Text("\(steps[index])")
                }
            }
        }
    }
}

struct ChartsAppView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsAppView()
    }
}
