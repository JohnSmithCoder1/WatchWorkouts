//
//  MetricsView.swift
//  WatchWorkouts WatchKit Extension
//
//  Created by J S on 6/9/21.
//

import SwiftUI

struct MetricsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var body: some View {
        VStack(alignment: .leading) {
            ElapsedTimeView(
                elapsedTime: workoutManager.builder?.elapsedTime ?? 0,
                showSubseconds: true
            ).foregroundColor(.yellow)
            Text(
                Measurement(
                    value: workoutManager.activeEnergy,
                    unit: UnitEnergy.kilocalories
                ).formatted(
                    .measurement(
                        width: .abbreviated,
                        usage: .workout,
                        numberFormat: .numeric(precision: .fractionLength(0))
                    )
                )
            )
            Text(
                workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) + " bpm"
            )
            Text(
                Measurement(
                    value: workoutManager.distance,
                    unit: UnitLength.meters
                ).formatted(.measurement(width: .abbreviated, usage: road))
            )
        }
        .font(.system(.title, design: .rounded)
                .monospacedDigit()
                .lowercaseSmallCaps()
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView()
    }
}
