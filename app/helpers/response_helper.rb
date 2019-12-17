module ResponseHelper
  require "uri"
 
  def rewrite_response(text)
    text.sub(/>>[0-9]+/) { |str|
      id = str.gsub(/[^0-9]/,"")
      link_to "#{str}", { anchor: "res_#{id}" }
    }
  end
end