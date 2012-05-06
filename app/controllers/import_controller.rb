class ImportController < ApplicationController

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def carrier
  @pagetitle = 'Import Carriers'
  @carrier = Carrier.all

  @carrier.each do |c|
    c.destroy
  end
  url = "http://216.172.46.222:8181/EXPORTS/carriers.php"
  doc = Nokogiri::HTML(open(url))
  doc.css("tr").each do |row|
    Carrier.create(
      :name => row.at_css("td:nth-child(2)").text.titleize,
      :street_address => row.at_css("td:nth-child(4)").text.titleize,
      :city => row.at_css("td:nth-child(6)").text.titleize,
      :state => row.at_css("td:nth-child(7)").text,
      :country => row.at_css("td:nth-child(8)").text,
      :postal_code => row.at_css("td:nth-child(9)").text,
      :status => row.at_css("td:nth-child(10)").text.titleize,
      :mc_number => row.at_css("td:nth-child(11)").text[2..7],
      :phone_number => row.at_css("td:nth-child(12)").text,
      :toll_free => row.at_css("td:nth-child(13)").text,
      :fax_number => row.at_css("td:nth-child(14)").text,
      :insurance_broker => row.at_css("td:nth-child(15)").text.titleize,
      :insurance_company => row.at_css("td:nth-child(16)").text.titleize,
      :insurance_policy_number => row.at_css("td:nth-child(17)").text,
      :insurance_expiry => row.at_css("td:nth-child(19)").text
    )
  end
end

def customer
  @pagetitle = 'Import Customers'
  @customer = Customer.all

  @customer.each do |c|
    c.destroy
  end
  url = "http://216.172.46.222:8181/EXPORTS/customers.php"
  doc = Nokogiri::HTML(open(url))
  doc.css("tr").each do |row|
    Customer.create(
      :name => row.at_css("td:nth-child(2)").text.titleize,
      :street_address => row.at_css("td:nth-child(4)").text.titleize,
      :city => row.at_css("td:nth-child(6)").text.titleize,
      :state => row.at_css("td:nth-child(7)").text,
      :country => row.at_css("td:nth-child(8)").text,
      :postal_code => row.at_css("td:nth-child(9)").text,
      :status => row.at_css("td:nth-child(10)").text.titleize,
      :phone_number => row.at_css("td:nth-child(11)").text,
      :toll_free => row.at_css("td:nth-child(12)").text,
      :fax_number => row.at_css("td:nth-child(13)").text
    )
  end
end


def load
  @load = Load.all
  
  @load.each do |l|
    l.destroy
  end
  
  url = "http://216.172.46.222:8181/EXPORTS/loads.php"
  doc = Nokogiri::HTML(open(url))
  doc.css("tr").each do |row|
    @carrier = Carrier.where(:name => row.at_css("td:nth-child(10)").text.titleize).first
    if @carrier.nil?
      @carr = ''
    else
      @carr = @carrier.id
    end
    @customer = Customer.where(:name => row.at_css("td:nth-child(11)").text.titleize).first
    if @customer.nil?
      @cust = ''
    else
      @cust = @customer.id
    end
    Load.create(
      :carrier_rate => row.at_css("td:nth-child(2)").text,
      :customer_rate => row.at_css("td:nth-child(3)").text,
      :load_number => row.at_css("td:nth-child(4)").text,
      :temp => row.at_css("td:nth-child(5)").text,
      :driver_cell => row.at_css("td:nth-child(6)").text,
      :customer_currency => row.at_css("td:nth-child(7)").text,
      :carrier_currency => row.at_css("td:nth-child(8)").text,
      :customer_po => row.at_css("td:nth-child(9)").text,
      :carrier_id => @carr,
      :carrier_name => row.at_css("td:nth-child(10)").text,
      :customer_name => row.at_css("td:nth-child(11)").text,
      :customer_id => @cust 
    )
  end
end
end
