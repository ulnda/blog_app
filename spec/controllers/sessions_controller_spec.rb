#encoding: utf-8

require 'spec_helper'

describe SessionsController do
  render_views

  USER_PASSWORD = '12345678'

  let!(:user) { create(:user, password: USER_PASSWORD) }

  describe '#create' do
    before { request.env['devise.mapping'] = Devise.mappings[:user] }

    context 'with valid user data' do
    	before do 
        post :create, user: { email: user.email, password: USER_PASSWORD }, format: :json
      end

    	it { expect(response.status).to eq(200) }	
      it { expect(JSON.parse(response.body)['name']).to eq(user.name) }
    end

    context 'with invalid data' do
      before do 
        post :create, user: { email: user.email, password: USER_PASSWORD + '#' }, format: :json
      end

      it { expect(response.status).to eq(401) } 
      it { expect(JSON.parse(response.body)['errors'].size).to eq(1) }
    end
  end
end