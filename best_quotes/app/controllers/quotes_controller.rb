class QuotesController < Rulers::Controller
  def index
    render :index, quotes: FileModel.all
  end

  def show
    quote = FileModel.find params['id']
    render :quote, obj: quote
  end

  def a_quote
    render :a_quote, verb: 'debugging'
  end
end
