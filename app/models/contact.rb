class Contact < ApplicationRecord
    
    validates :name, presence: true
    validates :email, presence: true
    validates :subject, presence: true
    validates :service_type, presence: true
    validates :message, presence: true

end
