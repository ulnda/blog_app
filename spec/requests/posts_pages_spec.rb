#encoding: utf-8

require 'spec_helper'

describe 'Posts' do
  let!(:post1) { create(:post) }
  let!(:post2) { create(:post) }

  describe 'Index' do
  	before { get api_posts_path }

  	it { expect(response.status).to eq(200) }	
    it { expect(JSON.parse(response.body)[0]['title']).to eq(post2.title) }
  end

  describe 'Show' do
  	before { get api_post_path(post1) }

  	it { expect(response.status).to eq(200) }	
    it { expect(JSON.parse(response.body)['title']).to eq(post1.title) }
    it { expect(JSON.parse(response.body)['comments']).to eq(post1.comments.reverse_order) }
  end
end