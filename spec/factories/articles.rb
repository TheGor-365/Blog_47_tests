FactoryBot.define do
  factory :article do
    title {'Article title'}
    text {'Article text'}

    # create factory article_with_comments
    # for create article with few comments
    factory :article_with_comments do
      # after article create
      after :create do |article, evaluater|
        # create list of three comments for the article
        create_list :comment, 3, article: article
      end
    end
  end
end
