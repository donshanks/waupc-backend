class Admin::RegistrationsController < ApplicationController
  layout "fhview"
  before_filter :login_required

  def index
    @admin_menu = true

    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @admin_menu = true

    @registration = Registration.find_by_id(params[:id])

    @record_cols = %w( address city state postal phone email church pastor
                       invoice paid_date paid_amt paid_fee valid_record created_at )

    respond_to do |format|
      format.html # index.html.erb
    end

  end

end
