class HomeController < ApplicationController
  def index
    @encrypted_message = EncryptedMessage.new
  end
end
