class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, verb: 'debugging'
  end
end
