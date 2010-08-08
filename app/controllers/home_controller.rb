class HomeController < ApplicationController
  def index
    if admin?
      redirect_to admin_path
    end
  end

  def rates
  end

  def faq
  end

  def courier
  end

  def contact
  end

  def ads
  end

  def job
  end

  def terms
  end

  def feedback
  end
end

