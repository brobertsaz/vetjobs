class ContactsController < ApplicationController

  def create
    contact = Contact.create contact_params
    if contact.save
      flash[:success] = "We will let you know as soon as we are live!"
      AdminMailer.notify_new_contact_created(contact)
    else
      flash[:error] = "Unable to create contact"
    end
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :contact_type)
  end
end
