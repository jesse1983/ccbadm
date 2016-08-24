# == Schema Information
#
# Table name: statuses
#
#  uid             :string           not null, primary key
#  statusable_type :string           not null
#  title           :string           not null
#  color           :string
#  is_active       :boolean
#  description     :string
#  order           :integer
#  meta            :json
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
