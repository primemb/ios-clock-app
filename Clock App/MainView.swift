//
//  MainView.swift
//  Clock App
//
//  Created by Mohammad Behzadfar on 5/26/1402 AP.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            StopwatchView()
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Stopwatch")
                }.tag(1)
            AlarmView()
                .tabItem {
                    Image(systemName: "alarm")
                    Text("Alarm")
                }.tag(2)
            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Timer")
                }.tag(3)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
