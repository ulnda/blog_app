#encoding: utf-8

require 'spec_helper'

describe PostsController do
  render_views

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:post1) { create(:post, user: user1) }
  let!(:post2) { create(:post, user: user2) }

  describe '#index' do
    context 'with valid user' do
      before { get :index, user_id: user1.login, format: :json }
      
      it { expect(response.status).to eq(200) } 
      it { expect(JSON.parse(response.body)[0]['title']).to eq(post1.title) }
      it { expect(JSON.parse(response.body)).not_to include(post2.title) }
    end

    context 'with invalid user' do
      before { get :index, user_id: user1.login + "_not_existed", format: :json }
      
      it { expect(response.status).to eq(404) }   
    end
  end

  describe '#show' do
    context 'with valid post' do
      before { get :show, id: post1.id, format: :json }

      it { expect(response.status).to eq(200) } 
      it { expect(JSON.parse(response.body)['title']).to eq(post1.title) }
      it { expect(JSON.parse(response.body)['comments']).to eq(post1.comments.reverse_order) }
    end

    context 'with invalid post' do
      before { get :show, id: Post.last.id + 1, format: :json }
      
      it { expect(response.status).to eq(404) }         
    end
  end

  describe '#by_current_user' do
    context 'with valid user' do
      before do 
        sign_in user1
        get :by_current_user, format: :json
      end

      it { expect(response.status).to eq(200) }
      it { expect(JSON.parse(response.body)[0]['title']).to eq(post1.title) }
      it { expect(JSON.parse(response.body)).not_to include(post2.title) }
    end

    context 'with invalid user' do
      before { get :by_current_user, format: :json }

      it { expect(response.status).to eq(401) }
    end
  end

  describe '#create' do
    let!(:p) { build(:post, user: nil) }

    context 'with valid user' do
      before { sign_in user1 }

      it { expect{ post :create, post: p.attributes, format: :json }.to change(Post, :count).by(1) }
    end

    context 'with invalid user' do
      it { expect{ post :create, post: p.attributes, format: :json }.to change(Post, :count).by(0) }

      it 'unauthorized access attempt' do
        post :create, post: p.attributes, format: :json
        expect(response.status).to eq(401)
      end
    end
  end

  describe '#update' do
    let!(:new_title) { post1.title + "_new" }

    context 'with valid user' do
      before do 
        sign_in user1
        put :update, post: { title: new_title }, id: post1.id, format: :json 
      end

      it { expect(post1.reload.title).to eq(new_title) }  
    end  

    context 'with invalid user' do
      let!(:old_title) { post1.title.dup }

      before { put :update, post: { title: new_title }, id: post1.id, format: :json }

      it { expect(post1.reload.title).to eq(old_title) } 
      it { expect(response.status).to eq(401) }
    end
  end

  describe '#destroy' do
    context 'with valid user' do
      before { sign_in user1 }

      it { expect{ delete :destroy, id: post1.id, format: :json }.to change(Post, :count).by(-1) }
    end

    context 'with invalid user' do
      it { expect{ delete :destroy, id: post1.id, format: :json }.to change(Post, :count).by(0) }

      it 'unauthorized access attempt' do
        delete :destroy, id: post1.id, format: :json
        expect(response.status).to eq(401)
      end
    end
  end
end