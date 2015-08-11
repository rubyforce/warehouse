require 'spec_helper'

describe HomeController, type: :controller do
  describe 'GET :index' do

    context 'with users' do
      before { logged_in(:user) }

      let!(:users) { create_list(:user, 2) }

      before { get :index }

      it { should respond_with(:success) }
      it { should render_template('index') }
    end

  end
end
