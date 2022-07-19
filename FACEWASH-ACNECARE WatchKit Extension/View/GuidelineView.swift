//
//  GuidelineView.swift
//  FACEWASH-ACNECARE WatchKit Extension
//
//  Created by Local Administrator on 17/07/22.
//

import SwiftUI

struct GuidelineView: View {
    var body: some View {
//        ScrollView{
//            VStack{
//                Text("Face Wash Guidance")
//                    .foregroundColor(Color("startColor"))
//                    .font(.system(size: 16))
//                    .bold()
//
//                Image("introFacewash")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(10)
                
                
                List{
                    Section(
                        header:
                            Text("Face Wash Guidance")
                                .foregroundColor(Color("startColor"))
                                .font(.system(size: 12))
                                .bold()
                    
                            ){
                            Image("introFacewash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                            }
                    
//                    Section(
//                        header:
//                            Text("Steps")
//                                .foregroundColor(Color("startColor"))
//                                .font(.system(size: 12))
//                                .bold()
//
//                            ){
//                                Text("Rumah ke 2")
//
//                                Text("Rumah ke 3")
//                            }
                    
                        
                    Section(
                        header:
                            Text("Steps")
                                .foregroundColor(Color("startColor"))
                                .font(.system(size: 12))
                                .bold()
                    
                            ){
                                HStack(spacing: 20){
                                Image("Group 2")
                                    
                                    
//                                    .aspectRatio(contentMode: .fit)
                                VStack{
                                    Text("Rahmat")
                                        .foregroundColor(Color("startColor"))
                                        .font(.system(size: 16))
                                        .bold()
                                        
                                        .padding(.leading)
                                    
                                    
                                    Text ("rahmat 2xxxxxxxxxxxxxxx")
                                        .foregroundColor(Color("startColor"))
                                        .font(.system(size: 16))
                                        .fontWeight(.regular)
                                    
                                    
                                }
                                
                                //    Image(item.imageStep)
                            }
                        }
                    }
                    
                    
                    
//                }
//            }
        }
    }


struct GuidelineView_Previews: PreviewProvider {
    static var previews: some View {
        GuidelineView()
    }
}

struct stepGuideline: Identifiable{
    var id = UUID()
    var imageStep: String
    var numberStep: String
    var descriptionStep: String
}

var stepsGuideline = [
    stepGuideline(imageStep: "Step1", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    stepGuideline(imageStep: "Step2", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    stepGuideline(imageStep: "Step3", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    stepGuideline(imageStep: "Step4", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    stepGuideline(imageStep: "Step5", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    stepGuideline(imageStep: "Step6", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    stepGuideline(imageStep: "Step7", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    stepGuideline(imageStep: "Step8", numberStep: "Step 1:", descriptionStep: "Wet face with warm water"),
    stepGuideline(imageStep: "Step9", numberStep: "Step 1:", descriptionStep: "Wet face with warm water")
]
