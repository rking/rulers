class QuotesController < Rulers::Controller
  def quote_1
    q1 = Rulers::Model::FileModel.find 1
    render :quote, obj: q1
  end
  def a_quote
    render :a_quote, verb: 'debugging'
  end
end
