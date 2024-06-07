//
//  CardView.swift
//  Hike
//
//  Created by Manas Shetty on 16/01/24.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    @State private var imageNumber: Int=1
    @State private var randomNumber: Int=1
    @State private var isShowingSheet: Bool = false
    //MARK: - FUNCTIONS
    func randomImage(){
        print("---BUTTON WAS PRESSED---")
        print("Status: Old Image Number = \(imageNumber)")
        
        repeat{
            randomNumber=Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber) ")
        }while randomNumber==imageNumber
            
        imageNumber=randomNumber
        print("Result: New Image Number = \(imageNumber)")
        print("---THE END---")
        print("\n")
    }
    
    
    
    var body: some View {
        //MARK: - CARD
        ZStack {
           CustomBackgroundView()
            
            VStack {
                //MARK: - HEADER
                VStack(alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top,
                                    endPoint: .bottom)
                        )
                        Spacer()
                        Button{
                            //ACTION: Show a Sheet
                            print("The button was pressed.")
                            isShowingSheet.toggle()
                        }label:{
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }
                    Text("Fun and enjoyable activity for friends and families.")
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//:HEADER
                .padding(.horizontal,30)
                //MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1.5), value: imageNumber)
                }
                //MARK: - FOOTER
                Button{
                    //ACTION:Generate a random number
                    print("The button was pressed.")
                    randomImage()
                }label:{
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25),radius:0.25,x:1,y:2)
                        
                }
                .buttonStyle(GradientButton())
                
            }//: ZSTACK
        }//: CARD
        
        .frame(width:320, height:570)
    }
}

#Preview {
    CardView()
}
