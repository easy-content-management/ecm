module Ecm::Contact
  # Preview all emails at http://localhost:3000/rails/mailers/ecm/contact/contact_request_mailer
  class ContactRequestMailerPreview < ActionMailer::Preview

    # Preview this email at http://localhost:3000/rails/mailers/ecm/contact/contact_request_mailer/notify
    def notify
      ContactRequestMailerMailer.notify
    end

  end
end
