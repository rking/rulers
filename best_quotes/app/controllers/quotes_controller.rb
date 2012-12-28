class QuotesController < Rulers::Controller
  def index
    render :index, quotes: FileModel.all
  end
  def quote_1
    q1 = FileModel.find 1
    render :quote, obj: q1
  end

  def a_quote
    render :a_quote, verb: 'debugging'
  end
end
