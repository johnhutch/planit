class PlanMailer < ApplicationMailer
  def invite(user, plan)
    @user = user
    @plan = plan

    mail(to: @user.email, subject: "Here's an email")
  end
end
