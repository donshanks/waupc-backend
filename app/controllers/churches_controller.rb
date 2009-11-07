require 'net/http'
require 'rexml/document'

class ChurchesController < ApplicationController
  layout nil

  YAHOO_GEO_URL = 'http://api.local.yahoo.com/MapsService/V1/geocode?appid=WaUPCChurches&output=xml&location=';

  # GET /churches
  def index
		sortby = params[:sort] || 'church_name'
    sortdir = params[:d] || 'ASC'

    if params[:fsearch].nil_or_empty?
      @churches = Church.find(:all,
        :conditions => "status = 'active'",
        :order => "#{sortby} #{sortdir}"
      )
    elsif params[:fsearch].match(/\d{5}/)
      @churches = zip_search( params[:fsearch] )
    else
      @churches = Church.find(:all,
        :conditions => "status = 'active' AND search_text LIKE '%#{params[:fsearch].downcase}%'",
        :order => "#{sortby} #{sortdir}"
      )
    end

    respond_to do |format|
      format.html
    end
  end

  private
  def zip_search(zip)
    
    url = "#{YAHOO_GEO_URL}#{zip}"
    xml = Net::HTTP.get_response(URI.parse(url)).body
    doc = REXML::Document.new(xml)
    
    yLat = doc.root.get_text('/ResultSet/Result/Latitude').to_s.to_f
    yLon = doc.root.get_text('/ResultSet/Result/Longitude').to_s.to_f
    
    churches = Church.find(:all, :conditions => "status = 'active'")

    churches.each do |church|
      church.lat1 = yLat
      church.lon1 = yLon
      church.distance = 3693.0 * Math.acos(
        Math.sin(deg2rad(church.lat1)) *
        Math.sin(deg2rad(church.lat))  + 
        Math.cos(deg2rad(church.lat1)) *
        Math.cos(deg2rad(church.lat))  *
        Math.cos(deg2rad(church.lon) - deg2rad(church.lon1)) 
      )
      church.googlelink = ERB::Util.html_escape( "#{church.physical_address}, #{church.physical_city}, WA" )
    end

    return churches.sort {|a,b| a.distance <=> b.distance }[0...15]
  end

  def deg2rad(num); return (num * Math::PI)/180; end

end
