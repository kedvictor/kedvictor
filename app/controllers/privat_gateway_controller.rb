class PrivatGatewayController < ApplicationController
  
  require 'net/http'
  require 'net/https'
  require "rexml/document" 
  
  PRIVAT_GATEWAY = "http://localhost:3000/payment/privatgate" 
  
  def index    
  end
  
  def send_search_request
    
    uri = URI( PRIVAT_GATEWAY )
    pars = {
      "action" => "bill_search",
      "bill_identifier" => params[:bill_identifier] }
         
    uri.query = URI.encode_www_form(pars)

    res = Net::HTTP.get_response uri    
    @response = res.body.force_encoding 'utf-8'     
    render :send_request
  end
  
  def send_bill_request
  
    uri = URI( PRIVAT_GATEWAY )
    pars = { 
      "action" => "bill_input", 
      "bill_identifier" => params[:bill_identifier],
      "sum" => params[:sum],
      "key" => params[:key],
      "date" => params[:date] } 
         
    uri.query = URI.encode_www_form(pars)

    res = Net::HTTP.get_response uri    
    @response = res.body.force_encoding 'utf-8'    
    render :send_request
  end
  
end
