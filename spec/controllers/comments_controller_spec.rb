#encoding: utf-8

require 'spec_helper'

describe CommentsController do
  render_views

  describe '#create' do
    let!(:comment) { build(:comment) }

    context 'with valid user' do
      before { sign_in comment.user }

      context 'with valid post' do
        it { expect{ post :create, comment: comment.attributes, post_id: comment.post.id, format: :json }.to change(Comment, :count).by(1) }
      end

      context 'witn invalid post' do
        it { expect{ post :create, comment: comment.attributes, post_id: comment.post.id + 1, format: :json }.to change(Comment, :count).by(0) }

        it 'attempt to create a comment for a nonexistent post' do
          post :create, comment: comment.attributes, post_id: comment.post.id + 1, format: :json
          expect(response.status).to eq(404)
        end
      end
    end

    context 'with invalid user' do
      it { expect{ post :create, comment: comment.attributes, post_id: comment.post.id, format: :json }.to change(Comment, :count).by(0) }

      it 'unauthorized access attempt' do
        post :create, comment: comment.attributes, post_id: comment.post.id, format: :json
        expect(response.status).to eq(401)
      end
    end
  end

  describe '#destroy' do
    let!(:comment) { create(:comment) }

    context 'with valid user' do
      before { sign_in comment.post.user }

      context 'with own post' do
        it { expect{ delete :destroy, id: comment.id, post_id: comment.post.id, format: :json }.to change(Comment, :count).by(-1) }
      end

      context "with someone else's post" do
        let!(:comment2) { create(:comment) }

        it { expect{ delete :destroy, id: comment2.id, post_id: comment2.post.id, format: :json }.to change(Comment, :count).by(0) }

        it "attempt to delete a comment for a some else's post" do
          delete :destroy, id: comment2.id, post_id: comment2.post.id, format: :json
          expect(response.status).to eq(404)
        end
      end
    end

    context 'with invalid user' do
      it { expect{ delete :destroy, id: comment.id, post_id: comment.post.id, format: :json }.to change(Comment, :count).by(0) }

      it 'unauthorized access attempt' do
        delete :destroy, id: comment.id, post_id: comment.post.id, format: :json
        expect(response.status).to eq(401)
      end
    end
  end
end