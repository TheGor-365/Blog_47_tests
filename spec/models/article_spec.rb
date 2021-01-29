require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end

  describe 'assoceations' do
    it { should have_many :comments }
  end

  describe 'subject' do
    it 'returns the article title' do
      #create article object
      article = create(:article, title: 'Article for test')
      #assert, checking
      expect(article.subject).to eq 'Article for test'
    end
  end

  describe 'last_comment' do
    it 'returns last comment' do
      # create article with comments
      article = create(:article_with_comments)

      # checking
      expect(article.last_comment.body).to eq 'comment body 3'
    end
  end
end
