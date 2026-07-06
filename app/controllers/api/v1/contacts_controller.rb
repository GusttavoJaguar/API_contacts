class Api::V1::ContactsController < ApplicationController


    def index
        contacts = Contact.all

        render json: contacts
    end


    def create
        contact = Contact.new(contact_params)

        if contact.save
            
            ContactMailer.confirmation(contact).deliver_now
            render json: {
                success: true, 
                message: "Contato enviado com sucesso!"
            }, status: :created
        else
            render json: {
                success: false, 
                errors: contact.errors.full_messages
            }, status: :unprocessable_entity
        end
    end


    private

    def contact_params
        params.require(:contact).permit(
            :name,
            :email,
            :subject,
            :service_type,
            :message
        )
    end

end
