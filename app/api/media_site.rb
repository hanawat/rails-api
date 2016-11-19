module MediaSite
  class API < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    # Article API
    resource :articles do

      # GET api/v1/articles/public
      desc 'Return public Articles with Author'
      get :public do
        Article.where(status: true).limit(20).as_json(include: :author)
      end

      # GET api/v1/articles/:id
      # = "get ':id' do end"
      route_param :id do
        desc 'Return a public Article with Author'
        get do
          Article.find_by(id: params[:id], status: true).as_json(include: :author)
        end
      end

      # POST api/v1/articles
      desc 'Create a Article'
      params do
        requires :title, type: String, desc: 'article title'
        requires :author_id, type: Integer, desc: 'article author id'
      end
      post do
        Article.create(title: params[:title], author_id: params[:author_id])
      end

      # DELETE api/v1/articles/:id
      desc 'Delete a Article'
      params do
        requires :id, type: Integer, desc: 'article id'
      end
      delete ':id' do
        Article.find(params[:id]).destroy
      end
    end

    # Author API
    resource :authors do

      # GET api/v1/authors/all
      desc 'Return all Authors'
      get :all do
        Author.all.limit(20)
      end

      # GET api/v1/authors/:id
      desc 'Return a Author'
      params do
        requires :id, type: Integer, desc: 'author id'
      end
      get ':id' do
        Author.find_by(id: params[:id])
      end

      # POST api/v1/authors
      desc 'Create a Author'
      params do
        requires :name, type: String, desc: 'author name'
      end
      post do
        Author.create(name: params[:name])
      end

      # DELETE api/v1/authors/:id
      desc 'Delete a Author'
      params do
        requires :id, type: Integer, desc: 'author id'
      end
      delete ':id' do
        Author.find(params[:id]).destroy
      end

      # GET api/v1/authors/:id/articles
      desc 'Return a Author with Articles'
      params do
        requires :id, type: Integer, desc: 'author id'
      end
      resource ':id' do
        get :articles do
          Author.find_by(id: params[:id]).as_json(include: :articles)
        end
      end
    end

  end
end
