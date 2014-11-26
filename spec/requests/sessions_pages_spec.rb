#encoding: utf-8

require 'spec_helper'

describe 'Sessions' do
  USER_PASSWORD = '12345678'

  let!(:user) { create(:user, password: USER_PASSWORD) }

  describe 'Create' do
    context 'with valid data' do
    	before { post api_user_session_path, user: { email: user.email, password: USER_PASSWORD } }

    	it { expect(response.status).to eq(200) }	
      it { expect(JSON.parse(response.body)['name']).to eq(user.name) }
    end

    context 'with invalid data' do
      before { post api_user_session_path, user: { email: user.email, password: USER_PASSWORD + '#' } }

      it { expect(response.status).to eq(401) } 
      it { expect(JSON.parse(response.body)['errors'].size).to eq(1) }
    end
  end
end