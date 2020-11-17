module TasksHelper
  def checked(task)
    return "checked" if task.completed
  end
end
