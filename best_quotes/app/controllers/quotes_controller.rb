class QuotesController < Rulers::Controller
  def a_quote
    <<-EOT
      Everyone knows that debugging is twice as hard as writing a program in
      the first place. So if you're as clever as you can be when you write it,
      how will you ever debug it?
    EOT
  end
end
