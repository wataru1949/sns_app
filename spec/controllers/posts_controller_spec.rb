require "rails_helper"

describe PostsController do
  let(:user) { create(:user) }

  describe "#new" do
    context "ログインしている場合" do
      before do
        login user
        get :new
      end
      example "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
      example "@postに新規投稿を割り当てること" do
        expect(assigns(:post)).to be_a_new(Post)
      end
      example "new.htmlを表示すること" do
        expect(response).to render_template :new
      end
    end
    context "ログインしていない場合" do
      before do
        get :new
      end
      example "リクエストは302 リダイレクトとなること" do
        expect(response.status).to eq 302
      end
      example "ログイン画面に遷移すること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#index" do
    before do
      get :index
    end
    example "リクエストは200 OKとなること"  do
      expect(response.status).to eq 200
    end
    example "@postsに要求された投稿を割り当てること" do
      posts = create_list(:post, 3)
      expect(assigns(:posts)).to match(posts.sort{|a, b| b.created_at <=> a.created_at })
    end
    example "index.htmlに遷移すること" do
      expect(response).to render_template :index
    end
  end

  describe "#show" do
    let(:post) { create(:post) }
    context "ログインしている場合" do
      before do
        login user
        get :show, params: { id: post }
      end
      example "@commentに新規コメントを割り当てること" do
        expect(assigns(:comment)).to be_a_new(Comment)
      end    
    end
    context "ログインしていない場合" do
      before do
        get :show, params: { id: post }
      end
      example "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
      example "@postに要求された投稿を割り当てること" do
        expect(assigns(:post)).to eq post
      end
      example "show.htmlに遷移すること" do
        expect(response).to render_template :show
      end
    end
    context '要求された投稿が存在しない場合' do
      example 'リクエストはRecordNotFoundとなること' do
        expect{get 'show', params: { id: 0 }}.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "#edit" do
    let(:post) { create(:post, user: user) }
    context "ログインしている場合" do
      before do
        login user
      end
      before do
        get :edit, params: { id: post }
      end
      example "リクエストは200 OKとなること" do
        expect(response.status).to eq 200
      end
      example "@postに要求された投稿を割り当てること" do
        expect(assigns(:post)).to eq post
      end
      example "edit.htmlに遷移すること" do
        expect(response).to render_template :edit
      end
    end
    context "ログインしていない場合" do
      before do
        get :edit, params: { id: post }
      end
      example "リクエストは302 リダイレクトとなること" do
        expect(response.status).to eq 302
      end
      example "ログイン画面に遷移すること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#update" do
    let(:post) { create(:post, user: user) }
    context "ログインしている場合" do
      before do
        login user
      end
      context "保存に成功した場合" do
        before do
          post_params = FactoryBot.attributes_for(:post, title: "New Title")
          patch :update, params: { id: post.id, post: post_params }
        end
        example "リクエストは302 リダイレクトとなること" do
          expect(response.status).to eq 302
        end
        example "postを保存すること" do
          expect( post.reload.title ).to eq "New Title"
        end
        example "show.htmlへリダイレクトすること" do
          expect(response).to redirect_to(post_path(post))
        end
      end
      context "保存に失敗した場合" do
        before do
          post_params = FactoryBot.attributes_for(:post, title: "")
          patch :update, params: { id: post.id, post: post_params }
        end
        example "リクエストは200 OKとなること" do
          expect(response.status).to eq 200
        end
        example "postを保存しないこと" do
          expect( post.reload.title ).to eq post.title
        end
        example "edit.htmlに戻ること" do
          expect(response).to render_template :edit 
        end
      end
    end
    context "ログインしていない場合" do
      before do
        post_params = FactoryBot.attributes_for(:post, title: "New Title")
        patch :update, params: { id: post.id, post: post_params }
      end
      example "リクエストは302 リダイレクトとなること" do
        expect(response.status).to eq 302
      end
      example "ログイン画面に遷移すること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    # context "別ユーザーの投稿を更新しようとした場合"
    # before do
    #   post_params = FactoryBot.attributes_for(:post, title: "New Title")
    #   patch :update, params: { id: post.id, post: post_params }
    # end
  end

  describe "#create" do
    let(:params) { { user_id: user.id, post: attributes_for(:post) } }
    context "ログインしている場合" do
      before do
        login user
      end
      context "保存に成功した場合" do
        subject { 
          post :create,
          params: params
        }
        example "リクエストは302 リダイレクトとなること" do
          subject
          expect(response.status).to eq 302
        end
        example "postを保存すること" do
          expect{ subject }.to change(Post, :count).by(1)  
        end
        example "rootへリダイレクトすること" do
          subject
          expect(response).to redirect_to(root_path)
        end
      end
      context "保存に失敗した場合" do
        let(:invalid_params) { { user_id: user.id, post: attributes_for(:post, title: nil, post_image: nil) } }
        subject { 
          post :create,
          params: invalid_params
        }
        example "リクエストは200 OKとなること" do
          subject
          expect(response.status).to eq 200
        end
        example "postを保存しないこと" do
          expect{ subject }.not_to change(Post, :count)
        end
        example "new.htmlに戻ること" do
          subject
          expect(response).to render_template :new  
        end
      end
    end
    context "ログインしていない場合" do
      before do
        post :create, params: params
      end
      example "リクエストは302 リダイレクトとなること" do
        expect(response.status).to eq 302
      end
      example "ログイン画面に遷移すること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end