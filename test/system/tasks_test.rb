require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit tasks_url
    click_on "New task"

    fill_in "Name", with: @task.name
    fill_in "Project", with: @task.project_id
    fill_in "Timer paused at", with: @task.timer_paused_at
    fill_in "Timer started at", with: @task.timer_started_at
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "should update Task" do
    visit task_url(@task)
    click_on "Edit this task", match: :first

    fill_in "Name", with: @task.name
    fill_in "Project", with: @task.project_id
    fill_in "Timer paused at", with: @task.timer_paused_at
    fill_in "Timer started at", with: @task.timer_started_at
    click_on "Update Task"
    

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "should destroy Task" do
    visit task_url(@task)
    click_on "Destroy this task", match: :first

    assert_text "Task was successfully destroyed"
  end
end