class EncryptedMessagesController < ApplicationController
  def create
    @message = params[:msg]
    @email = params[:email]
    @pass_phrase = params[:pass_phrase]

    @encrypted_message = EncryptedMessage.new
    @encrypted_message.update_attribute(:msg, AESCrypt.encrypt(@message, @pass_phrase))
    @encrypted_message.update_attribute(:email, @email)

    if @encrypted_message.save!
      flash[:notice] = "message encrypted and saved successfully"
    else
      flash[:notice] = "something went wrong. Try again later."
    end

    redirect_to root_url
  end

  def lookup
    @msg_email = params[:msg_email]
    @pass_phrase = params[:pass_phrase]

    @encrypted_message = EncryptedMessage.find_by_email(@msg_email).msg
    @decrypted_message = AESCrypt.decrypt(@encrypted_message, @pass_phrase)

    flash[:notice] = @decrypted_message

    redirect_to root_url
  end

  def destroy
    #destroy after 24 hours or at N time
    redirect_to root_url
  end
end
