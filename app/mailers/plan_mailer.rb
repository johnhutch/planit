class PlanMailer < ApplicationMailer
  def invite(user, plan)
    @user = user
    @plan = plan

    mail(to: @user.email, from: "admin@planit.com", subject: "Here's an email")
  end

  def all_plans(email)
    mail(to: email, from: "admin@planit.com", subject: "Your Plans")
  end
end
