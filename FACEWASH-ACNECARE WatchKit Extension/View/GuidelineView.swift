//
//  GuidelineView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 17/07/22.
//

import SwiftUI

struct GuidelineView: View {
    var body: some View {
        VStack{
            
//            List(stepsGuideline){ stepsGuideline in
//                Section(
//                    header:
//                        Text("Face Wash Guidance")
//                        .foregroundColor(Color("startColor"))
//                        .font(.system(size: 12))
//                        .bold()
//
//                ){
//                    Image("introFacewash")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(10)
//                }
                
                
//
//                Section(
//
//
//                ){
            List{
                Section(header: Text("Facewash")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("startColor"))){
                    Image("introFacewash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
                Section(header: Text("Steps")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("startColor"))
                ) {
                    ForEach(stepsGuideline){ Step in
//                        Text(Step.imageStep)
                        
                        HStack(spacing: 5){
                            Image("\(Step.imageStep)")

                            VStack(alignment: .leading){
                                Text("\(Step.numberStep)")
                                    .foregroundColor(Color("titleGuidelineColor"))
                                    .font(.system(size: 17))
                                    .bold()

                                Text ("\(Step.descriptionStep)")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 17))
                                    .fontWeight(.regular)


                            }

                        }
                    }
                }
                   
//                }
                
            }
            
            
            

        }
    }
}


struct GuidelineView_Previews: PreviewProvider {
    static var previews: some View {
        GuidelineView()
    }
}

struct ListItem: Identifiable{
    var id = UUID()
    var imageStep: String
    var numberStep: String
    var descriptionStep: String
}

var stepsGuideline = [
    ListItem(imageStep: "step2", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    ListItem(imageStep: "step2", numberStep: "Step 2:", descriptionStep: "Put cleanser in your fingertip"),
    ListItem(imageStep: "step3", numberStep: "Step 3:", descriptionStep: "Clean nose area 10 seconds"),
    ListItem(imageStep: "step4", numberStep: "Step 4:", descriptionStep: "Rub gently in circular motion"),
    ListItem(imageStep: "step5", numberStep: "Step 5:", descriptionStep: "Clean forehead area 10 seconds"),
    ListItem(imageStep: "step6", numberStep: "Step 6:", descriptionStep: "Clean cheeks area 20 seconds"),
    ListItem(imageStep: "step7Updated", numberStep: "Step 7:", descriptionStep: "Clean chin area 10 seconds"),
    
    ListItem(imageStep: "step1", numberStep: "Step 8:", descriptionStep: "Rinse face with warm water")
    
]
