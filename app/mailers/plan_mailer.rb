class PlanMailer < ApplicationMailer
  def invite(user, plan)
    @user = user
    @plan = plan

    mail(to: @user.email, subject: "Here's an email")
  end

  def all_plans(email)
    mail(to: email, subject: "Your Plans")
  end
end
