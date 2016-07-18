class CheckoutController < ApplicationController
  def step1
  end

  def check_s1
    redirect_to checkout_step2_path
  end

  def step2
  end

  def check_s2
    redirect_to checkout_step3_path
  end

  def step3
  end

  def check_s3
    redirect_to checkout_step4_path
  end

  def step4
  end

  def check_s4
    redirect_to root_path
  end
end
