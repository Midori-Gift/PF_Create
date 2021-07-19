# frozen_string_literal: true

class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    @great_search = Great.where(is_release: true)
    render action: 'index'
  end

  def confirm
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    @great_search = Great.where(is_release: true)
    if @inquiry.valid?
      render action: 'confirm'
    else
      render action: 'index'
    end
  end

  def thanks
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    @great_search = Great.where(is_release: true)
    InquiryMailer.received_email(@inquiry).deliver

    render action: 'thanks'
  end
end
