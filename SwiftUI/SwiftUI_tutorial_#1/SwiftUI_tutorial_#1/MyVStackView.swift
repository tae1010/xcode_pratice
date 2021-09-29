//
//  MyVStackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 김정태 on 2021/09/29.
//

import SwiftUI

struct MyVstackView2: View{
    
    // 데이터를 연동시킨다.
    @Binding
    var isActivated: Bool
    
    //생성자
    init(isActivated: Binding<Bool> = .constant(false)){
        _isActivated = isActivated
    }
    
    var body: some View{
        HStack{
        Text("VStack2")
            .padding()
        Text("VStack2")
            .padding()
            .font(.title)
        }.background(self.isActivated ? Color.green : Color.black)
        .padding(self.isActivated ? 30 : 0)
    }
}

struct MyVstackView2_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView2()
    }
}
