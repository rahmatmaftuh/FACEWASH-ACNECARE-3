//
//  SettingView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//
//

import SwiftUI
import WatchDatePicker

struct ChangeTimeView: View {
    @State var currentTimeNight = Date()
   
    @State var value = Calendar.current.date(bySettingHour: 10, minute: 09, second: 0, of: Date())!
    @State var selected = Calendar.current.date(bySettingHour: 12, minute: 5, second: 0, of: Date())
    var body: some View {
      NavigationView {
          DatePicker("Change Time", selection: $value, mode: .time, minimumDate: .now, maximumDate: nil, showsMonthBeforeDay: false, twentyFourHour: true, onCompletion: nil )

      }
      .navigationTitle("Reminder")
      .accentColor(.orange)
    }
  }

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTimeView()
    }
}

