require "coveralls"
Coveralls.wear! do
  add_filter "/test/"
end

require "minitest/autorun"
require "minitest/mock"
require "minitest/unit"
require "minitest/pride"
require "pry"
require "pipl-api"
