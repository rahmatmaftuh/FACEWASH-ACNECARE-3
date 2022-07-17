//
//  SettingView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 15/07/22.
//
//

import SwiftUI
import WatchDatePicker

struct SetReminderView: View {
    @State var currentTimeNight = Date()
   
    @State var value = Calendar.current.date(bySettingHour: 10, minute: 09, second: 0, of: Date())!

    var body: some View {
      TabView {
        Form {
            WatchDatePicker.DatePicker ( "Change time", selection: $value, twentyFourHour: true)
            
        }
        

        NavigationView {
          TimePickerView(
            selection: $value,
            selectionIndicatorRadius: 5,
            selectionIndicatorColor: .brown,
            focusColor: .purple,
            amPMHighlightColor: .brown
          )
  //          .offset(y: 5)
        }

        NavigationView {
          TimePickerView(
            selection: $value,
            twentyFourHour: true,
            showsTwentyFourHourIndicator: false,
            selectionIndicatorColor: .yellow,
            focusColor: .pink,
            amPMHighlightColor: .yellow,
            markFill: AnyShapeStyle(Color.pink.opacity(0.25)),
            emphasizedMarkFill: AnyShapeStyle(Color.pink)
          )
  //          .offset(y: 5)
        }
        
        NavigationView {
          TimePickerView(
            selection: $value,
            selectionIndicatorRadius: 7,
            selectionIndicatorColor: .mint,
            focusColor: .purple,
            amPMHighlightColor: .yellow,
            markSize: CGSize(width: 5.5, height: 3),
            markFill: AnyShapeStyle(Color.white.opacity(0.75)),
            emphasizedMarkSize: CGSize(width: 2, height: 7),
            emphasizedMarkFill: AnyShapeStyle(Color.pink)
          )
  //          .offset(y: 5)
        }
      }.navigationTitle("Reminder")
      .tabViewStyle(.page(indexDisplayMode: .never))
      .accentColor(.orange)
    }
  }

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        MainSettingView()
    }
}


struct MainSettingView : View {
    @State var changeTime = false
    @State var voiceOver = false
    var body: some View {
        
        VStack{
            
            ZStack{
                NavigationLink("", destination: SetReminderView(), isActive: $changeTime)
                    .opacity(0)
            Button(action: {
                changeTime.toggle()
                
            }, label: {
                HStack{
                    Text("Set reminder")
                    Spacer()
                    
                }
            })
                
            }
            
            Button(action: {
                if voiceOver{
                }else {
                    AVService.shared.player?.stop()
                }
                
            }, label: {
                HStack{
                    Toggle("Voice over", isOn: $voiceOver)
                }
            })
            Spacer()

            
        }.navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
    }
}
