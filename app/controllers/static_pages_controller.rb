class StaticPagesController < ApplicationController
  skip_before_action :signed_in_user, only: [:home]

  def home
  end

  def program
  end

  def locations
  end

  def hotels
  end

  def region
  end

  def registry
  end

  def rsvp
  end

  def contact
  end

  def germanvsenglish
  end
  
end
