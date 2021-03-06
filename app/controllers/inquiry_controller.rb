# frozen_string_literal: true

class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render 'index'
  end

  def confirm
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      render 'confirm'
    else
      render 'index'
    end
  end

  def thanks
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    InquiryMailer.received_email(@inquiry).deliver
    render 'thanks'
  end
end
