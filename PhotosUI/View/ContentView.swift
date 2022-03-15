//
//  ContentView.swift
//  PhotosUI
//
//  Created by calmkeen on 2022/03/14.
//

import SwiftUI
import PhotosUI


struct ContentView: View{
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View{
        NavigationView{
            VStack {
                if let image = vm.image {
                    ZoomableScrollView{
                        Image(uiImage:  image)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
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
            .alert("Error", isPresented: $vm.CameraAlert,presenting: vm.CameraError, actions:
                    { CameraError in
                CameraError.button
            }, message: { CameraError in
                Text(CameraError.message)
            })
            .navigationTitle("my Images")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}

