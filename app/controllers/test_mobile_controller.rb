class TestMobileController < ApplicationController

  require "net/http"
  require "uri"

  def index
  end

  def send_request   
    post_params = {:UID => params[:uid], :network_id => params[:network_id]}
    case params[:commit]
    when 'Check net'
      path = ''
    when 'Send login'
      path = 'auth'     
      checksum_parts = [ params[:multiplex], params[:uid], params[:login], params[:network_id], params[:multiplex] ]      
      checksum = calculate_checksum checksum_parts
      post_params.merge! :login => params[:login], :checksum => checksum
    when 'Send password'
      path = 'auth'
      checksum_parts = [ params[:multiplex], params[:uid], params[:auth_token], params[:auth_pass], params[:network_id], params[:multiplex] ]      
      checksum = calculate_checksum checksum_parts
      post_params.merge! :token => params[:auth_token], :pass => params[:auth_pass], :checksum => checksum
    when 'Send shows'
      path = 'shows' 
    when 'Send event places'
      path = 'event_places'      
      post_params.merge! :event_id => params[:event_id]
    when 'Send reservation'
      path = 'reservation'
      checksum_parts = [ params[:multiplex], params[:uid], params[:reservation_event_id], params[:seat_id], params[:network_id], params[:multiplex] ]     
      checksum = calculate_checksum checksum_parts
      post_params.merge! :event_id => params[:reservation_event_id], 'seat_id[]' => params[:seat_id], :checksum => checksum
    when 'Send order status'
      path = 'order'
      checksum_parts = [ params[:multiplex], params[:uid], params[:order_token], params[:detailed], params[:network_id], params[:multiplex] ]
      checksum = calculate_checksum checksum_parts
      post_params.merge! :token => params[:order_token], :detailed => params[:detailed], :checksum => checksum
    end
    
    uri = URI.parse(params[:url] + path)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(post_params)
    response = http.request(request)
    @result = response.body
    render  
  end

  private

  def calculate_checksum parts    
    Digest::MD5.hexdigest parts.join
  end
  
end
