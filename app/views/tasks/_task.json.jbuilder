json.extract! task, :id, :name, :project_id, :timer_started_at, :timer_paused_at, :created_at, :updated_at
json.url task_url(task, format: :json)
