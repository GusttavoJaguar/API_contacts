class ContactMailer < ApplicationMailer
    default from: "gusttavojaguar@gmail.com"

    def confirmation(contact)
        @contact = contact

        mail(
            to: @contact.email, 
            subject: "Confirmação de envio de contato"
        )
    end

end
