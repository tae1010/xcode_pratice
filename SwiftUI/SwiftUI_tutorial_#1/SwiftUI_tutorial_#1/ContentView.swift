//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 김정태 on 2021/09/29.

//VStack, HStack, navigationView
//

import SwiftUI

struct ContentView: View {
    
    //State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false
    var body: some View {
        
        NavigationView{
            VStack{
                VStack{
                    MyVstackView2(isActivated: $isActivated)
                    MyVstackView2(isActivated: $isActivated)
                    MystackView()
                }.onTapGesture {
                    print("VStack이 클릭되었습니다.")
                    
                    withAnimation{
                        // toggle()이 true<->false 바꿔줌
                        self.isActivated.toggle()
                    }
                }.padding(isActivated ? 10 : 50)
                .background(isActivated ? Color.red : Color.yellow)
                
                
                //네비게이션 버튼(링크)
                NavigationLink(destination : MyTextView(isActivated: $isActivated)){
                    Text("네비게이션")
                        .fontWeight(.heavy)
                        .padding()
                        .font(.system(size: 40))
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }.padding(.top,50)
            }
        }
    }
}

struct MystackView: View{
    var body: some View{
        HStack{
            VStack{
                Text("Vstack")
                    .padding()
                    .background(Color.green)
                Text("Vstack")
                    .padding()
            }
            VStack{
                Text("Vstack")
                    .padding()
                Text("Vstack")
                    .padding()
            }
        }.background(Color.blue)
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
