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
        "inserted_at" => todo.inserted_at |> Timex.format("{ISO:Extended:Z}"),
        "updated_at" => todo.updated_at
      }]
    }
  end
end
