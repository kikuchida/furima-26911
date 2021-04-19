class OrdersController < ApplicationController
  def index
  end

  def new
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new
  end
end