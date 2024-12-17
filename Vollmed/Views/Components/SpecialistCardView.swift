//
//  SpecialistCardView.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 29/08/23.
//

import SwiftUI
import VollmedUI

struct SpecialistCardView: View {
    
    var specialist: Specialist
    var appointment: Appointment?
    let service = WebService()
    
    @State private var specialistImage: UIImage?
    @State private var showPopover = false
    
    func downloadImage() async {
        do {
            let image = try await service.downloadImage(from: specialist.imageUrl)
            self.specialistImage = image
        } catch {
            print("Ocorreu um erro ao obter a imagem: \(error)")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16.0) {
                if let specialistImage = specialistImage {
                    Image(uiImage: specialistImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(specialist.name)
                        .font(.title3)
                        .bold()
                    Text(specialist.specialty)
                    if let appointment = appointment {
                        Text(appointment.date.convertDateStringToReadableDate())
                            .bold()
                    }
                }
            }
            
            if let appointment = appointment {
                HStack {
                    NavigationLink {
                        ScheduleAppointmentView(
                            specialistID: specialist.id,
                            isRescheduleView: true,
                            appointmentID: appointment.id)
                    } label: {
                        ButtonView(text: "Remarcar")
                    }
                    
                    NavigationLink {
                        CancelAppointmentView(appointmentID: appointment.id)
                    } label: {
                        ButtonView(text: "Cancelar", buttonType: .cancel)
                    }
                }
            } else {
                NavigationLink {
                    ScheduleAppointmentView(specialistID: specialist.id)
                } label: {
                    ButtonView(text: "Agendar consulta")
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color("LightBlue").opacity(0.15))
        .cornerRadius(16.0)
        .onAppear {
            Task {
                await downloadImage()
            }
        }
    }
}

struct SpecialistCardView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistCardView(specialist:
                            Specialist(
                                id: "c84k5kf",
                                name: "Dr. Carlos Alberto",
                                crm: "123456",
                                imageUrl: "https://images.unsplash.com/photo-1637059824899-a441006a6875?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=752&q=80",
                                specialty: "Neurologia",
                                email: "carlos.alberto@example.com",
                                phoneNumber: "(11) 99999-9999"
                            )
        )
    }
}

struct PopOverController<Content: View>: UIViewControllerRepresentable {
    
    // MARK: - Attributes
    
    @Binding var isPresented: Bool
    var content: Content
    var arrowDirection: UIPopoverArrowDirection
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let controller = UIHostingController(rootView: content)
            
            controller.view.backgroundColor = .clear
            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.permittedArrowDirections = arrowDirection
                        
            controller.popoverPresentationController?.sourceView = uiViewController.view
            
            uiViewController.present(controller, animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIPopoverPresentationControllerDelegate {
        
        let parent: PopOverController
        
        init(parent: PopOverController) {
            self.parent = parent
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
        
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            parent.isPresented = false
        }
    }
}

class CustomHostingView<Content: View>: UIHostingController<Content> {
    
    override func viewDidLoad() {
        preferredContentSize = view.intrinsicContentSize
    }
}
