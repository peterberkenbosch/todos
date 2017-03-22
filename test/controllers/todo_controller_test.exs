defmodule Todos.TodoControllerTest do
  use Todos.ConnCase
  use Timex

  test "#index renders a list of todos" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :index)

    assert json_response(conn, 200) == %{
      "todos" => [%{
        "title" => todo.title,
        "description" => todo.description,
        "inserted_at" => Timex.format!(todo.inserted_at, "{ISO:Extended}"),
        "updated_at" => Timex.format!(todo.updated_at, "{ISO:Extended}")
      }]
    }
  end
end
