//
//  AlarmView.swift
//  Clock App
//
//  Created by Mohammad Behzadfar on 5/26/1402 AP.
//

import SwiftUI

struct AlarmView: View {
    
    @State private var alarms: [Alarm] = []
    @State private var showAddAlaramView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(alarms) { alarm in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(alarm.time, style: .time)
                                .font(.largeTitle)
                                .foregroundColor(alarm.isOn ? .white : .gray)
                            Text(alarm.label)
                                .foregroundColor(alarm.isOn ? .white : .gray)
                        }
                        Spacer()
                        
                        Toggle("", isOn: Binding<Bool>(get: {
                            alarm.isOn
                        }, set: { newValue in
                            if let index = alarms.firstIndex(of: alarm){
                                alarms[index].isOn = newValue
                            }
                            
                        }))
                    }.swipeActions(edge: .leading) {
                        Button(action: {
                            if let index = alarms.firstIndex(of: alarm) {
                                alarms.remove(at: index)
                            }
                        }) {
                            Image(systemName: "trash")
                        }.tint(.red)
                    }
                    .contextMenu {
                        Button(action: {
                            if let index = alarms.firstIndex(of: alarm){
                                alarms[index].isOn.toggle()
                            }
                        }) {
                            Label(alarm.isOn ? "Turn Off" : "Turn On", systemImage: alarm.isOn ? "bell.slash.fill" : "bell.fill")
                        }
                        
                        Button( action : {
                            if let index = alarms.firstIndex(of: alarm) {
                                alarms.remove(at: index)
                            }
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Alarms")
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddAlaramView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.orange)
                            .bold()
                    }
                }
            }
            .sheet(isPresented: $showAddAlaramView, content: {
                AddAlaramView(alarms: $alarms)
            })
        }
    }
}

struct Alarm: Identifiable, Equatable {
    var id = UUID()
    var time: Date
    var label = ""
    var isOn: Bool
}


struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
