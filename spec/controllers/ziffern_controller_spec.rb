require 'rails_helper'

RSpec.describe ZiffernController, :type => :controller do
  describe "#index" do
    subject { get :index }
    specify { should render_template(:flag) }
  end
end
