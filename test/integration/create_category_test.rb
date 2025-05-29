require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "get new category form" do 
    get '/categories/new'
    assert_response :success
    assert_difference('Category.count', 1) do 
      post categories_url, params: {category: { name: "Travel" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Travel', response.body
  end
end
