# frozen_string_literal: true

class InquiryMailer < ApplicationMailer
  def received_email(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to: ENV['SEND_MAIL'],
      subject: 'お問い合わせ通知'
    )
  end
end
