class QuotesController < Rulers::Controller
  def index
    render :index, quotes: FileModel.all
  end

  def show
    quote = FileModel.find params['id']
    ua = request.user_agent
    render_response :quote, obj: quote, ua: ua
  end

  def a_quote
    render :a_quote, verb: 'debugging'
  end
end
