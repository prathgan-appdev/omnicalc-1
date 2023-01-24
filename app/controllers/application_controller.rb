class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_sqrt_form
    render({ :template => "calculation_templates/sqrt_form.html.erb" })
  end

  def calculate_sqrt
    @num = params.fetch("number").to_f
    @sqrt_of_num = @num ** 0.5

    render({ :template => "calculation_templates/sqrt_results.html.erb" })
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @r = @apr / 100.0 / 12.0
    @yrs = params.fetch("user_years").to_f
    @n = @yrs * 12.0
    @principal = params.fetch("user_pv").to_f
    @numerator = @r * @principal
    @denom = 1.0 - ((1.0 + @r) ** (-1.0 * @n))
    @payment = @numerator / @denom

    render({ :template => "calculation_templates/payment_results.html.erb" })
  end

  def random_form
    render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def calculate_random
    @bottom = params.fetch("user_min").to_f
    @top = params.fetch("user_max").to_f
    @res = rand(@bottom..@top)

    render({ :template => "calculation_templates/random_results.html.erb" })
  end
end
