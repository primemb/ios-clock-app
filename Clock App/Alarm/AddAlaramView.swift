//
//  AddAlaramView.swift
//  Clock App
//
//  Created by Mohammad Behzadfar on 5/26/1402 AP.
//

import SwiftUI

struct AddAlaramView: View {
    
    @Binding var alarms: [Alarm]
    @State private var date = Date()
    @State private var label = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select Time", selection: $date,displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                
                GroupBox {
                    TextField("Label", text: $label)
                        .multilineTextAlignment(.center)
                }.padding()
                Spacer()
            }.padding(.top,50)
                .preferredColorScheme(.dark)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            alarms.append(Alarm(time: date,label: label ,isOn: true))
                            dismiss()
                        }) {
                            Text("Save")
                                .font(.title3)
                                .foregroundColor(.orange)
                                .bold()
                        }
                    }
                }
        }
    }
}

struct AddAlaramView_Previews: PreviewProvider {
    static var previews: some View {
        let alarms = Binding.constant([Alarm]())
        
        AddAlaramView(alarms: alarms)
    }
}
