class ApplicationController < ActionController::API
  def valid_api_key?(api_key)
    Digest::SHA256.hexdigest(api_key.to_s) == "164d92d731fd447da253f6df305765f7bcc9039a090007888a03c4e0988012e7"
  end
end
