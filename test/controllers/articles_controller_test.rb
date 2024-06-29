# test/controllers/articles_controller_test.rb

require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { title: "New Article", content: "Lorem ipsum" } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create search when pass title to index route" do
    assert_difference('Search.count') do
      get articles_url, params: { title: "New Article" }
    end

    assert_response :success
  end

end
