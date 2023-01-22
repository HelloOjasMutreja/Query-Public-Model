require "application_system_test_case"

class QueriesTest < ApplicationSystemTestCase
  setup do
    @query = queries(:one)
  end

  test "visiting the index" do
    visit queries_url
    assert_selector "h1", text: "Queries"
  end

  test "should create query" do
    visit queries_url
    click_on "New query"

    fill_in "Title", with: @query.title
    click_on "Create Query"

    assert_text "Query was successfully created"
    click_on "Back"
  end

  test "should update Query" do
    visit query_url(@query)
    click_on "Edit this query", match: :first

    fill_in "Title", with: @query.title
    click_on "Update Query"

    assert_text "Query was successfully updated"
    click_on "Back"
  end

  test "should destroy Query" do
    visit query_url(@query)
    click_on "Destroy this query", match: :first

    assert_text "Query was successfully destroyed"
  end
end
