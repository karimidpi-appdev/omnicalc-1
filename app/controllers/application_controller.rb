class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    #params = {"elephant" =>"12"}
    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb" })
  end


  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def calculate_random

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb" })
  end


  def blank_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def calculate_square_root
    @my_num = params.fetch("user_number").to_f
    @square_root = @my_num ** (1.0/2)

    render({ :template => "calculation_templates/root_results.html.erb" })

  end

  def blank_payment_form
    render( :template => "calculation_templates/payment_form.html.erb")
  end

  def payment_results

    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_f
    @present_value = params.fetch("user_pv").to_f

    rate = @apr / 100 / 12
    months = @years * 12
    a = (rate * @present_value)
    b = 1 - ((1 + rate) ** -months)
    @monthly_payment = a / b

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

end
