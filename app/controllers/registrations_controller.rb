require 'date'
require 'state_select'

class RegistrationsController < ApplicationController
  layout 'fhview'

  skip_before_filter :verify_authenticity_token, :only => :ipn

  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def verify

    @reg_params = params[:registration]

    @first_name = params[:fname]
    @last_name  = params[:lname]

    @reg_params[:event]   = params[:event]
    @reg_params[:name]    = "#{@first_name} #{@last_name}"
    @reg_params[:invoice] = "AM#{Time.now.strftime('%Y%m%d%H%M%s')}"

    @registration = Registration.new(params[:registration])

    @event = Event.find_by_key(@registration.event)

    @parsed_phone = @registration.phone.gsub(/\D/,'').scan(/([\d]{3})([\d]{3})([\d]{4})/).join(' ')

    @image_values = {
      'i' => @registration.invoice,
      'e' => @registration.event,
      'n' => @registration.name,
      'c' => @registration.church,
      'p' => @registration.pastor,
      'a' => @registration.address,
      'y' => @registration.city,
      's' => @registration.state,
      'z' => @registration.postal
    }

    sandbox_test = false

    @hidden_values = {
      "amount"           => "78.00",
		  "bn"               => "PP-BuyNowBF",
      "cancel_return"    => "http://www.waupci.com/registrations/cancel/#{@registration.invoice}",
      "cbt"              => "Back to Event Home Page",
		  "cmd"              => "_xclick",
		  "cn"               => "Charge includes a $3.00 Online Transaction Fee",
		  "currency_code"    => "USD",
      "invoice"          => @registration.invoice,
      "item_name"        => "#{@event.name} Registration",
		  "item_number"      => @event.key,
		  "lc"               => "US",
      "no_shipping"      => "1",
      "notify_url"       => "http://www.waupci.com/registrations/ipn/#{@registration.id}",
      "return"           => "http://www.waupci.com/events/#{@event.key}",
      "rm"               => "2",
      "quantity"         => "1",
		  "tax"              => "0.00",
		  "image_url"        => "http://media.waupci.com/districtlogo_pp.gif",
		  "cpp_header_image" => "http://media.waupci.com/district_paypal_banner.jpg"
    }

    if sandbox_test then
      @hidden_values["business"] = "dshanks@bpss.net"
	    @paypal_url = 'https://www.sandbox.paypal.com/ci-bin/webscr'
    else
		  @hidden_values["business"] = "gblaylock@waupc.net"
	    @paypal_url = 'https://www.paypal.com/cgi-bin/webscr'
    end

    respond_to do |format|
      if @registration.save
        format.html
      else
        format.html { render :action => "new" }
      end
    end
  end

  def new
    @registration = Registration.new

    if ! params['event'] then
      redirect_to :action => 'index'
    end

    @event = Event.find_by_key(params['event'])

    if ! @event then
      flash['notice'] = 'Invalid Event Selected'
      redirect_to :action => 'index'
    end

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def ipn
    @registration = Registration.find_by_invoice(params['invoice'])

    if params['payment_status'] == 'Completed' then
      @registration.paid = true
      @registration.paid_date  = DateTime.strptime('23:22:45 Jan 03, 2010 PST','%T %b %d, %Y %Z').strftime('%F %T')
      @registration.paid_amt   = params['payment_gross']
      @registration.paid_fee   = params['payment_fee']
      @registration.txn_id     = params['txn_id']

      @registration.reference  = ''

      params.each do |name,value|
        @registration.reference << "#{name}=#{value}\n"
      end

      if @registration.save then
        render :text => 'success', :status => 200
      else
        render :text => 'failure', :status => 200
      end

    end
  end

  def cancel
    @registration = Registration.find_by_invoice(params['invoice'])

    if @registration then
      @event = Event.find_by_key(@registration.event)
      @registration.valid_record = false
      @registration.save
    end

    respond_to do |format|
      format.html # cancel.html.erb
    end
  end

  def complete
    @registration = Registration.find_by_invoice(params['invoice'])
    @event = Event.find_by_key(@registration.event)

    PostOffice.deliver_registration_confirmation( @registration )

    respond_to do |format|
      format.html # complete.html.erb
    end
  end

end
