#encoding: utf-8

require 'spec_helper'

describe UsersController do
  render_views

  let!(:user) { create(:user) }

  describe '#index' do
    before { get :index, format: :json }

    it { expect(response.status).to eq(200) } 
    it { expect(JSON.parse(response.body)[0]['name']).to eq(user.name) }
  end
end