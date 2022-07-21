//
//  FinishView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 18/07/22.
//

import SwiftUI

struct FinishView: View {
    var body: some View {
        VStack{
            Text("Finish Facial Wash")
                .foregroundColor(Color("startColor"))
                .font(.system(size: 17))
                .bold()
            
            
            Text("The greatest gift to yourself is a little bit of attention")
                .multilineTextAlignment(.center)
            Spacer()
            
//            Button(action: {
//                StartCountdownView()
//            }){
//                Text("Done")
           // }
            NavigationLink(destination: StartCountdownView()){
                Text("Done")
            }
//            .navigationBarBackButtonHidden(true)
                
        }
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
