# frozen_string_literal: true
Kaminari.configure do |config|
  config.default_per_page = 10 #1ページに表示される数
  # config.max_per_page = nil #1ページの最大表示数
  config.window = 10            #現在のページの左右に表示する数
  # config.outer_window = 1
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :page
  # config.param_name = :page
  # config.params_on_first_page = false
end