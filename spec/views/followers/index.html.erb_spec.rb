require 'rails_helper'

RSpec.describe "followers/index", type: :view do
  before(:each) do
    assign(:followers, [
      Follower.create!(),
      Follower.create!()
    ])
  end

  it "renders a list of followers" do
    render
  end
end
