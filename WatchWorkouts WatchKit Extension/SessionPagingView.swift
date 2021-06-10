//
//  SessionPagingView.swift
//  WatchWorkouts WatchKit Extension
//
//  Created by J S on 6/9/21.
//

import SwiftUI

struct SessionPagingView: View {
    @State private var selection: Tab = .metrics
    
    enum Tab {
        case controls, metrics, nowPlaying
    }
    
    var body: some View {
        TabView(selection: $selection)  {
                    Text("Controls").tag(Tab.controls)
                    Text("Metrics").tag(Tab.metrics)
                    Text("Now Playing").tag(Tab.nowPlaying)
        }
    }
}

struct SessionPagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView()
    }
}