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
      begin
        if params[:options].present?
          options = eval(params[:options])
          post_params.merge! :options => Base64.encode64(options.to_json)
        end
      rescue => e
        @error_message = e.message
      end
    when 'Send password'
      path = 'auth'
      checksum_parts = [ params[:multiplex], params[:uid], params[:auth_token], params[:auth_pass], params[:network_id], params[:multiplex] ]      
      checksum = calculate_checksum checksum_parts
      post_params.merge! :token => params[:auth_token], :pass => params[:auth_pass], :checksum => checksum
    when 'Send shows'
      path = 'shows'
    when 'Send halls'
      path = 'halls'
      post_params.merge!(:cinema_id => params[:halls_cinema_id]) if params[:halls_cinema_id].present?
    when 'Send dictionary'
      path = 'dictionary'
      post_params.merge! :retina => params[:dictionary_retina]
    when 'Send changes'
      path = 'changes'
    when 'Send events load'
      path = 'events_load'
      post_params.merge! :event_id => params[:e_event_id], :show_id => params[:e_show_id],
        :cinema_id => params[:e_cinema_id], :date => params[:e_date], :mime_type => params[:e_mime_type]
    when 'Send event places'
      path = 'event_places'      
      post_params.merge! :event_id => params[:event_id]
    when 'Send request places'
      path = 'request_places'
      seats = (params[:exclude_seats] || '').gsub(' ','').split(',')
      checksum_parts = [ params[:multiplex], params[:uid], params[:r_event_id], params[:price], params[:qty], seats.join, params[:network_id], params[:multiplex] ]     
      checksum = calculate_checksum checksum_parts
      post_params.merge! :event_id => params[:r_event_id], :price => params[:price], :qty => params[:qty], 'exclude_seats[]' => seats, :checksum => checksum
    when 'Send reservation'
      path = 'reservation'
      seats = params[:seat_id].gsub(' ','').split(',')
      checksum_parts = [ params[:multiplex], params[:uid], params[:reservation_event_id], seats.join, params[:network_id], params[:multiplex] ]     
      checksum = calculate_checksum checksum_parts
      post_params.merge! :event_id => params[:reservation_event_id], 'seat_id[]' => seats, :checksum => checksum
    when 'Send order status'
      path = 'order'
      checksum_parts = [ params[:multiplex], params[:uid], params[:order_token], params[:detailed], params[:network_id], params[:multiplex] ]
      checksum = calculate_checksum checksum_parts
      post_params.merge! :token => params[:order_token], :detailed => params[:detailed], :checksum => checksum
    when 'Send book order'
      path = 'book_order'
      checksum_parts = [ params[:multiplex], params[:uid], params[:book_order_token], params[:network_id], params[:multiplex] ]
      checksum = calculate_checksum checksum_parts
      post_params.merge! :token => params[:book_order_token], :checksum => checksum
    when 'Cancel order'
      path = 'cancel_order'
      checksum_parts = [ params[:multiplex], params[:uid], params[:cancel_order_token], params[:network_id], params[:multiplex] ]
      checksum = calculate_checksum checksum_parts
      post_params.merge! :token => params[:cancel_order_token], :checksum => checksum
    when 'Rollback order'
      path = 'rollback_order'
      checksum_parts = [ params[:multiplex], params[:uid], params[:rollback_order_token], params[:network_id], params[:multiplex] ]
      checksum = calculate_checksum checksum_parts
      post_params.merge! :token => params[:rollback_order_token], :checksum => checksum, :refund => params[:refund]
    when 'Send logs'
      path = 'log'
    when 'Logout'
      path = 'logout'
      checksum_parts = [ params[:multiplex], params[:uid], params[:network_id], params[:multiplex] ]
      checksum = calculate_checksum checksum_parts
      post_params.merge! :network_id => params[:network_id], :checksum => checksum
    when 'Cabinet'
      path = 'cabinet'
    when 'Send eventmap'
      path = 'eventmap'      
      post_params.merge! :event_id => params[:eventmap_event_id]
    when 'Cities'
      path = 'cities'      
      post_params.merge! :long => params[:cities_long], :latt => params[:cities_latt]
    when 'Sites'
      path = 'sites'      
      post_params.merge! :long => params[:sites_long], :latt => params[:sites_latt], :city => params[:sites_city]
    when 'Site shows'
      path = 'site_shows'      
      post_params.merge! :date => params[:shows_date], :site => params[:shows_site]
    when 'Site'
      path = 'site'      
      post_params.merge! :site => params[:ssite_id]
    when 'Show'
      path = 'show'      
      post_params.merge! :show => params[:sshow_id]
    when 'Events'
      path = 'events'      
      post_params.merge! :site => params[:events_site], :show => params[:events_show], :date => params[:events_date]
    end    
    
    uri = URI.parse(params[:url] + path)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(post_params)
    now = Time.now
    response = http.request(request)
    @elapsed_time = (Time.now - now).to_f
    @result = response.body
    puts '----------------------------------'
    #puts @result.inspect
    render  
  end

  private

  def calculate_checksum parts    
    Digest::MD5.hexdigest parts.join
  end
  
end
