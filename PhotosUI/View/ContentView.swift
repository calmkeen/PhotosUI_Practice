//
//  ContentView.swift
//  PhotosUI
//
//  Created by calmkeen on 2022/03/14.
//

import SwiftUI
//import PhotosUI


struct ContentView: View{
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View{
        VStack {
            if let image = vm.image {
                Image(uiImage:  image)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity)
            } else {
                Image(systemName: "photo.fill")
                .resizable()
                .scaledToFit()
                .opacity(0.6)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.horizontal)
            }
            HStack{
                Button{
                    vm.source = .camera
                    vm.showPhotoPicker()
                }label: {
                    Text("camera")
                }
                Button{
                    vm.source = .libaray
                    vm.showPicker = true
                }label: {
                    Text("photo")
                }
            }
            Spacer()
        }
        .sheet(isPresented: $vm.showPicker) {
            ImagePicker(sourceType: vm.source == .libaray ? .photoLibrary: .camera, selectedImage: $vm.image)
                .ignoresSafeArea()
            
        }
        .navigationTitle("my Images")
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
    
