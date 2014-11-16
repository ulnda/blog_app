#encoding: utf-8

require 'spec_helper'

describe 'Posts' do
  let!(:post) { create(:post) }

  describe 'Index' do
  	before { get api_posts_path }

  	it { expect(response.status).to eq(200) }	
    it { expect(JSON.parse(response.body)[0]['title']).to eq(post.title) }
  end
end